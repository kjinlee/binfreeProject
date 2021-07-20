package com.binfree.web.buddy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.binfree.web.buddy.domain.*;
import com.binfree.web.buddy.service.*;
import com.binfree.web.form.service.FormService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/admin/buddy/*")
@Controller
public class BuddyController {
	private BuddyService service;
	private FormService fService;

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list");
		model.addAttribute("list", service.getBuddyList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 56));

		int total = service.getBuddyTotal(cri);

		log.info("total: " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@GetMapping("/buddyRegister")
	public void buddyRegister() {

	}

	@PostMapping("/buddyRegister")
	public String buddyRegister(BuddyVO buddy, RedirectAttributes rttr, @RequestParam("id") long id) {
		log.info("buddyRegister: " + buddy);
		
		service.register(buddy);

		fService.remove(id);
		
		rttr.addFlashAttribute("result", buddy.getId());
		
		return "redirect:/admin/form/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("id") long id, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or /modify");
		model.addAttribute("buddy", service.get(id));

	}

	@PostMapping("/modify")
	public String modify(BuddyVO buddy, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + buddy);
		if (service.modify(buddy)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/admin/buddy/list";
	}

	@PostMapping
	public String remove(@RequestParam("id") long id, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove..." + id);
		if (service.remove(id)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/admin/buddy/list";
	}
	
	@GetMapping("/withbfamily")
	   public void withBfamily(@RequestParam("id") long id, Criteria cri, Model model) {

	      int total = service.getBfamilyListTotal(cri.getPageNum(), cri.getAmount(), id, cri.getType(), cri.getTypeArr(),
	            cri.getKeyword());

	      model.addAttribute("list", service.getBfamilyList(cri.getPageNum(), cri.getAmount(), id, cri.getType(),
	            cri.getTypeArr(), cri.getKeyword()));
	      model.addAttribute("id", id);
	      model.addAttribute("total", total);
	      model.addAttribute("pageMaker", new PageDTO(cri, total));

	   }

}

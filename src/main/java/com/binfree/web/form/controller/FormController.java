package com.binfree.web.form.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.binfree.web.form.domain.Criteria;
import com.binfree.web.form.domain.FormVO;
import com.binfree.web.form.domain.PageDTO;
import com.binfree.web.form.service.FormService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/form/*")
@AllArgsConstructor
public class FormController {
	
	private FormService service;
	
//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list");
//		model.addAttribute("list", service.getFormList());
//	}
	
	@GetMapping({"/list"})
	public void list(Criteria cri, Model model) {
		int total = service.getFormTotal(cri);
		
		log.info("list");
		log.info("total: " + total);
		
		model.addAttribute("list", service.getFormList(cri));		
		model.addAttribute("pageMaker", new PageDTO(cri, total));		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(FormVO form, RedirectAttributes rttr) {
		log.info("register: " + form);
		service.register(form);
		
		rttr.addFlashAttribute("result", form.getId());
		
		return "redirect:/";
	}

	@GetMapping({"/get", "/modify", "/buddyRegister"})
	public void get(@RequestParam("id") long id, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or /modify or /buddyRegister");
		model.addAttribute("form", service.get(id));

	}
	
	@PostMapping("/modify")
	public String modify(FormVO form, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + form);
		if(service.modify(form)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		// 검색 기능 추가
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/admin/form/list";
	}
	
	@PostMapping
	public String remove(@RequestParam("id") long id, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove..." + id);
		if(service.remove(id)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		// 검색 기능 추가
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/admin/form/list";
	}
	
}


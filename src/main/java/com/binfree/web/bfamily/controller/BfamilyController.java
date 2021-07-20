package com.binfree.web.bfamily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.binfree.web.bfamily.domain.BfamilyVO;
import com.binfree.web.bfamily.domain.Criteria;
import com.binfree.web.bfamily.domain.PageDTO;
import com.binfree.web.bfamily.service.BfamilyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Controller
@RequestMapping("admin/bfamily/*")
@AllArgsConstructor
public class BfamilyController {
	
	private BfamilyService service;

	@GetMapping("/list")
	public void adminpage(Criteria cri, Model model) {
		log.info("adminpage");
		
		// Bfamily 받아오는 부분
		log.info("BFamily List load by controller....");
		model.addAttribute("bflist", service.getBFamilyListWithPaging(cri));
		
		int total = service.getBFamilyTotal(cri);
		
		log.info("BFamily List total: "+ total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@PostMapping
	public String remove(@RequestParam("id") int id, RedirectAttributes rttr) {
		log.info("user remove by controller..." + id);
		if(service.remove(id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/bfamily/list";
	}
	
	@GetMapping("/bfamilyModify")
	public void get(@RequestParam("id") int id, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("modify by controller.....");
		model.addAttribute("bflist", service.get(id));
	}
	
	@PostMapping("/bfamilyModify")
	public String modify(BfamilyVO bfamily, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("post userModify by controller....");
		if(service.modify(bfamily)) {
			rttr.addFlashAttribute("result","success");
		}
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		
		// 검색 기능 추가
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/admin/bfamily/list";
	}
}


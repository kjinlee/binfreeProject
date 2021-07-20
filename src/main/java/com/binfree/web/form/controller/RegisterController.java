package com.binfree.web.form.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.binfree.web.form.domain.FormVO;
import com.binfree.web.form.service.FormService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/form/*")
@AllArgsConstructor
public class RegisterController {
	
	private FormService service;
	
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

}

package com.binfree.web.main.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.binfree.web.review.domain.Criteria;
import com.binfree.web.buddy.service.BuddyService;
import com.binfree.web.main.service.MainService;
import com.binfree.web.review.domain.PageMakerDTO;
import com.binfree.web.review.domain.ReviewVO;
import com.binfree.web.review.service.ReviewService;
import com.binfree.web.user.domain.UsersVO;
import com.binfree.web.user.security.CustomUserDetails;
import com.binfree.web.user.service.UsersService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
@AllArgsConstructor
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	private MainService mainService;

	private ReviewService service;

	private BuddyService buddyService;

	private UsersService userService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Criteria cri) {

		// 요한
		int total = service.getTotal();
		int star = service.getStarTotal();
		int starSum = star / total;

		// 버디수
		int buddyTotal = buddyService.getTotalCountForHome();

		int userTotal = userService.userCount();
//		
//		CustomUserDetails user = header();
//		model.addAttribute("user", user);
//
		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("starSum", starSum);
		model.addAttribute("buddyTotal", buddyTotal);
		model.addAttribute("userTotal", userTotal);

		// 승연
		List<ReviewVO> list = mainService.getReviewList();

		model.addAttribute("list", list);

		System.out.println(list);

		return "home";
	}

	@RequestMapping(value = "/service", method = RequestMethod.GET)
	public void service() {

	}

	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public void intro() {

	}

	@PostMapping("getUserInfo")
	@ResponseBody
	public Model header(Model model) throws JsonProcessingException {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		if (authentication != null) {
			CustomUserDetails loginUserVO = (CustomUserDetails) authentication.getPrincipal();
			CustomUserDetails loginUserInfo = new CustomUserDetails();

			loginUserInfo = userService.getLoginUserInfo(loginUserVO.getUsername());

			CustomUserDetails user = new CustomUserDetails();
			user = userService.getLoginUserInfo(loginUserVO.getUsername());

			model.addAttribute("user", user);

			return model;

		} else {

			return null;

		}

	}
	
	

}

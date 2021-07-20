package com.binfree.web.subscribe.controller;

import java.net.URLDecoder;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.binfree.web.buddy.domain.BuddyVO;
import com.binfree.web.buddy.service.BuddyServiceImple;
import com.binfree.web.review.domain.Criteria;
import com.binfree.web.review.domain.PageMakerDTO;
import com.binfree.web.review.service.ReviewServiceImpl;
import com.binfree.web.subscribe.domain.SubscribeVO;
import com.binfree.web.subscribe.service.SubscribeServiceImpl;
import com.binfree.web.user.domain.UsersVO;
import com.binfree.web.user.security.CustomUserDetails;
import com.binfree.web.user.service.UsersServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/subscribe/*")
@Log4j
@AllArgsConstructor
public class SubscribeController {

	private SubscribeServiceImpl subservice;

	private ReviewServiceImpl rservice;

	private UsersServiceImpl userService;

	private BuddyServiceImple buddyService;

	@GetMapping("/main")
	public void subscribe(Model model, Criteria cri) {

		for (int i = 0; i < subservice.getSubInfo().size(); i++) {

				// 스타터
			if (subservice.getSubInfo().get(i).getSubId() == 1) {
				model.addAttribute("starter", subservice.getSubInfo().get(i));

				// 베스트
			} else if (subservice.getSubInfo().get(i).getSubId() == 2) {
				model.addAttribute("best", subservice.getSubInfo().get(i));

				// 프리미엄
			} else if (subservice.getSubInfo().get(i).getSubId() == 3) {
				model.addAttribute("primium", subservice.getSubInfo().get(i));
			}
		}

		log.info("리뷰 리스트 조회");

		// 별점별 평균
		model.addAttribute("starNum", rservice.getStarNum());

		// 페이징 및 리스트
		int total = rservice.getTotal();
		int star = rservice.getStarTotal();
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		model.addAttribute("list", rservice.getListWithPaging(cri));

		// 별점 평균
		double starSum = (double) star / (double) total;
		model.addAttribute("starSum", Math.round(starSum * 100) / 100.0);

	}

	@GetMapping("/order")
	public void order(Model model, SubscribeVO sub) {

		model.addAttribute("sub", sub);
	}

	@GetMapping("/pay")
	public void pay(Model model, SubscribeVO sub, UsersVO user) throws Exception {
		// 개월 수 확인
		if (user.getSubItem().equals("스타터")) {
			sub.setSubPrice("3900");
		} else if (user.getSubItem().equals("베스트")) {
			sub.setSubPrice("19900");
		} else if (user.getSubItem().equals("프리미엄")) {
			sub.setSubPrice("34900");
		}

		model.addAttribute("sub", sub);
		model.addAttribute("user", user);

	}

	@PostMapping("/matching")
	public void matching(UsersVO vo, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUserDetails loginUserVO = (CustomUserDetails) authentication.getPrincipal();
		CustomUserDetails loginUserInfo = new CustomUserDetails();

		loginUserInfo = userService.getLoginUserInfo(loginUserVO.getUsername());

		UsersVO user = new UsersVO();

		user.setEmail(loginUserInfo.getEmail());
		user.setSubItem(vo.getSubItem());
		user.setSubName(vo.getSubName());
		user.setSubPhone(vo.getSubPhone());
		user.setZipCode(vo.getZipCode());
		user.setLoc(vo.getLoc());
		user.setInputLoc(vo.getInputLoc());
		user.setSubStart(vo.getSubStart());

		if (user.getSubItem().equals("스타터")) {
			user.setSubEnd("1");
		} else if (user.getSubItem().equals("베스트")) {
			user.setSubEnd("6");
		} else if (user.getSubItem().equals("프리미엄")) {
			user.setSubEnd("12");
		}

		userService.setSubInfo(user);

	}

	@GetMapping("/matching")
	public void matchingGet(String email, String zipCode, Model model) {
		model.addAttribute("zipCode", zipCode);
		model.addAttribute("email", email);
		log.info(zipCode);
	}

	@GetMapping("/match")
	public String matchedPost(String email, String zipCode, Model model) {

		// 버디 정보 불러오기
		List<BuddyVO> buddy = buddyService.getBuddyLoc(zipCode);
		UsersVO vo = new UsersVO();

		log.info(zipCode);
		log.info(email);

		// 버디 섞기
		try {
			Collections.shuffle(buddy);

			int idx = new Random().nextInt(buddy.size());

			BuddyVO bName = buddy.get(idx);

			Long bId = bName.getId();

			// 구독자 정보에 buddy 정보에 업데이트하기
			vo = userService.getUserInfo(email);

			vo.setMyBuddy(bId);

			userService.setBuddy(vo);

			return "/subscribe/match";
		} catch (Exception e) {
			// 에러 페이지 만들기
			return "/subscribe/error";
		}
	}

	// 구독 정보 확인
	@RequestMapping(value = "/subCheck", method = RequestMethod.POST)
	@ResponseBody
	public String subItemCheck(String email/* email이 잘 받아와지는 지 확인하시고 안 받아와지면 @RequestParam Map<String, String> paramMap */)
			throws Exception {
		
		String name = URLDecoder.decode(email, "UTF-8");

		log.info(name);
		System.out.println("aaaaaaaaaaaaaaaaa"+name);
		UsersVO user = userService.getUserInfo(name);

		if (user.getSubItem() == null) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

}

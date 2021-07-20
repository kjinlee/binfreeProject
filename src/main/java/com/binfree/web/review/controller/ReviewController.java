package com.binfree.web.review.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.binfree.web.review.domain.Criteria;
import com.binfree.web.review.domain.PageMakerDTO;
import com.binfree.web.review.domain.ReviewVO;
import com.binfree.web.review.service.ReviewServiceImpl;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")
@Log4j
public class ReviewController {
	
	@Autowired
	private ReviewServiceImpl service;
	
	private String fileFullPath;

	@GetMapping("/list")
	public void getListWithPaging(Model model, Criteria cri) throws Exception {

		log.info("리뷰 리스트 조회");

		// 별점별 평균
		model.addAttribute("starNum", service.getStarNum());

		// 페이징 및 리스트
		int total = service.getTotal();
		int star = service.getStarTotal();
		
		
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		
		
		model.addAttribute("pageMaker", pageMake);
		model.addAttribute("list", service.getListWithPaging(cri));

		// 별점 평균
		double starSum = (double) star / (double) total;
		model.addAttribute("starSum", Math.round(starSum * 100) / 100.0);
	}

	@PostMapping("/insert")
	public String insert(ReviewVO vo, Model model, RedirectAttributes rtts) {
		log.info("글 등록: " + vo);
		System.out.println(service.getStarNum());

		System.out.println(vo.getEmail());
		
		System.out.println(fileFullPath);
		
		vo.setImg(fileFullPath);

		service.reviewInsert(vo);
		

		rtts.addFlashAttribute("result", vo.getId());
		model.addAttribute("email", vo.getEmail());

		return "redirect:/subscribe/main";
	}

	@GetMapping("/get")
	public String get(@RequestParam("id") int id, Model model) {

		log.info("/get" + id);
		model.addAttribute("vo", service.get(id));

		return "redirect:/subscribe/main";
	}

	@PostMapping("/update")
	@ResponseBody
	public void update(@RequestParam Map<String, String> paramMap, RedirectAttributes rtts) {
		System.out.println(paramMap.get("id"));

		ReviewVO vo = new ReviewVO();
		vo.setId(Integer.parseInt(paramMap.get("id")));
		vo.setStar(Integer.parseInt(paramMap.get("star")));
		vo.setContents(paramMap.get("contents"));
		if (service.reviewUpdate(vo)) {
			rtts.addFlashAttribute("result", "success");
		}
	}

	@GetMapping("/delete")
	public String remove(@RequestParam Map<String, String> paramMap, RedirectAttributes rtts) {
		log.info("delete" + paramMap.get("id"));

		if (service.reviewDelete(Integer.parseInt(paramMap.get("id")))) {
			rtts.addFlashAttribute("result", "success");
		}
		return "redirect:/subscribe/main";
	}
	
	@GetMapping("/fileUpload")
	public void uploadd() {
		
	}

	@RequestMapping(value = "/upload") // ajax에서 호출하는 부분
	@ResponseBody
	public String upload(MultipartHttpServletRequest multipartRequest) { // Multipart로 받는다.

		Iterator<String> itr = multipartRequest.getFileNames();

		String filePath = "/Users/kj/upload"; // 설정파일로 뺀다.

		while (itr.hasNext()) { // 받은 파일들을 모두 돌린다.

			/*
			 * 기존 주석처리 MultipartFile mpf = multipartRequest.getFile(itr.next()); String
			 * originFileName = mpf.getOriginalFilename();
			 * System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
			 */

			MultipartFile mpf = multipartRequest.getFile(itr.next());

			String originalFilename = mpf.getOriginalFilename(); // 파일명

			fileFullPath = filePath + "/" + originalFilename; // 파일 전체 경로

			try {
				// 파일 저장
				mpf.transferTo(new File(fileFullPath)); // 파일저장 실제로는 service에서 처리

				System.out.println("originalFilename => " + originalFilename);
				System.out.println("fileFullPath => " + fileFullPath);

			} catch (Exception e) {
				System.out.println("postTempFile_ERROR======>" + fileFullPath);
				e.printStackTrace();
			}

		}

		return "success";
	}
	
	public String maskingName(String name){
	    String maskedName = "";    // 마스킹 이름
	    String firstName = "";    // 성
	    String lastName = "";    // 이름
	    int lastNameStartPoint;    // 이름 시작 포인터
	 
	    if(!name.equals("") || name != null){
	        if(name.length() > 1){
	            firstName = name.substring(0, 1);
	            lastNameStartPoint = name.indexOf(firstName);
	            lastName = name.substring(lastNameStartPoint + 1, name.length());
	 
	            String makers = "";
	 
	            for(int i = 0; i < lastName.length(); i++){
	                makers += "*";
	            }
	 
	            lastName = lastName.replace(lastName, makers);
	            maskedName = firstName + lastName;
	        }else{
	            maskedName = "*";
	        }
	    }
	 
	    return maskedName;
	}




}

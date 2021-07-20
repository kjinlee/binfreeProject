package com.binfree.web.goods.controller;

import java.io.File;
import java.util.Iterator;
import java.util.Map;

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

import com.binfree.web.goods.domain.Criteria;
import com.binfree.web.goods.domain.GoodsVO;
import com.binfree.web.goods.domain.PageMakerDTO;
import com.binfree.web.goods.service.GoodsService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/goods/*")
@Log4j
public class GoodsController {
	
	@Autowired
	private GoodsService service;
	
	private String fileFullPath;
	
	private String originalFilename;
	
	@GetMapping("/list")
	public void getList(Model model, Criteria cri) {
		
		log.info("리부  리스트 조회");
		
		int total = service.getGoodsTotal();
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", service.getList(cri));
	}
	
	

	
	@GetMapping("/info")
	public void info(Model model, GoodsVO vo ,@RequestParam("id") int id) {
			model.addAttribute("goods" , service.get(id));
	}
	
	@GetMapping("/form")
	public void form(Model model, GoodsVO vo, RedirectAttributes rtts) {
		
	}
	
	@PostMapping("/insert")
	public String insert(GoodsVO vo, Model model, RedirectAttributes rtts) {
		
		vo.setPic(originalFilename);
		
		service.goodsInsert(vo);
		
		
		
		rtts.addFlashAttribute("result", vo.getId());
		
		return "redirect:/goods/list";
	}

	@GetMapping("/get")
	public void get(@RequestParam("id") int id, Model model) {
		
		model.addAttribute("vo", service.get(id));
		
	}
	@GetMapping("/update")
	public void update(Model model, GoodsVO vo, @RequestParam("id") int id) {
		model.addAttribute("goods",service.get(id));
	}
	
	@PostMapping("/update")
	@ResponseBody
	public String update(@RequestParam Map<String, String> paramMap, RedirectAttributes rtts) {
		
		GoodsVO vo = new GoodsVO();
		
		vo.setId(Integer.parseInt(paramMap.get("id"))); //제품번호
		vo.setGoodsName(paramMap.get("goodsName")); //제품명
		vo.setPic(originalFilename);//이미지
		vo.setContents(paramMap.get("contents")); //제품설명
		vo.setOption1(paramMap.get("option1")); //제품옵션
		vo.setOption2(paramMap.get("option2")); 
		vo.setOption3(paramMap.get("option3"));
		vo.setSubName(paramMap.get("subName"));
		
		if(service.goodsUpdate(vo)) {
			rtts.addFlashAttribute("result", "success");
		}
		
		return "redirect:/goods/list";
	}
	
	@GetMapping("/delete")
	public String remove(@RequestParam Map<String, String> paramMap, RedirectAttributes rtts) {
		
		if(service.goodsDelete(Integer.parseInt(paramMap.get("id"))));{
			rtts.addFlashAttribute("result","success");
		}
		
		return "redirect:/goods/list";
	}
	
	@RequestMapping(value = "/upload") // ajax에서 호출하는 부분
	@ResponseBody
	public String upload(MultipartHttpServletRequest multipartRequest) { // Multipart로 받는다.

		Iterator<String> itr = multipartRequest.getFileNames();

		String filePath = "/Users/kj/Desktop/FinalProject/BinFreeProject3/src/main/webapp/resources/img/goods"; // 설정파일로 뺀다.
		while (itr.hasNext()) { // 받은 파일들을 모두 돌린다.

			/*
			 * 기존 주석처리 MultipartFile mpf = multipartRequest.getFile(itr.next()); String
			 * originFileName = mpf.getOriginalFilename();
			 * System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
			 */

			MultipartFile mpf = multipartRequest.getFile(itr.next());

			originalFilename = mpf.getOriginalFilename(); // 파일명

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
	
	@RequestMapping(value = "/deleteFile") // ajax에서 호출하는 부분
	@ResponseBody
	public String deleteFile(int id, String fileName) { // Multipart로 받는다.
		
			GoodsVO goods = new GoodsVO();
			
			goods.setId(id);
			goods.setPic(fileName);
			
			try {
				service.deleteFile(goods);
				System.out.println("originalFilename 삭제 => " + originalFilename);
				
				
			} catch (Exception e) {
				System.out.println("postTempFile_ERROR======>" + fileFullPath);
				e.printStackTrace();
			}
			
		
		return "success";
	}
	
}












package com.binfree.web.upload.controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
@Log4j
@Controller
public class UploadController {
	
	@PostMapping("/uploadAjaxAction")
	@ResponseBody
	public void uploadFormPost(MultipartFile[] pic) {
		log.info("upload ajax post.....");
		
		// 절대 경로를 설정해야 함
		String uploadFolder = "C:\\eclipseWorkspace\\SpringJS\\BinFreeProjectTable\\src\\main\\webapp\\resources\\img\\buddy";
		
		for(MultipartFile multipartFile : pic) {
			log.info("--------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+ 1);
			
			log.info("only file name: " + uploadFileName);
			
			File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
}

package com.binfree.web.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.binfree.web.goods.domain.CommentVO;
import com.binfree.web.goods.service.CommentServiceImpl;

@Controller
@RequestMapping("/comment/**")
public class CommentController {
	
	@Autowired
    CommentServiceImpl service;
    
    
    @RequestMapping("/list") //댓글 리스트
    @ResponseBody
    private List<CommentVO> serviceList(Model model, int bno, int startNum) throws Exception{
    	Map<String, Object> paramMap = new HashMap<String, Object>();
    	paramMap.put("bno", bno);
    	paramMap.put("startNum", startNum);
        
    	model.addAttribute("cmt" , service.commentListService(paramMap));
    	
        return service.commentListService(paramMap);
    }
    
    @PostMapping("/insert") //댓글 작성 
    @ResponseBody
    private int serviceInsert(@RequestParam String writer, @RequestParam int bno, @RequestParam String content, @RequestParam String email) throws Exception{
        
        CommentVO comment = new CommentVO();
        comment.setBno(bno);
        comment.setContent(content);
        comment.setEmail(email);
        
        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.
        comment.setWriter(writer);  
        
        return service.commentInsertService(comment);
    }
    
    @PostMapping("/update") //댓글 수정  
    @ResponseBody
    private int serviceUpdateProc(@RequestParam int cno, @RequestParam String content) throws Exception{
        
        CommentVO comment = new CommentVO();
        comment.setCno(cno);
        comment.setContent(content);
        
        return service.commentUpdateService(comment);
    }
    
    @PostMapping("/delete/{cno}") //댓글 삭제  
    @ResponseBody
    private int serviceDelete(@PathVariable int cno) throws Exception{
    	
        return service.commentDeleteService(cno);
    }
    
}
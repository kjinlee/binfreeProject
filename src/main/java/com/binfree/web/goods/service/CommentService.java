package com.binfree.web.goods.service;

import java.util.List;
import java.util.Map;

import com.binfree.web.goods.domain.CommentVO;

public interface CommentService {
	    
	    public List<CommentVO> commentListService(Map<String, Object> paramMap) throws Exception;
	    
	    public int commentInsertService(CommentVO comment) throws Exception;
	    
	    public int commentUpdateService(CommentVO comment) throws Exception;
	    
	    public int commentDeleteService(int cno) throws Exception;

}
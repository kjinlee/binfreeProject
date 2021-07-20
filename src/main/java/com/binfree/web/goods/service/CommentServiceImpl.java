package com.binfree.web.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.binfree.web.goods.domain.CommentVO;
import com.binfree.web.goods.mapper.CommentMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CommentServiceImpl implements CommentService {
	
	private CommentMapper mapper;
	
	public List<CommentVO> commentListService(Map<String, Object> paramMap) throws Exception {

		return mapper.commentList(paramMap);
	}

	public int commentInsertService(CommentVO comment) throws Exception {

		return mapper.commentInsert(comment);
	}

	public int commentUpdateService(CommentVO comment) throws Exception {

		return mapper.commentUpdate(comment);
	}

	public int commentDeleteService(int cno) throws Exception{
        
        return mapper.commentDelete(cno);
    }

}
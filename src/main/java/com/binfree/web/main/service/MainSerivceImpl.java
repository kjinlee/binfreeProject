package com.binfree.web.main.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.binfree.web.main.mapper.MainMapper;
import com.binfree.web.review.domain.ReviewVO;

@Service
public class MainSerivceImpl implements MainService {

	@Autowired
	MainMapper mainMapper;
	
	@Override
	public List<ReviewVO> getReviewList() {
		
		RowBounds rowBounds = new RowBounds(0, 5);
		List<ReviewVO> reviewList = mainMapper.getReviewAll(rowBounds);
		
		return reviewList;
		
	}
	/*
	@Override
	public List<ReviewVO> getReviewList(int a) {
		
		RowBounds rowBounds = new RowBounds(0, 5);
		List<ReviewVO> reviewList = mainMapper.getReviewAll(a, rowBounds);
		
		return reviewList;
		
	}
	*/

}

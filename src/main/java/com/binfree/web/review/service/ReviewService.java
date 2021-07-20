package com.binfree.web.review.service;

import java.util.List;
import java.util.Map;

import com.binfree.web.review.domain.Criteria;
import com.binfree.web.review.domain.ReviewVO;

public interface ReviewService {
	/* 게시판 목록(페이징 적용) */
	public List<ReviewVO> getListWithPaging(Criteria cri);
	
	// 리뷰 총 갯수
	public int getTotal();

	// 리뷰 별 총 갯수
	public int getStarTotal();
	
	public ReviewVO get(int id);

	public int reviewInsert(ReviewVO name);

	public boolean reviewDelete(int id);

	public boolean reviewUpdate(ReviewVO name);
	
	public List<Map> getStarNum();
	
}

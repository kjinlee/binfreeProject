package com.binfree.web.main.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.binfree.web.review.domain.ReviewVO;

public interface MainMapper {
	
	public List<ReviewVO> getReviewAll(RowBounds rowBounds);
	
}

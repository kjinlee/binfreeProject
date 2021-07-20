package com.binfree.web.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.binfree.web.review.domain.Criteria;
import com.binfree.web.review.domain.ReviewVO;

public interface ReviewMapper {

	// 페이징
	public List<ReviewVO> getListWithPaging(Criteria cri);
	
	// 리뷰 총 갯수
	public int getTotal();
	
	// 리뷰 별 총 갯수
	public int getStarTotal();

	public ReviewVO get(int id);

	public int reviewInsert(ReviewVO name);

	public int reviewDelete(int id);

	public int reviewUpdate(ReviewVO name);
	
	public int getStarNum(@Param("star") int star);
	
}

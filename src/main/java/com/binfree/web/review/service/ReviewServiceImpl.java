package com.binfree.web.review.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.binfree.web.review.domain.Criteria;
import com.binfree.web.review.domain.ReviewVO;
import com.binfree.web.review.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_= @Autowired)
	private ReviewMapper mapper;

	@Override
	public List<ReviewVO> getListWithPaging(Criteria cri) {
		
		log.info("리뷰 리스트 작업 처리...");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int reviewInsert(ReviewVO review) {

		log.info("리뷰 등록 처리 ..." + review);

		return mapper.reviewInsert(review);
	}

	@Override
	public boolean reviewDelete(int id) {
		
		log.info("리뷰 삭제 처리 ...");
		
		return mapper.reviewDelete(id) == 1;
	}

	@Override
	public boolean reviewUpdate(ReviewVO review) {
		
		log.info("리뷰 수정 처리 ...");
		
		return mapper.reviewUpdate(review) == 1;
	}

	@Override
	public ReviewVO get(int id) {
		
		log.info("정보 불러오는 처리...");
		
		return mapper.get(id);
	}

	@Override
	public int getTotal() {
		
		return mapper.getTotal();
	}

	@Override
	public int getStarTotal() {
		
		return mapper.getStarTotal();
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> getStarNum() {
		List<Map> list = new ArrayList<Map>();
		HashMap<String, Object> star = new HashMap<String, Object>();
		
		double per = 0;
		String [] name = {"one","two","three","four","five"};
		for (int i = 0; i < 5; i++) {
			per = ((double)mapper.getStarNum(i+1) / (double)mapper.getTotal()) * 100;
			if(per >= 100) {
				per = 100;
				star.put(name[i], Math.round(per)+"%");
			}else {
				star.put(name[i], Math.round(per)+"%");
			}
		}
		
		list.add(star);
		
		return list;
	}

}





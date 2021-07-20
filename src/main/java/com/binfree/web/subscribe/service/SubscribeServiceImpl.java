package com.binfree.web.subscribe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.binfree.web.review.mapper.ReviewMapper;
import com.binfree.web.review.service.ReviewServiceImpl;
import com.binfree.web.subscribe.domain.SubscribeVO;
import com.binfree.web.subscribe.mapper.SubscribeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class SubscribeServiceImpl implements SubscribeService {
	
	@Setter(onMethod_ = @Autowired)
	private SubscribeMapper mapper;
	
	@Override
	public List<SubscribeVO> getSubInfo() {
		
		return mapper.getSubInfo();
	}

}

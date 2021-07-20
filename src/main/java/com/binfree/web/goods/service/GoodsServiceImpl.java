package com.binfree.web.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.binfree.web.goods.domain.Criteria;
import com.binfree.web.goods.domain.GoodsVO;
import com.binfree.web.goods.mapper.GoodsMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class GoodsServiceImpl implements GoodsService {
	
	private GoodsMapper mapper;
	
	@Override
	public List<GoodsVO> getList(Criteria cri){
		
		log.info("굿즈 리스트 작업");
		return mapper.getList(cri);
	}
	
	@Override
	public int goodsInsert(GoodsVO goods) {
		
		log.info("굿즈 등록" +goods);
		return mapper.goodsInsert(goods);
	}
	
	@Override
	public boolean goodsDelete(int id) {
		
		log.info("굿즈 삭제");
		
		return mapper.goodsDelete(id) ;
	}

	@Override
	public int getGoodsTotal() {
		return mapper.getGoodsTotal();
	}

	@Override
	public GoodsVO get(int id) {
		return mapper.get(id);
	}

	@Override
	public boolean goodsUpdate(GoodsVO vo) {
		return mapper.goodsUpdate(vo);
	}

	@Override
	public int deleteFile(GoodsVO vo) {
		return mapper.deleteFile(vo);
	}
	
	
	
}

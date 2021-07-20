package com.binfree.web.goods.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.binfree.web.goods.domain.Criteria;
import com.binfree.web.goods.domain.GoodsVO;

public interface GoodsService {
	
	//굿즈 상품 리스트
	public List<GoodsVO> getList(Criteria cri);
	
	//굿즈 상품  총 갯수
	public int getGoodsTotal();
	
	public GoodsVO get(int id);
	
	public int goodsInsert(GoodsVO name);
	
	public boolean goodsDelete(int id);
	
	public boolean goodsUpdate(GoodsVO vo);
	
	public int deleteFile(GoodsVO vo);

}

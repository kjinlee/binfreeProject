package com.binfree.web.bfamily.mapper;

import java.util.List;

import com.binfree.web.bfamily.domain.BfamilyVO;
import com.binfree.web.bfamily.domain.Criteria;

public interface BfamilyMapper {
	
	// 재성 추가
	public List<BfamilyVO> getBFamilyList();
	
	public int bfamilyDelete(long id);
	
	public BfamilyVO bfamilyRead(long id);
	
	public int bfamilyUpdate(BfamilyVO users);
	
	public List<BfamilyVO> getBFamilyListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
}

package com.binfree.web.bfamily.service;

import java.util.List;

import com.binfree.web.bfamily.domain.BfamilyVO;
import com.binfree.web.bfamily.domain.Criteria;

public interface BfamilyService {
	// 재성 추가
	// public List<UsersVO> getBFamilyList();
	
	public List<BfamilyVO> getBFamilyListWithPaging(Criteria cri);
	
	public int getBFamilyTotal(Criteria cri);
	
	public boolean remove(long id);
	
	public boolean modify(BfamilyVO users);
	
	public BfamilyVO get(long id);
	
}

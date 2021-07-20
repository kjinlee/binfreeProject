package com.binfree.web.buddy.service;

import java.util.List;

import com.binfree.web.buddy.domain.BuddyVO;
import com.binfree.web.buddy.domain.Criteria;
import com.binfree.web.user.domain.UsersVO;

public interface BuddyService {
	public void register(BuddyVO buddy);
	
	public BuddyVO get(long id);
	
	public boolean modify(BuddyVO buddy);
	
	public boolean remove(Long id);
	
//	public List<BuddyVO> getBuddyList();
	
	public List<BuddyVO> getBuddyList(Criteria cri);
	
	public int getBuddyTotal(Criteria cri);
	
	public int getTotalCountForHome();
	
	public List<BuddyVO> getBuddyLoc(String zipCode);
	
	public int getBfamilyListTotal(int pageNum, int amount, long id, String type, String[] typeArr, String keyword);
    
	public List<UsersVO> getBfamilyList(int pageNum, int amount, long id, String type, String[] typeArr, String keyword);
}

package com.binfree.web.buddy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.binfree.web.buddy.domain.BuddyVO;
import com.binfree.web.buddy.domain.Criteria;
import com.binfree.web.user.domain.UsersVO;

public interface BuddyMapper {
	public List<BuddyVO> getBuddyList();

	public List<BuddyVO> getBuddyListWithPaging(Criteria cri);

	public void buddyInsert(BuddyVO Buddy);

	public void buddyInsertSelectKey(BuddyVO Buddy);

	public int buddyDelete(Long id);

	public int buddyUpdate(BuddyVO Buddy);

	public int getTotalCount(Criteria cri);

	public BuddyVO buddyRead(Long id);

	public int getTotalCountForHome();

	public List<BuddyVO> getBuddyLoc(String zipCode);

	public int getBfamilyListTotal(@Param("pageNum") int pageNum, @Param("amount") int amount, @Param("id") long id,
			@Param("type") String type, @Param("typeArr") String[] typeArr, @Param("keyword") String keyword);

	public List<UsersVO> getBfamilyListWithPaging(@Param("pageNum") int pageNum, @Param("amount") int amount,
			@Param("id") long id, @Param("type") String type, @Param("typeArr") String[] typeArr,
			@Param("keyword") String keyword);
}

package com.binfree.web.buddy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.binfree.web.buddy.domain.BuddyVO;
import com.binfree.web.buddy.domain.Criteria;
import com.binfree.web.buddy.mapper.BuddyMapper;
import com.binfree.web.user.domain.UsersVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BuddyServiceImple implements BuddyService {

	private BuddyMapper mapper;

	@Override
	public void register(BuddyVO buddy) {
		log.info("register....." + buddy);
		mapper.buddyInsertSelectKey(buddy);
	}

	@Override
	public BuddyVO get(long id) {
		log.info("get......" + id);
		return mapper.buddyRead(id);
	}

	@Override
	public boolean modify(BuddyVO buddy) {
		log.info("modify......." + buddy);
		return mapper.buddyUpdate(buddy) == 1;
	}

	@Override
	public boolean remove(Long id) {
		log.info("remove......." + id);
		return mapper.buddyDelete(id) == 1;
	}

	@Override
	public List<BuddyVO> getBuddyList(Criteria cri) {
		log.info("getFormList with Criteria......" + cri);
		return mapper.getBuddyListWithPaging(cri);
	}

	@Override
	public int getBuddyTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public int getTotalCountForHome() {
		return mapper.getTotalCountForHome();
	}

	@Override
	public List<BuddyVO> getBuddyLoc(String zipCode) {

		return mapper.getBuddyLoc(zipCode);
	}

	@Override
	public int getBfamilyListTotal(int pageNum, int amount, long id, String type, String[] typeArr, String keyword) {
		return mapper.getBfamilyListTotal(pageNum, amount, id, type, typeArr, keyword);
	}

	@Override
	public List<UsersVO> getBfamilyList(int pageNum, int amount, long id, String type, String[] typeArr,
			String keyword) {
		return mapper.getBfamilyListWithPaging(pageNum, amount, id, type, typeArr, keyword);
	}

}
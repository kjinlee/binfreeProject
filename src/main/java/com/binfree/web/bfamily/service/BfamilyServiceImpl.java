package com.binfree.web.bfamily.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.binfree.web.bfamily.mapper.BfamilyMapper;
import com.binfree.web.bfamily.domain.Criteria;
import com.binfree.web.bfamily.domain.BfamilyVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class BfamilyServiceImpl implements BfamilyService {

	@Autowired
	private BfamilyMapper mapper;
	// 재성 추가
	@Override
	public List<BfamilyVO> getBFamilyListWithPaging(Criteria cri) {
		log.info("getBFamilyList with Criteria by serviceImple ");
		return mapper.getBFamilyListWithPaging(cri);
	}
	
	@Override
	public int getBFamilyTotal(Criteria cri) {
		log.info("getBFamilyTotal by serviceImple");
		return mapper.getTotalCount(cri);
	}

	@Override
	public boolean remove(long id) {
		log.info("remove by serviceImpl...." + id);
		return mapper.bfamilyDelete(id) == 1;
	}

	@Override
	public BfamilyVO get(long id) {
		log.info("get by serviceImpl....");
		return mapper.bfamilyRead(id);
	}

	@Override
	public boolean modify(BfamilyVO vo) {
		log.info("modify by serviceImpl...." + vo);
		return mapper.bfamilyUpdate(vo) == 1;
	}
	

}

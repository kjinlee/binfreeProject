package com.binfree.web.form.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.binfree.web.form.domain.Criteria;
import com.binfree.web.form.domain.FormVO;
import com.binfree.web.form.mapper.FormMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FormServiceImpl implements FormService{
	
	private FormMapper mapper;

	@Override
	public void register(FormVO form) {
		log.info("register....." + form);
		mapper.formInsertSelectKey(form);
	}

	@Override
	public FormVO get(long id) {
		log.info("get......" + id);
		return mapper.formRead(id);
	}

	@Override
	public boolean modify(FormVO form) {
		log.info("modify......." + form);
		return mapper.formUpdate(form) == 1;
	}

	@Override
	public boolean remove(Long id) {
		log.info("remove......." + id);
		return mapper.formDelete(id) == 1;
	}

//	@Override
//	public List<FormVO> getFormList() {
//		log.info("getFormList......");
//		return mapper.getFormList();
//	}
	
	@Override
	public List<FormVO> getFormList(Criteria cri) {
		log.info("getFormList with Criteria......" + cri);
		return mapper.getFormListWithPaging(cri);
	}

	@Override
	public int getFormTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
}

package com.binfree.web.form.service;

import java.util.List;

import com.binfree.web.form.domain.Criteria;
import com.binfree.web.form.domain.FormVO;

public interface FormService {
	public void register(FormVO form);
	
	public FormVO get(long id);
	
	public boolean modify(FormVO form);
	
	public boolean remove(Long id);
	
//	public List<FormVO> getFormList();
	
	public List<FormVO> getFormList(Criteria cri);
	
	public int getFormTotal(Criteria cri);
}

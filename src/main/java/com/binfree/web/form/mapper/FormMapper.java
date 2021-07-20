package com.binfree.web.form.mapper;

import java.util.List;

import com.binfree.web.form.domain.Criteria;
import com.binfree.web.form.domain.FormVO;

public interface FormMapper {
	
	// @Select("select * from form where id > 0;")
	public List<FormVO> getFormList();
	
	public List<FormVO> getFormListWithPaging(Criteria cri);
	
	public void formInsert(FormVO form);
	
	public void formInsertSelectKey(FormVO form);
	
	public FormVO formRead(Long id);
	
	public int formDelete(Long id);
	
	public int formUpdate(FormVO form);
	
	public int getTotalCount(Criteria cri);
}

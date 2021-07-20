package com.binfree.web.form.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FormVO {
	// MySQL 칼럼명과 똑같이 변수명을 선언해야 데이터 적용이 된다.
	private Long id;
	private String name;
	private String phone;
	private String zipCode;
	private String loc;
	private String inputLoc;
	private String servLoc;
	private Date appDate;
	private Date updateDate;
	private	String pic;

}

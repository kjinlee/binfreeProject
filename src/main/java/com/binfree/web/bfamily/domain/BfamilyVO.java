package com.binfree.web.bfamily.domain;

import java.util.List;

import lombok.Data;

@Data
public class BfamilyVO {
	
	private long id;
	private String email;
	private String password;
	private String name;
	private String phone;
	private String zipCode;
	private String loc;
	private String inputLoc;
	private String subName;
	private String subPhone;
	private String subItem;
	private String subStart;
	private String subEnd;
	private int myBuddy;
	private String checkBox;
	private boolean enabled;
	private List<AuthVO> authList;
}

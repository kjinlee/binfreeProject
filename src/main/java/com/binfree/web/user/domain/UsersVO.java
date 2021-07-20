package com.binfree.web.user.domain;

import lombok.Data;

@Data
public class UsersVO {

	private int id;
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
	private Long myBuddy;
	private String checkbox;
	private boolean enabled;
	private String auth;

}

package com.binfree.web.review.domain;

import java.sql.Date;


import lombok.Data;

@Data
public class ReviewVO {
	
	private int id;
	private String email;
	private String userName;
	private int star;
	private String subItem; 
	private Date creDate;
	private Date updateDate;
	private String contents;
	private int startIndex;
	private int cntPerPage;
	private int num;
	private String img;
}

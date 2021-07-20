package com.binfree.web.goods.domain;


import lombok.Data;

@Data
public class GoodsVO {
	
	//0.	id
	private int id;
	//1. 	제품명
	private String goodsName;
	//2.	이미지
	private String pic;

	//3.	상품설명
	private String contents;
	//4.	상품분류
	private String option1;
	private String option2;
	private String option3;
	
	private String subName;
}
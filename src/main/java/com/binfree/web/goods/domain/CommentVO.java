package com.binfree.web.goods.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CommentVO {

	private int cno;
	private int bno;
	private String email;
	private String content;
	private String writer;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date reg_date;

}

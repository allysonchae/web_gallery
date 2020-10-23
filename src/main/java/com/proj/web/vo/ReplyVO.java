package com.proj.web.vo;

import lombok.Data;

@Data
public class ReplyVO {

	private int reply_seq;
	private int id;
	private String reply_text;
	private String member_id;
	private String reply_indate;
	private String member_nickname;
	
}

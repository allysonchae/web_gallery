package com.proj.web.vo;

import lombok.Data;

@Data
public class ChatVO {
	
	private String room_id;
	private String member_nickname;
	private String room_date;
	
	private String chat_context;
	private String chat_date;
	
}

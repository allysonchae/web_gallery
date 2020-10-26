package com.proj.web.vo;

import lombok.Data;

@Data
public class ChatroomVO {

	private String member_nickname;
	private String room_id;
	private String room_date;
	
	private String message_context;
	private String message_date;
	
	//닉네임, 내용, 메세지날짜, 방id, 
		
}

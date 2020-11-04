package com.proj.web.vo;

import lombok.Data;

@Data
public class FollowVO {

	private String member_id;
	private String friend_id;
	private String friend_nickname;
	private int follow_type;
	
}

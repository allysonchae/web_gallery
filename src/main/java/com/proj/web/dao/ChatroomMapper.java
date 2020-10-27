package com.proj.web.dao;

import com.proj.web.vo.ChatroomVO;

public interface ChatroomMapper {

	public int createRoom(ChatroomVO room);
	
	public ChatroomVO searchRoom(String room_id);
}

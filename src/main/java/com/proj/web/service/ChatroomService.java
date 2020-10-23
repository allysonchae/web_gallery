package com.proj.web.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.web.dao.ChatroomDAO;
import com.proj.web.vo.ChatroomVO;

@Service
public class ChatroomService {
	
	private ChatroomDAO dao = new ChatroomDAO();
	private static final Logger logger = LoggerFactory.getLogger(ChatroomService.class);

	public int createRoom(ChatroomVO chatroom) {
		//쪽지방 생성
		int create = 0;
		create = dao.createRoom(chatroom);
		return create;
	}
	
	public ChatroomVO searchRoom(String room_id) {
		System.out.println("service까지 오는지???");
		ChatroomVO room = dao.searchRoom(room_id);
		return room;
	}
	
}

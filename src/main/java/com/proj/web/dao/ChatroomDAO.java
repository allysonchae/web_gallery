package com.proj.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.web.vo.ChatroomVO;

@Repository
public class ChatroomDAO {

	@Autowired
	private SqlSession session;
	
	//채팅룸 생성
	public int createRoom(ChatroomVO room) {
		int insert = 0;
		try {
			
			ChatroomMapper mapper = session.getMapper(ChatroomMapper.class);
			insert = mapper.createRoom(room);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insert;
	}
	//채팅룸이 있는지 확인
	public ChatroomVO searchRoom(String room_id) {
		ChatroomVO room = null;
		try {
			System.out.println(room_id);
			ChatroomMapper mapper = session.getMapper(ChatroomMapper.class);
			room = mapper.searchRoom(room_id);
			System.out.println(room);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return room;
	}
}

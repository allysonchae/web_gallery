package com.proj.web.controller;

import java.util.ArrayList;

import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.proj.web.service.ChatroomService;
import com.proj.web.vo.ChatroomVO;

@Controller
// 스크립트에서 웹 소켓 객체를 만들 때, 사용자가 입력한 채팅방 번호와 사용자 이름을 주소에 붙여서 전달받는다.
// 사용자가 입력한 채팅방 번호와 사용자 이름에 따라 주소가 유동적으로 바뀔 것이다.
// '/multiChat.do'를 제외한, 채팅방 번호와 사용자 이름에 해당하는 뒤쪽 주소는 onOpen 메서드의 매개변수로 전달된다.
// 동적 주소와 매개변수는 필요에 따라 개수를 늘리거나 줄일 수 있다.
// 예를 들어, 채팅방 번호 정보가 필요 없으면 주소의 형태는 '/multiChat.do/{member_nickname}'이 되고 onOpen 메서드의 매개변수도 한 개만 작성하면 된다.
@ServerEndpoint(value = "/multiChat.do/{room_id}/{member_nickname}/{friend_id}")
public class MultiChatController {

	private static final ArrayList<Session> sessionList = new ArrayList<>();
	private static final Logger logger = LoggerFactory.getLogger(MultiChatController.class);
	@Autowired
	private MultiChatController multi;
	
	@Autowired
	private ChatroomService service;
	//private ChatroomService service = new ChatroomService();

	@OnOpen
	// @PathParam 어노테이션 없이 매개변수만 작성하면 에러가 발생한다.
	public void onOpen(Session session, @PathParam("room_id") String room_id, @PathParam("member_nickname") String member_nickname
										,@PathParam("friend_id") String friend_id) {
		logger.info("소켓 열기 실행. 생성된 세션 ID: " + session.getId() + ", 채팅방 번호: " + room_id + ", 사용자 이름: " + member_nickname);
		
		/*int action = 0;
		
		String[] temp = room_id.split("_");
		String line = "";
		
		line = temp[1] + "_" + temp[0];
		logger.info("temp : " + temp);
		
		ChatroomVO room = null;
		
		try {
			System.out.println("service가 null이니?" + service);
			room = service.searchRoom(room_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("채팅룸이 있는지 찾기");
		//가져온 정보가 없으면,
		if(room == null) {
			room = service.searchRoom(line);
			logger.info("이름순서 바꿔서 또 찾기");
			//이름 순서바꿔서 찾았는데도 없으면
			if(room == null) {
				ChatroomVO r = new ChatroomVO();
				r.setRoom_id(room_id);
				r.setMember_nickname(member_nickname);
				action = service.createRoom(r);
				logger.info("채팅방 새로 생성");
				multi.setSession(session, r);
				logger.info("세션에도 저장");
			} else {
				//방이 있으면?
				multi.setSession(session, room);
				logger.info("이름바꿔서 찾았으니 세션에 담아서 열기");
			}
		} else {
			//방이 있으면?
			multi.setSession(session, room);
			logger.info("방이 있었으니 세션에 담아서 열기");
		}*/
		session.getUserProperties().put("room_id", room_id);
		session.getUserProperties().put("member_nickname", member_nickname);

		// 사용자 정의 속성의 입력이 끝난 세션 객체를 세션 목록에 저장한다.
		sessionList.add(session);
	}

	/*public void setSession(Session session, ChatroomVO room) {
		session.getUserProperties().put("room_id", room.getRoom_id());
		session.getUserProperties().put("member_nickname", room.getMember_nickname());

		sessionList.add(session);
	}*/
	
	  @OnClose public void onClose(Session session) {
	logger.info("소켓 닫기 실행. 종료된 세션 ID: " + session.getId());
	
	  // 종료를 요청한 세션 객체를 세션 목록에서 제거한다. 
	 sessionList.remove(session); }

	@OnMessage
	public void onMessage(Session session, String message) {
		logger.info("메시지 실행. 세션 ID / 메시지: " + session.getId() + " / " + message);

		try {
			logger.info("전달받은 메세지 : " + message);
			//사용자가 보낸 메세지(내쪽에서 뜨는거 SEND)
			session.getBasicRemote().sendText(
					"<div class='media w-50 ml-auto mb-3'><div class='media-body'><div class='bg-primary rounded py-2 px-3 mb-2'>"+
					"<p class='text-small mb-0 text-white'>" + message + "</p></div><p class='small text-muted'>" +
						"날짜 같은거 " + "</p></div>	</div>");

			// 메시지를 보낸 사람의 채팅방 번호와 사용자 이름을 가져온다.
			String senderRoom_id = (String) session.getUserProperties().get("room_id");
			String senderMember_nickname = (String) session.getUserProperties().get("member_nickname");
			
			// 반복문을 통해 다른 모든 세션에 대해 확인을 진행한다.
			for (Session anotherSession : sessionList) {
				// 각각의 세션에 등록되어 있는 채팅방 번호를 가져온다.
				String anotherRoom_id = (String) anotherSession.getUserProperties().get("room_id");

				// 다른 세션의 ID와 메시지를 보낸 세션의 ID가 일치하면, 이미 메시지 보낸 사람 자신의 메시지는 100번째 줄에서 보냈으니 패스한다.
				// 다른 세션의 채팅방 번호와 보낸 세션의 채팅방 번호가 일치하면, 같은 방에 있는 세션을 의미하니 메시지 전송을 진행한다.
				if (!anotherSession.getId().equals(session.getId()) && anotherRoom_id.equals(senderRoom_id)) {
					// 보내는 사람의 이름과 메시지를 전송한다.
					//RECIEVED
					anotherSession.getBasicRemote().sendText(
							"<div class='media w-50 mb-3'><img src='https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg' alt='user' width='50' class='rounded-circle'>"+
							"<div class='media-body ml-3'><div class='bg-light rounded py-2 px-3 mb-2'>"+
							"<p class='text-small mb-0 text-muted'>" + message +
							"</p></div><p class='small text-muted'>" + senderMember_nickname + "|" + "얘도 날짜 같은거" + "</p></div></div>");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@OnError
	public void onError(Session session, Throwable e) {
		logger.info("오류 발생. 오류가 발생한 세션 ID: " + session.getId());
	}

}

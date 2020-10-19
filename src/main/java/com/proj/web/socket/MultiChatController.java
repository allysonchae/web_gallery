package com.proj.web.socket;

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
import org.springframework.stereotype.Controller;

@Controller

@ServerEndpoint(value = "/multiChat.do/{room_id}/{member_nickname}")
public class MultiChatController {

	private static final ArrayList<Session> sessionList = new ArrayList<>();
	private static final Logger logger = LoggerFactory.getLogger(MultiChatController.class);

	@OnOpen
	// 사용자의 닉네임 + 상대방의 닉네임 => room_id(고유 번호)
	// @PathParam 어노테이션 소괄호 안의 문자열("room_id"와 "member_id")이
	// 21번째 줄, @ServerEndpoint 어노테이션의 값 뒷 부분에 해당하는 동적 url 부분의 이름({room_id}와 {member_id})과 일치해야 한다.
	// @PathParam 어노테이션 없이 매개변수만 작성하면 에러가 발생한다.
	public void onOpen(Session session, @PathParam("room_id") String room_id, @PathParam("member_nickname") String member_nickname) {
		logger.info("소켓 열기 실행. 생성된 세션 ID: " + session.getId() + ", 채팅방 번호: " + room_id + ", 사용자 이름: " + member_nickname);
		
		/*
		 * // 누군가가 소켓을 열고 방에 접속하면, 같은 방에 이미 접속하고 있던 다른 모든 사람들에게 알림을 주는 코드. try { // 반복문을
		 * 통해 현재 세션을 제외한 다른 모든 세션에 대해 확인을 진행한다. for (Session anotherSession :
		 * sessionList) { // 각각의 세션에 등록되어 있는 채팅방 번호를 가져온다. 채팅방 번호를 가져오는 메서드와 관련 사용 방법은
		 * 하단에 기술한다. String anotherRoom_id = (String)
		 * anotherSession.getUserProperties().get("room_id");
		 * 
		 * // 기존에 있던 세션의 채팅방 번호와 현재 막 접속을 시도한 세션의 채팅방 번호가 일치하는지 확인한다. // 일치한다면 같은 방에 있는
		 * 세션을 의미하므로, 메시지를 전송함으로써 현재 접속자에 대한 이름을 다른 사람들에게 알린다. if
		 * (anotherRoom_id.equals(room_id)) {
		 * anotherSession.getBasicRemote().sendText(member_id + " 님이 접속하셨습니다."); } } }
		 * catch (Exception e) { e.printStackTrace(); }
		 */

		// 지금 접속을 시도하는 세션 객체에 사용자 정의 속성을 작성한다.
		// 사용자 정의 속성은 getUserProperties() 메서드로 사용하며 Map 구조로 되어있다.
		// 이 Map에 채팅방 번호와 사용자 이름을 입력한다.
		session.getUserProperties().put("room_id", room_id);
		session.getUserProperties().put("member_id", member_nickname);

		// 사용자 정의 속성의 입력이 끝난 세션 객체를 세션 목록에 저장한다.
		sessionList.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		logger.info("소켓 닫기 실행. 종료된 세션 ID: " + session.getId());
		
		// 종료를 요청한 세션 객체를 세션 목록에서 제거한다.
		sessionList.remove(session);
		
		// 소켓을 닫은 세션에 대해, 같은 방에 있던 사용자들에게 해당 세션이 채팅을 종료했음을 알리는 코드.
		// 세션 목록에서 종료된 세션을 먼저 제거(69번째 줄)해야 익셉션이 발생하지 않는다.
		// 종료된 세션에 대해 작업을 진행하려고 하면 익셉션이 발생하기 때문이다.
		/*
		 * try { // 종료된 세션에 대한 채팅방 번호와 사용자 이름을 가져온다. String closerRoom_id = (String)
		 * session.getUserProperties().get("room_id"); String closerMember_id = (String)
		 * session.getUserProperties().get("member_nickname");
		 * 
		 * // 반복문을 통해 다른 모든 세션에 대해 확인을 진행한다. for (Session anotherSession : sessionList)
		 * { // 각각의 세션에 등록되어 있는 채팅방 번호를 가져온다. String anotherRoom_id = (String)
		 * anotherSession.getUserProperties().get("room_id");
		 * 
		 * // 기존에 있던 세션의 채팅방 번호와 종료된 세션의 채팅방 번호가 일치하는지 확인한다. // 일치하면 누가 종료했는지 메시지를
		 * 전송함으로써 이름을 표시해준다. if (anotherRoom_id.equals(closerRoom_id)) {
		 * anotherSession.getBasicRemote().sendText(closerMember_id + " 님이 종료하셨습니다."); }
		 * } } catch (Exception e) { e.printStackTrace(); }
		 */
	}

	@OnMessage
	public void onMessage(Session session, String message) {
		logger.info("메시지 실행. 세션 ID / 메시지: " + session.getId() + " / " + message);

		try {
			session.getBasicRemote().sendText("나: " + message);

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
					anotherSession.getBasicRemote().sendText(senderMember_nickname + ": " + message);
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

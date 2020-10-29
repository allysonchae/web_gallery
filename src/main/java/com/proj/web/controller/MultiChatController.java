package com.proj.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.proj.web.service.ChatroomService;
import com.proj.web.vo.ChatroomVO;

@Controller
// 스크립트에서 웹 소켓 객체를 만들 때, 사용자가 입력한 채팅방 번호와 사용자 이름을 주소에 붙여서 전달받는다.
// 사용자가 입력한 채팅방 번호와 사용자 이름에 따라 주소가 유동적으로 바뀔 것이다.
// '/multiChat.do'를 제외한, 채팅방 번호와 사용자 이름에 해당하는 뒤쪽 주소는 onOpen 메서드의 매개변수로 전달된다.
// 동적 주소와 매개변수는 필요에 따라 개수를 늘리거나 줄일 수 있다.
// 예를 들어, 채팅방 번호 정보가 필요 없으면 주소의 형태는 '/multiChat.do/{member_nickname}'이 되고 onOpen 메서드의 매개변수도 한 개만 작성하면 된다.
@ServerEndpoint(value = "/multiChat.do")
public class MultiChatController {

	private static final ArrayList<Session> sessionList = new ArrayList<>();
	private static final Logger logger = LoggerFactory.getLogger(MultiChatController.class);
	
	@OnOpen
	public void onOpen(Session session, @PathParam("friend_id") String friend_id) {
		
		logger.info(friend_id);
		logger.info("소켓 열기 실행. 생성된 세션 ID: " + session.getId());
		sessionList.add(session);
		
	}
	
	@OnClose 
	public void onClose(Session session) {
		logger.info("소켓 닫기 실행. 종료된 세션 ID: " + session.getId());
	
		// 종료를 요청한 세션 객체를 세션 목록에서 제거한다. 
		sessionList.remove(session); 
	}

	@OnMessage
	public void onMessage(Session session, String message) {
		logger.info("메시지 실행. 세션 ID / 메시지: " + session.getId() + " / " + message);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar time = Calendar.getInstance();
		String presentDateTemp = sdf.format(time.getTime());
		
		try {
			logger.info("전달받은 메세지 : " + message);
			//사용자가 보낸 메세지(내쪽에서 뜨는거 SEND)
			session.getBasicRemote().sendText(
					"<div class='media w-50 ml-auto mb-3'><div class='media-body'><div class='bg-primary rounded py-2 px-3 mb-2'>"+
					"<p class='text-small mb-0 text-white'>" + message + "</p></div><p class='small text-muted'>" +
					 presentDateTemp + "</p></div>	</div>"
			);

			for (Session anotherSession : sessionList) {
				
				if (!anotherSession.getId().equals(session.getId())) {
					
					anotherSession.getBasicRemote().sendText(
							"<div>the other party</div>"+
							"<div class='media w-50 mb-3'><img src='https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg' alt='user' width='50' class='rounded-circle'>"+
							"<div class='media-body ml-3'><div class='bg-light rounded py-2 px-3 mb-2'>"+
							"<p class='text-small mb-0 text-muted'>" + message +
							"</p></div><p class='small text-muted'>" + presentDateTemp + "</p></div></div>");
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

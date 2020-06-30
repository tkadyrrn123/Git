package com.kh.www.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.www.Member.model.vo.Member;



public class ReplyEchoHandler extends TextWebSocketHandler{
	
	List<WebSocketSession> sessions = new ArrayList<>();
	
	Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished:" + session);
		sessions.add(session);
		String senderId = getId(session);
		userSessions.put(senderId, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage:" + session +" : "+ message);
//		String senderId = getId(session);
//		for(WebSocketSession sess : sessions) {
//			sess.sendMessage(new TextMessage(senderId + " : " + message.getPayload()));
//		}
		String msg = message.getPayload();
		if(!StringUtils.isEmpty(msg)) {
			String[] strs = msg.split(",");
			
			//공지사항 알람
			if(strs != null && "NoticeWrite".equals(strs[0])) {

				String messsage = "<strong>공지사항 알림!</strong><br>" + "새로운 공지사항이  추가되었습니다.<br>"
						+"<p><a href='noticeList.no'>이동하기<i class='fas fa-arrow-circle-right'></i></a></p>";
				TextMessage tmpMsg = new TextMessage(messsage);

				for(WebSocketSession sess : sessions) {
					sess.sendMessage(tmpMsg);
				} 
			}

			//자유게시판 알람
			if(strs != null && strs.length == 4) {
				String cmd = strs[0];
				String replyWriter = strs[1];//댓글 작성자
				String boardWriter = strs[2];//게시글 작성자
				String bno = strs[3];//게시글 번호
				
				WebSocketSession boardWriterSession = userSessions.get(boardWriter);
				
				if("free".equals(cmd) && boardWriterSession != null) {
					String messsage = "<strong>댓글 알림!</strong><br>" + replyWriter + "님이" + bno +"번 게시글에 댓글을 달았습니다."
									  +"<p><a href='bdetail.fr?boardNo=" + bno + "&page=1'>이동하기<i class='fas fa-arrow-circle-right'></i></a></p>";
					TextMessage tmpMsg = new TextMessage(messsage);
					boardWriterSession.sendMessage(tmpMsg);
				}
				
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
	}
	
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = (Member)httpSession.get("loginUser");
		System.out.println(loginUser);
		if(loginUser==null) {
			return session.getId();
		}else {
			return loginUser.getUserId();
		}
	}
}

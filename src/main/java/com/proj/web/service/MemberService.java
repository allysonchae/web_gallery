package com.proj.web.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.web.dao.MemberDAO;
import com.proj.web.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private HttpSession session;
	
	
	public String memberJoin(MemberVO member) throws Exception {
		dao.memberJoin(member);
		return "redirect:/";
	}
	
	public int idCheck(String member_id) {
		int cnt = dao.memberSelectOneId(member_id);
		return cnt;
	}

	public int emailCheck(String member_email) {
		int cnt = dao.memberSelectOneEm(member_email);
		return cnt;
	}

	public String memberLogin(MemberVO member) {
		MemberVO loginCheck = dao.memberSelectOne(member.getMember_id());
		System.out.println("서비스까지 받아온 데이터 : " + loginCheck);
		String page = "";
		if(loginCheck != null && member.getMember_pw().equals(loginCheck.getMember_pw())){
			session.setAttribute("loginID", loginCheck.getMember_nickname());
			page = "redirect:/";
		}else {
			page = "redirect:/member/memberLoginPage";
		}
		return page;
	}

	public int nicknameCheck(String member_nickname) {
		int cnt = dao.memberSelectOneNickname(member_nickname);
		return cnt;
	}

	public String memberFind(MemberVO member) {
		String member_id = dao.memberFind(member);
		return member_id;
	}

}

package com.proj.web.service;

import java.util.HashMap;

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
			session.setAttribute("loginNickName", loginCheck.getMember_nickname());
			session.setAttribute("loginID", loginCheck.getMember_id());
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

	public String pwFind(MemberVO member) {
		String member_id = dao.pwFind(member);
		return member_id;
	}

	public void pwChange(MemberVO member) {
		dao.pwChange(member);
	}

	public HashMap<String, String> memberSelectOneAll(String member_id) {
		HashMap<String, String> hash = new HashMap<String, String>();
		hash = dao.memberSelectOneAll(member_id);
		return hash;
	}

	public void memberUpdate(MemberVO member) {
		dao.memberUpdate(member);
	}

}

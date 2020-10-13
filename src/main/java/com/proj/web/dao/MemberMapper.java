package com.proj.web.dao;

import java.util.HashMap;

import com.proj.web.vo.MemberVO;

public interface MemberMapper {

	public int memberSelectOneId(String member_id);

	public int memberJoin(MemberVO member);

	public int memberSelectOneEm(String member_email);

	public MemberVO memberSelectOne(String member_id);

	public int memberSelectOneNickname(String member_nickname);

	public String memberFind(MemberVO member);

	public String pwFind(MemberVO member);

	public void pwChange(MemberVO member);

	public HashMap<String, String> memberSelectOneAll(String member_id);
	
}

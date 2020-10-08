package com.proj.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.web.dao.MemberDAO;
import com.proj.web.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession session;
	
	public int memberJoin(MemberVO member) throws Exception {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int cnt = 0;
		try {
			cnt = mapper.memberJoin(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public int memberSelectOneId(String member_id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int cnt = 0;
		try {
			cnt = mapper.memberSelectOneId(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int memberSelectOneEm(String member_email) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int cnt = 0;
		try {
			cnt = mapper.memberSelectOneEm(member_email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public MemberVO memberSelectOne(String member_id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		MemberVO member = null;
		
		try {
			member = mapper.memberSelectOne(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	public int memberSelectOneNickname(String member_nickname) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int cnt = 0;
		try {
			cnt = mapper.memberSelectOneNickname(member_nickname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public String memberFind(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		String member_id = "";
		try {
			member_id = mapper.memberFind(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member_id;
	}
	
}

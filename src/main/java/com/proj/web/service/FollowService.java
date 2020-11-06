package com.proj.web.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.web.dao.FollowDAO;
import com.proj.web.vo.FollowVO;

@Service
public class FollowService {

	@Autowired
	private FollowDAO dao;
	@Autowired
	private HttpSession session;
	
	public void insertFollower(FollowVO follow) {
		
		dao.insertFollower(follow);
		
	}
	
	public void deleteFollower(FollowVO follow) {
		
		dao.deleteFollower(follow);
		
	}
	
	public int checkFollower(FollowVO follow) {
		
		return dao.checkFollower(follow);
		
	}
	
	public int countFollower() {
		
		FollowVO follow = new FollowVO();
		
		String member_id = (String)session.getAttribute("loginID");
		
		follow.setMember_id(member_id);
		
		return dao.countFollower(follow);
		
	}
	
	public ArrayList<FollowVO> followerList(FollowVO follow){
		
		return  dao.followerList(follow);
		
	}
	
	public ArrayList<FollowVO> followingList(FollowVO follow){
		
		return dao.followingList(follow);
		
	}
	
	public int countFollowing() {
		
		FollowVO follow = new FollowVO();
		
		String member_id = (String)session.getAttribute("loginID");
		
		follow.setMember_id(member_id);
		
		return dao.countFollowing(follow);
		
	}
	
}



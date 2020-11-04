package com.proj.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.web.dao.FollowDAO;
import com.proj.web.dao.FollowMapper;
import com.proj.web.vo.FollowVO;

@Service
public class FollowService {

	@Autowired
	private FollowDAO dao;
	
	public void insertFollower(FollowVO follow) {
		
		dao.insertFollower(follow);
		
	}
	
	public void deleteFollower(FollowVO follow) {
		
		dao.deleteFollower(follow);
		
	}
	
	public int checkFollower(FollowVO follow) {
		
		return dao.checkFollower(follow);
		
	}
}



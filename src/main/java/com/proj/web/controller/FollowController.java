package com.proj.web.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.web.service.FollowService;
import com.proj.web.vo.FollowVO;

@Controller
public class FollowController {

	@Autowired
	private FollowService fs;

	private static final Logger logger = LoggerFactory.getLogger(FollowController.class); 
	
	@ResponseBody
	@RequestMapping(value = "/insertFollow", method = RequestMethod.GET)
	public void insertFollower(FollowVO follow) {
		
		fs.insertFollower(follow);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteFollower", method = RequestMethod.GET)
	public void deleteFollower(FollowVO follow) {
		
		fs.deleteFollower(follow);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkFollower", method = RequestMethod.GET)
	public int checkFollower(FollowVO follow) {
		
		int cnt = fs.checkFollower(follow);
		
		logger.info("follower : {}", cnt);
		
		return cnt;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/followerList" , method = RequestMethod.GET)
	public ArrayList<FollowVO> followerList(String member_id){
		
		logger.info("followerList member_id : {}", member_id);

		FollowVO follow = new FollowVO();
		
		follow.setMember_id(member_id);
		
		ArrayList<FollowVO> list = fs.selectFollower(follow);
		
		logger.info("followerList list : {}", list);
		
		return list;
	}
}

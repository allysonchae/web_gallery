package com.proj.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	
}

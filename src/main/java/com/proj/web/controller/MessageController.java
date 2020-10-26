package com.proj.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/message")
public class MessageController {

	final static Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@RequestMapping(value="/directMessage",method=RequestMethod.GET)
	public String blog_details(String member_nickname, Model model) {
		
		logger.info(member_nickname);
		
		model.addAttribute("member_nickname", member_nickname);
		
		return "/message/directMessage";
	}
	
}

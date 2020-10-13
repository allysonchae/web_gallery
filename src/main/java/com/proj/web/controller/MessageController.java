package com.proj.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/message")
public class MessageController {

	@RequestMapping(value="/directMessage",method=RequestMethod.GET)
	public String blog_details() {
		return "/message/directMessage";
	}
	
}

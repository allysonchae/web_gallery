package com.proj.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PageController {
	
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "/index";
	}
	
	//공지사항
	@RequestMapping(value="/info",method=RequestMethod.GET)
	public String info() {
		return "/info";
	}
	
	//이용안내
	@RequestMapping(value="/service",method=RequestMethod.GET)
	public String about() {
		return "/service";
	}
	
	//현재 오픈된 갤러리
	@RequestMapping(value="/gallery",method=RequestMethod.GET)
	public String gallery() {
		return "/gallery";
	}
	
	//오픈예정 갤러리
	@RequestMapping(value="/expectedGallery",method=RequestMethod.GET)
	public String expectedGallery() {
		return "/expectedGallery";
	}
	
	@RequestMapping(value="/requestGallery",method=RequestMethod.GET)
	public String requestGallery() {
		return "/requestGallery";
	}
	
	@RequestMapping(value="/community",method=RequestMethod.GET)
	public String community() {
		return "/community";
	}
	
	//이벤트 예정달력확인
	@RequestMapping(value="/calender",method=RequestMethod.GET)
	public String tours() {
		return "/calender";
	}
	
	//로그인
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		return "/login";
	}
	
	//내 블로그
	@RequestMapping(value="/blog",method=RequestMethod.GET)
	public String blog() {
		return "/blog";
	}
	
	//쪽지함
	@RequestMapping(value="/directMessage",method=RequestMethod.GET)
	public String blog_details() {
		return "/directMessage";
	}
	
	//내 정보
	@RequestMapping(value="/myPage",method=RequestMethod.GET)
	public String contact() {
		return "/myPage";
	}
	
	@RequestMapping(value = "/viewOpenCover", method = RequestMethod.GET)
	public String openCube() {
		return "viewOpenCover";
	}
	
	@RequestMapping(value = "/viewOpenCube", method = RequestMethod.GET)
	public String viewOpenCube() {
		return "viewOpenCube";
	}
	
	@RequestMapping(value = "/viewOpenFlip", method = RequestMethod.GET)
	public String viewOpenFlip() {
		return "viewOpenFlip";
	}
	
	
}

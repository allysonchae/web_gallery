package com.proj.web.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.web.dao.MarketDAO;
import com.proj.web.vo.MarketVO;
import com.proj.web.vo.WorkVO;

@Service
public class MarketService {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MarketDAO dao;
	
	public ArrayList<HashMap<String, Object>> selectMyWork(){
		
		String member_id = (String) session.getAttribute("loginID");
		
		return dao.selectMyWork(member_id);
	}
	
	public ArrayList<MarketVO> MarketAll() {
		
		return dao.MarketAll();
	}
		
	public WorkVO selectMarketWork(HashMap<String, Object> map) {
			
		return dao.selectMarketWork(map);
	}
	
}

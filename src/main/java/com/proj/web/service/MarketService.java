package com.proj.web.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.web.dao.MarketDAO;
import com.proj.web.vo.BuyVO;
import com.proj.web.vo.MarketVO;
import com.proj.web.vo.WorkVO;

@Service
public class MarketService {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MarketDAO dao;
	
	public ArrayList<MarketVO> MarketAll() {
		
		return dao.MarketAll();
	}
		
	public WorkVO selectMarketWork(HashMap<String, Object> map) {
			
		return dao.selectMarketWork(map);
	}

	public void insertMarket(MarketVO market) {
		String member_id = (String)session.getAttribute("loginID");
		String member_nickname = (String)session.getAttribute("loginNickName");
		
		market.setMember_id(member_id);
		market.setMember_nickname(member_nickname);
		dao.insertMarket(market);
	}

	public MarketVO marketOne(int market_seq) {
		MarketVO market = dao.marketOne(market_seq);
		return market;
	}

	public ArrayList<MarketVO> listMarket(String searchText) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", (String)session.getAttribute("loginID"));
		map.put("searchText", searchText);
		ArrayList<MarketVO> listMarket = dao.listMarket(map);
		return listMarket;
	}
	
	public ArrayList<MarketVO> listMarket_6(String searchText) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", (String)session.getAttribute("loginID"));
		map.put("searchText", searchText);
		ArrayList<MarketVO> listMarket = dao.listMarket_6(map);
		return listMarket;
	}

	public int getTotal(String searchText) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", (String)session.getAttribute("loginID"));
		map.put("searchText", searchText);
		int total = dao.getTotal(map);
		return total;
	}

	public int getMarketTotal(String searchText) {
		int total = dao.getMarketTotal(searchText);
		return total;
	}

	public ArrayList<MarketVO> marketlistAll(String searchText, int startRecord, int countPerPage) {
		ArrayList<MarketVO> marketlistAll = dao.marketlistAll(searchText, startRecord, countPerPage);
		return marketlistAll;
	}
	
	public ArrayList<MarketVO> myWorkSellRecord(){
		
		String member_id = (String)session.getAttribute("loginID");
		
		return dao.myWorkSellRecord(member_id);
		
	}
	
	public void insertBuy(BuyVO buy) {
		
		dao.updateAmount(buy);
		
		String member_id = (String)session.getAttribute("loginID");
		buy.setMember_id(member_id);
		
		dao.insertBuy(buy);
		
	}
	
	public ArrayList<HashMap<String, Object>> selectBuy(){
		
		String member_id = (String)session.getAttribute("loginID");
		
		return dao.selectBuy(member_id);
		
	}

	public void saleStop(int market_seq) {

		dao.saleStop(market_seq);
		
	}
	
}

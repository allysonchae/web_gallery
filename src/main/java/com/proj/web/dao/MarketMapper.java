package com.proj.web.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.proj.web.vo.BuyVO;
import com.proj.web.vo.MarketVO;
import com.proj.web.vo.WorkVO;

public interface MarketMapper {

	 public ArrayList<MarketVO> MarketAll();
	 
	 public WorkVO selectMarketWork(HashMap<String, Object> map);
	 
	 public void insertMarket(MarketVO market);
	 
	 public MarketVO marketOne(int market_seq);
	 
	 public ArrayList<MarketVO> listMarket(HashMap<String, Object> map, RowBounds rb);
	 
	 public int getTotal(HashMap<String, Object> map);
	 
	 public int getMarketTotal(String searchText);
	 
	 public ArrayList<MarketVO> marketlistAll(String searchText, RowBounds rb);
	 
	 public ArrayList<MarketVO> myWorkSellRecord(String member_id);
	 
	 public void insertBuy(BuyVO buy);
	 
	 public void updateAmount(BuyVO buy);
	 
	 public ArrayList<HashMap<String, Object>> selectBuy(String member_id);
	 
}

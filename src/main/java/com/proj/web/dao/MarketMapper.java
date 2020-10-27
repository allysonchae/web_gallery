package com.proj.web.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.proj.web.vo.MarketVO;
import com.proj.web.vo.WorkVO;

public interface MarketMapper {

	ArrayList<HashMap<String, Object>> selectMyWork(String member_id);

	ArrayList<MarketVO> MarketAll();

	WorkVO selectMarketWork(HashMap<String, Object> map);

	void insertMarket(MarketVO market);

	MarketVO marketOne(int market_seq);

}

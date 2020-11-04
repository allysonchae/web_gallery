package com.proj.web.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.proj.web.vo.MarketVO;
import com.proj.web.vo.WorkVO;

public interface MarketMapper {

	ArrayList<MarketVO> MarketAll();

	WorkVO selectMarketWork(HashMap<String, Object> map);

	void insertMarket(MarketVO market);

	MarketVO marketOne(int market_seq);

	ArrayList<MarketVO> listMarket(HashMap<String, Object> map, RowBounds rb);

	int getTotal(HashMap<String, Object> map);

}

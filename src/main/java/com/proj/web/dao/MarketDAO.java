package com.proj.web.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.web.vo.MarketVO;
import com.proj.web.vo.WorkVO;

@Repository
public class MarketDAO {
	
	@Autowired
	private SqlSession ss;

	public ArrayList<HashMap<String, Object>> selectMyWork(String member_id){
			
		MarketMapper mm = ss.getMapper(MarketMapper.class);
			ArrayList<HashMap<String, Object>> list = null;
			
			try {
				list = mm.selectMyWork(member_id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
			
		}
	
		public ArrayList<MarketVO> MarketAll() {
	
			MarketMapper mm = ss.getMapper(MarketMapper.class);
			ArrayList<MarketVO> list = null;
			
			try {
				list = mm.MarketAll();
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		public WorkVO selectMarketWork(HashMap<String, Object> map) {
			
			MarketMapper mm = ss.getMapper(MarketMapper.class);
			WorkVO work = null;
			
			try {
				work = mm.selectMarketWork(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return work;
		}

		public void insertMarket(MarketVO market) {
			
			MarketMapper mm = ss.getMapper(MarketMapper.class);
			
			try {
				mm.insertMarket(market);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}

		public MarketVO marketOne(int market_seq) {
			MarketMapper mm = ss.getMapper(MarketMapper.class);
			MarketVO market = new MarketVO();
			try {
				market = mm.marketOne(market_seq);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return market;
		}
}

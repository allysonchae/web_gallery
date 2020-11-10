package com.proj.web.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.web.controller.MarketController;
import com.proj.web.vo.MarketVO;
import com.proj.web.vo.WorkVO;

@Repository
public class MarketDAO {
	
	@Autowired
	private SqlSession ss;
	
	final static Logger logger = LoggerFactory.getLogger(MarketDAO.class);

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

		public ArrayList<MarketVO> listMarket(HashMap<String, Object> map, int startRecord, int countPerPage) {
			MarketMapper mm = ss.getMapper(MarketMapper.class);
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			ArrayList<MarketVO> marketlist = null;
			try {
				marketlist = mm.listMarket(map, rb);
				logger.info("다오에서 받은 market 정보 {}", marketlist);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return marketlist;
		}

		public int getTotal(HashMap<String, Object> map) {
			MarketMapper mm = ss.getMapper(MarketMapper.class);
			int total = 0;
			try {
				total = mm.getTotal(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return total;
		}

		public int getMarketTotal(String searchText) {
			MarketMapper mm = ss.getMapper(MarketMapper.class);
			int total = 0;
			try {
				total = mm.getMarketTotal(searchText);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return total;
		}

		public ArrayList<MarketVO> marketlistAll(String searchText, int startRecord, int countPerPage) {
			MarketMapper mm = ss.getMapper(MarketMapper.class);
			ArrayList<MarketVO> marketlistAll = null;
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			try {
				marketlistAll = mm.marketlistAll(searchText, rb);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return marketlistAll;
		}
		
		public ArrayList<MarketVO> myWorkSellRecord(String member_id){
			
			MarketMapper mm = ss.getMapper(MarketMapper.class);
			ArrayList<MarketVO> list = null;
			
			try {
				list = mm.myWorkSellRecord(member_id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
			
		}
}

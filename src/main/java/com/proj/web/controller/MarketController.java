package com.proj.web.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.web.service.MarketService;
import com.proj.web.service.WorkService;
import com.proj.web.util.PageNavigator;
import com.proj.web.vo.BuyVO;
import com.proj.web.vo.MarketVO;
import com.proj.web.vo.WorkVO;

@Controller
public class MarketController {
	
	final static Logger logger = LoggerFactory.getLogger(MarketController.class);
	
	@Autowired
	private MarketService ms;
	
	@Autowired
	private WorkService ws;
	
	//게시판 관련 상수값들
	final int countPerPage = 9;			//페이지당 글 수
	final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수
	
	@RequestMapping(value = "/myWorkMarket", method = RequestMethod.GET)
	public String myWorkMarket(
								@RequestParam(value = "searchText", defaultValue = "") String searchText
								,Model model) {
		
		ArrayList<MarketVO> marketlist = ms.listMarket(searchText);
		ArrayList<MarketVO> marketlist_6 = new ArrayList<MarketVO>();
		
		if(marketlist.size()<7) {
			marketlist_6 = marketlist;
		}else{
			for(int i = 0 ; i < 6 ; i++) {
				marketlist_6.add(marketlist.get(i));
			}
		}
		
		logger.info("페이지 들어갈 시 marketlist_6 {}", marketlist_6);
		logger.info("페이지 들어갈 시 marketlist_6 수 {}", marketlist_6.size());
		
		model.addAttribute("marketlist_6", marketlist_6);
		model.addAttribute("searchText", searchText);
		
		return "/myWorkMarket";
	}
	
	@ResponseBody
	@RequestMapping(value = "/marketWorkList", method = RequestMethod.GET)
	public ArrayList<MarketVO> marketWorkList(@RequestParam(value = "searchText", defaultValue = "") String searchText) {
		
		ArrayList<MarketVO> marketlist = ms.listMarket(searchText);
		
		logger.info("ajex marketlist 데이터 수 {}",marketlist.size());
		logger.info("ajex marketlist {}", marketlist);
		
		return marketlist;
		
	}
	
	@RequestMapping(value = "/MarketAll", method = RequestMethod.GET)
	public String MarketAll(@RequestParam(value = "page", defaultValue = "1") int page
							,@RequestParam(value = "searchText", defaultValue = "") String searchText
							,Model model) {
		
		int total = ms.getMarketTotal(searchText);
		logger.info("컨트롤러 market 전체 개수 {}", total);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		ArrayList<MarketVO> marketlistAll = ms.marketlistAll(searchText, navi.getStartRecord(), navi.getCountPerPage());
		logger.info("컨트롤러 marketlistAll {}", marketlistAll);
		
		model.addAttribute("marketlistAll", marketlistAll);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		
		return "/MarketAll";
		
	}

	@RequestMapping(value = "/marketForm", method = RequestMethod.GET)
	public String marketForm(@RequestParam("work") String[]work, Model model) {
		
		ArrayList<WorkVO> list = new ArrayList<WorkVO>();
		
		for(int i = 0 ; i<work.length ; i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			System.out.println("판매할 작품 시퀀스 : "+work[i]);
			int cnt = work[i].indexOf('+');
			String work_seqTemp = work[i].substring(0, cnt);
			String gallery_seqTemp = work[i].substring(cnt+1);
			int work_seq = Integer.parseInt(work_seqTemp);
			int gallery_seq = Integer.parseInt(gallery_seqTemp);
			map.put("work_seq", work_seq);
			map.put("gallery_seq", gallery_seq);
			WorkVO workvo = ms.selectMarketWork(map);
			list.add(workvo);
		}
		
		logger.info("list : {}",list);
		model.addAttribute("list", list);
		
		return "/marketForm";
	}
	
	@RequestMapping(value = "/marketWrite", method = RequestMethod.POST)
	public String MarketWrite(@RequestParam("work_description") String[]work_description
							,@RequestParam("work_seq")int[]work_seq
							,@RequestParam("gallery_seq")int[]gallery_seq
							,@RequestParam("work_name")String[]work_name
							,@RequestParam("market_amount")String[]market_amount
							,@RequestParam("market_price")String[]market_price
							,@RequestParam("height")String[]height
							,@RequestParam("width")String[]width) {
		
		for(int i=0; i<work_seq.length;i++) {
			MarketVO market = new MarketVO();
			String market_size = height[i] + "X" + width[i];
			
			market.setSale_state(1);
			market.setMarket_size(market_size);
			market.setWork_description(work_description[i]);
			market.setWork_seq(work_seq[i]);
			market.setGallery_seq(gallery_seq[i]);
			market.setWork_name(work_name[i]);
			market.setMarket_amount(market_amount[i]);
			market.setMarket_price(market_price[i]);
			ms.insertMarket(market);
		}
		
		return "redirect:/myWorkMarket";
	}
	
	@RequestMapping(value = "/MarketOne", method = RequestMethod.GET)
	public String MarketOne(int market_seq, Model model) {
		
		MarketVO market = ms.marketOne(market_seq);
		
		logger.info("marketOne : {}", market);
		
		model.addAttribute("market", market);
		
		return "/MarketOne";
	}
	
	@RequestMapping(value = "/myWorkSellRecord", method = RequestMethod.GET)
	public String myWorkSellRecord(Model model) {
		
		ArrayList<MarketVO> list = ms.myWorkSellRecord();
		
		model.addAttribute("list", list);
		
		return "/myWorkSellRecord";
	}
	
	@RequestMapping(value = "/buyWork", method = RequestMethod.GET)
	public String buyWork(String buy_amount, String buy_price, int market_seq,String work_name, Model model) {
		
		logger.info("buy_amount : {}", buy_amount);
		logger.info("buy_price : {}", buy_price);
		logger.info("market_seq : {}", market_seq);
		logger.info("work_name : {}", work_name);
		
		model.addAttribute("buy_amount", buy_amount);
		model.addAttribute("buy_price", buy_price);
		model.addAttribute("market_seq", market_seq);
		model.addAttribute("work_name", work_name);
		
		return "/buyWork";
	}
	
	@RequestMapping(value = "/popup/jusoPopup", method = RequestMethod.POST)
	public String goPopup() {
		
		return "/popup/jusoPopup";
	}
	
	
	 @ResponseBody
	 @RequestMapping(value = "/insertBuy", method = RequestMethod.GET) 
	 public void insertBuy(BuyVO buy) {
	 
		 logger.info("buy : {}",buy);

		 ms.insertBuy(buy);
	 
	 }
	 
	 @RequestMapping(value = "/myWorkBuyRecord", method = RequestMethod.GET)
	 public String myWorkBuyRecord(Model model) {
		 
		 ArrayList<HashMap<String, Object>> list = ms.selectBuy();
		 
		 logger.info("myworkbuyrecord : {} ", list);
		 
		 model.addAttribute("list", list);
		 
		 return "/myWorkBuyRecord";
	 }
	 
	 @ResponseBody
	 @RequestMapping(value = "/saleStop", method = RequestMethod.GET)
	 public void saleStop(int market_seq) {
		 
		 ms.saleStop(market_seq);
		 
	 }
	
	
}

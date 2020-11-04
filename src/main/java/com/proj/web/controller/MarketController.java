package com.proj.web.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.proj.web.service.MarketService;
import com.proj.web.vo.MarketVO;
import com.proj.web.vo.WorkVO;

@Controller
public class MarketController {

	final static Logger logger = LoggerFactory.getLogger(MarketController.class);
	
	@Autowired
	private MarketService ms;
	
	@RequestMapping(value = "/myWorkMarket", method = RequestMethod.GET)
	public String myWorkMarket(Model model) {
		
		ArrayList<HashMap<String, Object>> list = ms.selectMyWork();
		
		logger.info("list : {}",list);
		
		model.addAttribute("list", list);
		
		return "/myWorkMarket";
	}
	
	@RequestMapping(value = "/MarketAll", method = RequestMethod.GET)
	public String MarketAll(Model model) {
		
		ArrayList<MarketVO> list = ms.MarketAll();
		
		model.addAttribute("list", list);
		
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
							,@RequestParam("market_price")String[]market_price) {
		
		for(int i=0; i<work_seq.length;i++) {
			MarketVO market = new MarketVO();
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
		
		logger.info("market : {}", market);
		
		model.addAttribute("market", market);
		
		return "/MarketOne";
	}
	
}

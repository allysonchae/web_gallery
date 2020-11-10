package com.proj.web.vo;

import lombok.Data;

@Data
public class MarketVO {

	private int market_seq;
	private int gallery_seq;
	private int work_seq;
	private int sell_state;
	private String work_name;
	private String work_description;
	private String member_id;
	private String member_nickname;
	private String market_price;
	private String market_amount;
	private String market_size;
	
}

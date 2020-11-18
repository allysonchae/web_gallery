package com.proj.web.vo;

import lombok.Data;

@Data
public class MarketVO {

	private int market_seq;
	private int gallery_seq;
	private int work_seq;
	private String work_name;
	private String work_description;
	private String member_id;
	private String member_nickname;
	private String market_price;
	private String market_amount;
	private String market_size;
	private int sale_state; //0또는 1 1이면 판매중
	
}

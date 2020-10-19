package com.proj.web.vo;

import lombok.Data;

@Data
public class WorkVO {

	private int work_seq;
	private int id;
	private String work_name;
	private String work_description;
	private String work_originalFileName;
	private String work_savedFileName;
	
}

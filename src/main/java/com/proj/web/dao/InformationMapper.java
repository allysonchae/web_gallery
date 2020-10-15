package com.proj.web.dao;

import java.util.ArrayList;

import com.proj.web.vo.InformationVO;

public interface InformationMapper {

	public ArrayList<InformationVO> selectAllInformation();
	
}

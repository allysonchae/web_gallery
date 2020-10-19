package com.proj.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.web.dao.InformationDAO;
import com.proj.web.vo.InformationVO;

@Service
public class InformationService {
	
	@Autowired
	private InformationDAO dao;
	
	public ArrayList<InformationVO> selectAllInformation(){
		
		ArrayList<InformationVO> list = dao.selectAllInformation();
		
		return list;
		
	}
	
}

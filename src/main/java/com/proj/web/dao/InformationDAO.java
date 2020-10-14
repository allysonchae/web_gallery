package com.proj.web.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.web.vo.InformationVO;

@Repository
public class InformationDAO {

	@Autowired
	private SqlSession ss;
	
	public ArrayList<InformationVO> selectAllInformation(){
		
		InformationMapper im = ss.getMapper(InformationMapper.class);
		ArrayList<InformationVO> list = null;
		
		try {
			list = im.selectAllInformation();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
}

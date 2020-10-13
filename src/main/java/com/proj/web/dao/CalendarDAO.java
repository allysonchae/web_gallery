package com.proj.web.dao;

import java.util.ArrayList;
import java.util.HashMap;import javax.print.attribute.HashAttributeSet;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.web.vo.GalleryVO;

@Repository
public class CalendarDAO {

	@Autowired
	private SqlSession ss;
	
	
	public ArrayList<GalleryVO> gallerySelectAll(){
		
		CalendarMapper cm = ss.getMapper(CalendarMapper.class);
		ArrayList<GalleryVO> list = null;
		
		try {
			list = cm.gallerySelectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
}

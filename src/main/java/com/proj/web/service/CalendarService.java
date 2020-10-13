package com.proj.web.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.web.dao.CalendarDAO;
import com.proj.web.vo.GalleryVO;

@Service
public class CalendarService {

	@Autowired
	private CalendarDAO dao;
	
	public ArrayList<GalleryVO> gallerySelectAll(){
		
		ArrayList<GalleryVO> list = dao.gallerySelectAll();
		
		return list;
	}
	
}

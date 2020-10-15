package com.proj.web.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.web.dao.CalendarDAO;
import com.proj.web.vo.GalleryVO;
import com.proj.web.vo.MemberVO;

@Service
public class CalendarService {

	@Autowired
	private CalendarDAO dao;
	
	public ArrayList<GalleryVO> gallerySelectAll(){
		
		ArrayList<GalleryVO> list = dao.gallerySelectAll();
		
		return list;
	}
	
	public GalleryVO gallerySelectOne(int id) {
		
		GalleryVO gallery = dao.gallerySelectOne(id);
		
		return gallery;
		
	}
	
	public MemberVO nickNameFind(String member_id) {
		
		MemberVO member = dao.nickNameFind(member_id);
		
		return member;
		
	}
	
}

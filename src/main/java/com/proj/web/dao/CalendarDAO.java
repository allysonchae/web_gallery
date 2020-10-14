package com.proj.web.dao;

import java.util.ArrayList;
import java.util.HashMap;import javax.print.attribute.HashAttributeSet;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.web.vo.GalleryVO;
import com.proj.web.vo.MemberVO;

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
	
	public GalleryVO gallerySelectOne(int id){
		
		CalendarMapper cm = ss.getMapper(CalendarMapper.class);
		GalleryVO gallery = null;
		
		try {
			gallery = cm.gallerySelectOne(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return gallery;
		
	}
	
	public MemberVO nickNameFind(String member_id) {
		
		CalendarMapper cm =  ss.getMapper(CalendarMapper.class);
		MemberVO member = null;
		
		try {
			member = cm.nickNameFind(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member;
		
	}
	
	
}

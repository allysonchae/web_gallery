package com.proj.web.dao;

import java.util.ArrayList;

import com.proj.web.vo.GalleryVO;
import com.proj.web.vo.MemberVO;

public interface CalendarMapper {

	public ArrayList<GalleryVO> gallerySelectAll();
	
	public GalleryVO gallerySelectOne(int id);
	
	public MemberVO nickNameFind(String member_id);
	
}

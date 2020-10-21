package com.proj.web.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.proj.web.vo.GalleryVO;
import com.proj.web.vo.WorkVO;

public interface WorkMapper {

	public int galleryWrite(GalleryVO gallery);
	
	public int workWrite(WorkVO work);
	
	public int gallery_Seq();
	
	public ArrayList<HashMap<String, Object>> workRead();
	
	public ArrayList<GalleryVO> gallerySelectAll();
	
	public WorkVO presentWork(int id);
	
	public GalleryVO presentGallery(int id);
	
	public HashMap<String, Object> informationGalleryJsp(int id);
	
	public ArrayList<HashMap<String, Object>> selectGalleryOne(int gallery_seq);
	
	public WorkVO selectWorkOne(HashMap<String , Object> map);
	
	public ArrayList<HashMap<String, Object>> selectMyGallery(String member_id);
	
	public int deleteGallery(int gallery_seq);
}

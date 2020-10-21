package com.proj.web.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.web.service.WorkService;
import com.proj.web.vo.GalleryVO;
import com.proj.web.vo.WorkVO;

@Repository
public class WorkDAO {
	
	final static Logger logger = LoggerFactory.getLogger(WorkDAO.class);
	
	@Autowired
	private SqlSession ss;
	
	public int galleryWrite(GalleryVO gallery) {
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		int result = 0;

		try {
			result = wm.galleryWrite(gallery);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public int workWrite(WorkVO work) {
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		int result = 0;

		try {
			result = wm.workWrite(work);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public int gallery_Seq() {
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		int cnt = 0;
		try {
			cnt = wm.gallery_Seq();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}
	
	public ArrayList<HashMap<String, Object>> workRead(){
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		ArrayList<HashMap<String, Object>> list = null;

		try {
			list = wm.workRead();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public ArrayList<GalleryVO> gallerySelectAll(){
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		ArrayList<GalleryVO> list = null;
		
		try {
			list = wm.gallerySelectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public WorkVO presentWork(int id){
		
		logger.info("다오 gallery_seq : {}", id);
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		WorkVO work = null;
		
		try {
			work = wm.presentWork(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("다오 work : {} ", work);
		
		return work;
		
	}
	
	public GalleryVO presentGallery(int id){
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		GalleryVO gallery = null;
		
		try {
			gallery = wm.presentGallery(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return gallery;
		
	}
	
	public HashMap<String, Object> informationGalleryJsp(int id){
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		HashMap<String, Object> map = null;
		
		try {
			map = wm.informationGalleryJsp(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
		
	}
	
	public ArrayList<HashMap<String, Object>> selectGalleryOne(int gallery_seq){
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		ArrayList<HashMap<String, Object>> list = null;
		
		try {
			list = wm.selectGalleryOne(gallery_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public WorkVO selectWorkOne(HashMap<String , Object> map){
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		WorkVO work = null;
		
		try {
			work = wm.selectWorkOne(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return work;
		
	}
	
	public ArrayList<HashMap<String, Object>> selectMyGallery(String member_id){
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		ArrayList<HashMap<String, Object>> list = null;
		
		try {
			list = wm.selectMyGallery(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public int deleteGallery(int gallery_seq) {
		
		
		WorkMapper wm = ss.getMapper(WorkMapper.class);
		int cnt = wm.deleteGallery(gallery_seq);
		
		try {
			cnt = wm.deleteGallery(gallery_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return cnt;
		
	}


}

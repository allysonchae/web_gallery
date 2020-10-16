package com.proj.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.web.vo.GalleryVO;
import com.proj.web.vo.WorkVO;

@Repository
public class WorkDAO {
	
	@Autowired
	private SqlSession ss;
	
	public int galleryWrite(GalleryVO gallery) {
		WorkMapper mapper = ss.getMapper(WorkMapper.class);
		int result = 0;

		try {
			result = mapper.galleryWrite(gallery);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public int workWrite(WorkVO work) {
		WorkMapper mapper = ss.getMapper(WorkMapper.class);
		int result = 0;

		try {
			result = mapper.workWrite(work);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public int gallery_Seq() {
		WorkMapper mapper = ss.getMapper(WorkMapper.class);
		int cnt = 0;
		try {
			cnt = mapper.gallery_Seq();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}


}

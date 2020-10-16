package com.proj.web.dao;

import com.proj.web.vo.GalleryVO;
import com.proj.web.vo.WorkVO;

public interface WorkMapper {

	public int galleryWrite(GalleryVO gallery);
	
	public int workWrite(WorkVO work);
	
	public int gallery_Seq();
	
}

package com.proj.web.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.proj.web.dao.WorkDAO;
import com.proj.web.util.FileService;
import com.proj.web.vo.GalleryVO;
import com.proj.web.vo.WorkVO;

@Service
public class WorkService {
	
	final static Logger logger = LoggerFactory.getLogger(WorkService.class);

	@Autowired
	private WorkDAO dao;
	
	private String uploadPath = "/boardTest";
	
	public String galleryWrite(GalleryVO gallery, ArrayList<WorkVO> workList, MultipartFile[] upload) {

		logger.info("gallery : {}", gallery);
		
		int result = dao.galleryWrite(gallery);
		int cnt = dao.gallery_Seq()-1;
		
		logger.info("service 파일 개수 : {}", upload.length);
		
		if (result != 0) {
			for(int i = 0 ; i<upload.length ; i++) {
				WorkVO work = workList.get(i);
				if (!upload[i].isEmpty()) {
					String savedfile = FileService.saveFile(upload[i], uploadPath);
					work.setWork_savedFileName(savedfile);
					work.setWork_originalFileName(upload[i].getOriginalFilename());
				
					work.setGallery_seq(cnt);
					System.out.println(i+1 +"번째 서비스 저장 : work"+ work);
					dao.workWrite(work);
				} 
			}
		}
		
		return "redirect:/";
		
	}
	
}

package com.proj.web.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.proj.web.service.CalendarService;
import com.proj.web.service.WorkService;
import com.proj.web.vo.GalleryVO;
import com.proj.web.vo.LikeVO;
import com.proj.web.vo.MemberVO;
import com.proj.web.vo.WorkVO;

@Controller
public class WorkController {
	
	private static final Logger logger = LoggerFactory.getLogger(WorkController.class);
	
	private String uploadPath = "/boardTest";
	
	@Autowired
	private WorkService ws;

	@RequestMapping(value = "/workWrite", method = RequestMethod.POST)
	public String workWrite(GalleryVO gallery
							,@RequestParam("work_description") String[] work_description
							,@RequestParam("work_name") String[] work_name
							,@RequestParam("upload") MultipartFile[] upload) {
		
		logger.info("controller 파일 개수 : {}", upload.length);
		logger.info("gallery : {}", gallery);
		
		ArrayList<WorkVO> workList = new ArrayList<WorkVO>();
		
		for(int i = 0 ; i<upload.length ; i++) {
			WorkVO work = new WorkVO();
			work.setWork_seq(i);
			work.setWork_description(work_description[i]);
			work.setWork_name(work_name[i]);
			workList.add(work);
		}
		
		String page = ws.galleryWrite(gallery, workList , upload);
		
		return page;
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void download(String id, String work_seq, HttpServletResponse response) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("work_seq", work_seq);
		
		WorkVO work = ws.selectWorkOne(map);
		
		String originalFile = work.getWork_originalFileName();
		
		try {
			response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(originalFile, "utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		String fullPath = uploadPath+"/"+work.getWork_savedFileName();
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/deleteGallery", method = RequestMethod.GET)
	public String deleteGallery(int gallery_seq) {
		
		logger.info("삭제할 갤러리 : {}", gallery_seq);
		
		ws.deleteGallery(gallery_seq);
		
		return "redirect:/";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/likeCount", method = RequestMethod.GET)
	public int likeCount(int gallery_seq) {
		
		int cnt = ws.likeCount(gallery_seq);
		
		return cnt;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/plusLike" , method = RequestMethod.GET)
	public void plusLike(int gallery_seq) {
		
		logger.info("gallery_seq 플러스 : {}", gallery_seq);
		
		ws.plusLike(gallery_seq);
		
	}

	@ResponseBody
	@RequestMapping(value = "/minusLike" , method = RequestMethod.GET)
	public void minusLike(int gallery_seq) {
		
		logger.info("gallery_seq 마이너스 : {}", gallery_seq);
		
		ws.minusLike(gallery_seq);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/onLike" , method = RequestMethod.GET)
	public void onLike(LikeVO like) {
		
		ws.onLike(like);
		
	}

	@ResponseBody
	@RequestMapping(value = "/offLike" , method = RequestMethod.GET)
	public void offLike(LikeVO like) {
		
		ws.offLike(like);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/likeCheck" , method = RequestMethod.GET)
	public int likeCheck(LikeVO like) {
		
		return ws.likeCheck(like);
		
	}
	
}

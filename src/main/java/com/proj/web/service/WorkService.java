package com.proj.web.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.print.attribute.HashAttributeSet;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.proj.web.dao.WorkDAO;
import com.proj.web.util.FileService;
import com.proj.web.vo.GalleryVO;
import com.proj.web.vo.MemberVO;
import com.proj.web.vo.WorkVO;

@Service
public class WorkService {
	
	final static Logger logger = LoggerFactory.getLogger(WorkService.class);

	@Autowired
	private HttpSession session;
	
	@Autowired
	private WorkDAO dao;
	@Autowired
	private WorkService se;
	@Autowired
	private CalendarService cs;
	
	private String uploadPath = "/boardTest";
	
	public String galleryWrite(GalleryVO gallery, ArrayList<WorkVO> workList, MultipartFile[] upload) {

		logger.info("gallery : {}", gallery);
		String memberID = (String) session.getAttribute("loginID");
		gallery.setMember_id(memberID);
		
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
				
					work.setId(cnt);
					System.out.println(i+1 +"번째 서비스 저장 : work"+ work);
					dao.workWrite(work);
				} 
			}
		}
		
		return "redirect:/";
		
	}
	
	public String searchNickname() {
		
		String member_id = (String) session.getAttribute("loginID");
		
		MemberVO member = cs.nickNameFind(member_id);
		
		return member.getMember_nickname(); 
		
	}
	
	
	//모든 전시회 가저오기
	public ArrayList<HashMap<String, Object>> workRead(){

		ArrayList<HashMap<String, Object>> list = dao.workRead();

		return list;
	}
	
	//전시회 하나 가져오기
	public ArrayList<HashMap<String, Object>> selectGalleryOne(int gallery_seq) {
		
		return dao.selectGalleryOne(gallery_seq);
		
	}
	
	//작품하나 가져오기
	public WorkVO selectWorkOne(HashMap<String , Object> map) {
		
		return dao.selectWorkOne(map);
		
	}
	
	
	//현재 진행중인 작품 파일 가져오기
	public ArrayList<WorkVO> workPresent(){
		
		ArrayList<WorkVO> persentWork = new ArrayList<WorkVO>();
		ArrayList<Integer> list = se.presentGallerySeqNum();
		
		for(int i = 0 ; i < list.size() ; i++) {
			int id = list.get(i);
			WorkVO work = dao.presentWork(id);
			persentWork.add(work);
		}
		
		return persentWork;
		
	}
	
	
	//현재 진행중인 갤러리 가져오기
	public ArrayList<GalleryVO> presentGallery(){
		
		ArrayList<GalleryVO> presentGallery = new ArrayList<GalleryVO>();
		ArrayList<Integer> list = se.presentGallerySeqNum();
		
		for(int i = 0 ; i < list.size() ; i++) {
			presentGallery.add(dao.presentGallery(list.get(i)));
		}
		
		return presentGallery;
		
	}
	
	//갤러리 jsp에서 사용할 현재 진행중인 전시 정보 가져오기
	public ArrayList<HashMap<String, Object>> presentGalleryJsp(){
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		ArrayList<Integer> idList = se.presentGallerySeqNum();
		
		for(int i = 0 ; i < idList.size() ; i++) {
			list.add(dao.informationGalleryJsp(idList.get(i)));
		}
		
		return list;
		
	}
	
	//갤러리 jsp에서 사용할 전시 예정중인 정보 가져오기
	public ArrayList<HashMap<String, Object>> futureGalleryJsp(){
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		ArrayList<Integer> idList = se.futureGallerySeqNum();
		
		for(int i = 0 ; i < idList.size() ; i++) {
			list.add(dao.informationGalleryJsp(idList.get(i)));
		}
		
		return list;
		
	}
	
	//전시예정 중인 갤러리 시퀀스 번호 가져오기
	public ArrayList<Integer> futureGallerySeqNum(){
		
		ArrayList<GalleryVO> tempList = dao.gallerySelectAll();
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar time = Calendar.getInstance();
		String presentDateTemp = sdf.format(time.getTime());
		
		for(int i = 0 ; i < tempList.size() ; i++) {
			
			GalleryVO g = tempList.get(i);
			
			String startDateTemp = g.getStart();
			System.out.println("시작날짜 : "+startDateTemp);
			String endDateTemp = g.getEnd();
			System.out.println("끝나는날짜 : "+endDateTemp);
			
			java.util.Date startDate = null;
			java.util.Date endDate = null;
			java.util.Date presentDate = null;
			
			try {
				startDate = sdf.parse(startDateTemp);
				endDate = sdf.parse(endDateTemp);
				presentDate = sdf.parse(presentDateTemp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(startDate.after(presentDate)) {
				System.out.println("전시 예정 중인 갤러리 시퀀스 :"+g.getId());
				list.add(g.getId());
			}
		}
			
			return list;
		
	}
	
	
	//현재 진행 중인 갤러리 시퀀스 가져오기
	public ArrayList<Integer> presentGallerySeqNum(){
		
		ArrayList<GalleryVO> tempList = dao.gallerySelectAll();
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar time = Calendar.getInstance();
		String presentDateTemp = sdf.format(time.getTime());
		
		for(int i = 0 ; i < tempList.size() ; i++) {
			
			GalleryVO g = tempList.get(i);
			
			String startDateTemp = g.getStart();
			System.out.println("시작날짜 : "+startDateTemp);
			String endDateTemp = g.getEnd();
			System.out.println("끝나는날짜 : "+endDateTemp);
			
			java.util.Date startDate = null;
			java.util.Date endDate = null;
			java.util.Date presentDate = null;
			
			try {
				startDate = sdf.parse(startDateTemp);
				endDate = sdf.parse(endDateTemp);
				presentDate = sdf.parse(presentDateTemp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(startDate.before(presentDate) || startDate.equals(presentDate)) {
				if(endDate.after(presentDate)) {
					System.out.println("현재 전시중인 갤러리 시퀀스 :"+g.getId());
					list.add(g.getId());
				}
			}
		}
		
		return list;
	}
	
	
	public ArrayList<HashMap<String, Object>> selectMyGallery(){
		
		String member_id = (String) session.getAttribute("loginID");
		
		return dao.selectMyGallery(member_id);
		
	}
	
	public int deleteGallery(int gallery_seq) {
		
		return dao.deleteGallery(gallery_seq);
		
	}
	
}

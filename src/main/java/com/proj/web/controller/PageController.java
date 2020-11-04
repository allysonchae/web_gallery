package com.proj.web.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.mail.Session;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.web.service.CalendarService;
import com.proj.web.service.InformationService;
import com.proj.web.service.WorkService;
import com.proj.web.util.PageNavigator;
import com.proj.web.vo.GalleryVO;
import com.proj.web.vo.InformationVO;
import com.proj.web.vo.MarketVO;
import com.proj.web.vo.MemberVO;
import com.proj.web.vo.ReplyVO;
import com.proj.web.vo.WorkVO;

import com.proj.web.service.MemberService;
import com.proj.web.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PageController {

	private static final Logger logger = LoggerFactory.getLogger(PageController.class);

	private String uploadPath = "/boardTest";

	@Autowired
	private CalendarService cs;
	@Autowired
	private InformationService is;
	@Autowired
	private WorkService ws;
	@Autowired
	private MemberService service;
	
	final int countPerPage = 6;			//페이지당 글 수
	final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "/index";
	}

	//공지사항
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info(Model model) {

		ArrayList<InformationVO> list = is.selectAllInformation();

		logger.info("list: {}", list);

		model.addAttribute("list", list);

		return "/info";
	}

	//이용안내
	@RequestMapping(value = "/service", method = RequestMethod.GET)
	public String about() {
		return "/service";
	}

	//현재 오픈된 갤러리
	@RequestMapping(value = "/gallery", method = RequestMethod.GET)
	public String gallery(Model model, HttpServletResponse response) {

		ArrayList<HashMap<String, Object>> pList = ws.presentGalleryJsp();
		ArrayList<HashMap<String, Object>> fList = ws.futureGalleryJsp();

		logger.info("pList : {}", pList);
		logger.info("fList : {}", fList);

		model.addAttribute("pList", pList);
		model.addAttribute("fList", fList);

		return "/gallery";
	}

	//갤러리 페이지
	@RequestMapping(value = "/galleryDetail", method = RequestMethod.GET)
	public String galleryDetail(int gallery_seq, Model model, HttpSession session) {

		logger.info("gallery_seq : {}", gallery_seq);

		ArrayList<HashMap<String, Object>> list = ws.selectGalleryOne(gallery_seq);
		logger.info("list : {}", list);

		HashMap<String, Object> map = list.get(0);
		logger.info("map : {}",map);
		
		logger.info("gallery_templete : {}", map.get("GALLERY_TEMPLATE"));
		String templeteNum = String.valueOf(map.get("GALLERY_TEMPLATE"));

		ArrayList<ReplyVO> replylist = ws.listReply(gallery_seq);
		String nickname = (String)session.getAttribute("loginNickName");
		ArrayList<ReplyVO> replylist_5 = ws.listReply_5(gallery_seq);
		logger.info("saldkgjoibe : {}",replylist);
		logger.info("컨트롤러 5555555 : {}",replylist_5);
		model.addAttribute("replylist_5", replylist_5);
		model.addAttribute("replylist", replylist);
		
		model.addAttribute("nickname", nickname);
		model.addAttribute("gallery_seq", gallery_seq);
		model.addAttribute("map", map);
		model.addAttribute("list", list);

		if (templeteNum.equals("1"))
			return "/cubeEffect";
		else if (templeteNum.equals("2"))
			return "/coverflowEffect";

		return "/FlipEffect";
	}
	
	@ResponseBody
	@RequestMapping(value = "/replylist", method = RequestMethod.GET)
	public ArrayList<ReplyVO> replylist(int gallery_seq) {
		
		ArrayList<ReplyVO> replylist = ws.listReply(gallery_seq);
		
		return replylist;
	}
	

	@RequestMapping(value = "/workDescription", method = RequestMethod.GET)
	public String workDescription(int work_seq, int id, Model model) {

		logger.info("work_seq : {}", work_seq);
		logger.info("id : {}", id);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("work_seq", work_seq);

		WorkVO work = ws.selectWorkOne(map);

		logger.info("work : {}", work);

		model.addAttribute("work", work);
		model.addAttribute("work_seq", work_seq);
		model.addAttribute("id", id);

		return "/workDescription";
	}

	@RequestMapping(value = "/presentGallery", method = RequestMethod.GET)
	public String presentGallery(Model model) {

		ArrayList<HashMap<String, Object>> pList = ws.presentGalleryJsp();

		logger.info("pList : {}", pList);

		model.addAttribute("pList", pList);

		return "/presentGallery";
	}

	@RequestMapping(value = "/futureGallery", method = RequestMethod.GET)
	public String futureGallery(Model model) {

		ArrayList<HashMap<String, Object>> fList = ws.futureGalleryJsp();

		logger.info("fList : {}", fList);
		model.addAttribute("fList", fList);

		return "/futureGallery";
	}

	@RequestMapping(value = "/memberGallery", method = RequestMethod.GET)
	public String memberGallery(String member_id, Model model) {
		
		ArrayList<HashMap<String, Object>> list = ws.onlyMemberInformationGalleryJsp(member_id);
		
		HashMap<String, Object> map = list.get(0);
		
		logger.info("member_id : {}", member_id);
		logger.info("memberGallery list : {}", list);
		
		model.addAttribute("list", list);
		model.addAttribute("map", map);
		
		return "/memberGallery";
	}
	
	//오픈예정 갤러리
	@RequestMapping(value = "/expectedGallery", method = RequestMethod.GET)
	public String expectedGallery() {
		return "/expectedGallery";
	}

	@RequestMapping(value = "/requestGallery", method = RequestMethod.GET)
	public String requestGallery() {
		return "/requestGallery";
	}

	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public String community() {
		return "/community";
	}

	//이벤트 예정달력확인
	@RequestMapping(value = "/calender", method = RequestMethod.GET)
	public String tours() {
		return "/calender";
	}

	//캘린더에 모든 일정 전송
	@ResponseBody
	@RequestMapping(value = "/gallerySchedule", method = RequestMethod.POST)
	public ArrayList<GalleryVO> gallerySchedule() {

		ArrayList<GalleryVO> list = cs.gallerySelectAll();

		return list;
	}

	//캘린더에서 특정 이밴트 클리 시 닉네임 캘린더jsp로 전송
	@ResponseBody
	@RequestMapping(value = "/getSchedule", method = RequestMethod.POST)
	public String getSchedule(String info) {

		logger.info(info);

		int id = Integer.parseInt(info);
		GalleryVO gallery = cs.gallerySelectOne(id);

		MemberVO member = cs.nickNameFind(gallery.getMember_id());
		String nickName = member.getMember_nickname();

		return nickName;
	}

	/*
	 * //로그인
	 * 
	 * @RequestMapping(value="/login",method=RequestMethod.GET) public String
	 * login() { return "/login"; }
	 */

	//내 정보
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String contact(HttpSession session, Model model) {
		String member_id = (String) session.getAttribute("loginID");
		String member_nickname = (String) session.getAttribute("loginNickName");
		HashMap<String, String> hash = new HashMap<String, String>();

		hash = service.memberSelectOneAll(member_id);
		model.addAttribute("hash", hash);
		model.addAttribute("loginNickName", member_nickname);

		return "/myPage";
	}

	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public String blog(@RequestParam(value = "page", defaultValue = "1") int page
						,@RequestParam(value = "searchText", defaultValue = "") String searchText
						,Model model) {
		
		int total = ws.getGalTotal(searchText);
		logger.info("컨트롤러로 받아온 gallery 개수{}", total);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		ArrayList<HashMap<String, Object>> gallerylist = ws.listGallery(searchText, navi.getStartRecord(), navi.getCountPerPage());
		logger.info("컨트롤러로 받아온 gallerylist {}", gallerylist);

		model.addAttribute("gallerylist", gallerylist);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);

		return "/blog";
	}

	@RequestMapping(value = "/viewOpenCover", method = RequestMethod.GET)
	public String openCube() {
		return "viewOpenCover";
	}

	@RequestMapping(value = "/viewOpenCube", method = RequestMethod.GET)
	public String viewOpenCube() {
		return "viewOpenCube";
	}

	@RequestMapping(value = "/viewOpenFlip", method = RequestMethod.GET)
	public String viewOpenFlip() {
		return "viewOpenFlip";
	}

	/**
	 * 리플 저장 처리
	 */
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO reply, HttpSession session, Model model) {

		//세션에서 로그인한 사용자의 아이디를 읽어서 Reply객체의 작성자 정보에 세팅
		String nickname = ws.searchNickname();
		reply.setMember_nickname(nickname);
		logger.info("컨트롤러 reply : {}", reply);

		//리플 정보를 DB에 저장
		ws.insertReply(reply);

		//읽던 게시글로 되돌아 감
		return "redirect:/galleryDetail?gallery_seq=" + reply.getId();
	}

	//댓글 삭제
	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	public String deleteReply(ReplyVO reply, HttpSession session) {
		
		logger.info("asgohorawebf:{}",reply);
		
		//삭제할 글 번호와 본인 글인지 확인할 로그인아이디
		String nickname = ws.searchNickname();
		reply.setMember_nickname(nickname);

		logger.info("asgohorawebf:{}",reply);
		ws.deleteReply(reply);
		return "redirect:/galleryDetail?gallery_seq=" + reply.getId();
	}

	//댓글 수정
	@RequestMapping (value="/replyEdit", method=RequestMethod.POST)
	public String replyEdit(HttpSession session, ReplyVO reply) {

	//삭제할 리플 정보와 본인 글인지 확인할 로그인아이디
	String id = (String) session.getAttribute("loginID");
	reply.setMember_id(id);

	//리플  수정 처리
	ws.updateReply(reply);
	//원래의 글읽기 화면으로 이동 
	return "redirect:/galleryDetail?gallery_seq=" + reply.getId();
	}
	
}

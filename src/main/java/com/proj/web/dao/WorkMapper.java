package com.proj.web.dao;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.proj.web.vo.GalleryVO;
import com.proj.web.vo.LikeVO;
import com.proj.web.vo.MarketVO;
import com.proj.web.vo.MemberVO;
import com.proj.web.vo.ReplyVO;
import com.proj.web.vo.WorkVO;

public interface WorkMapper {

	public int galleryWrite(GalleryVO gallery);
	
	public int workWrite(WorkVO work);
	
	public int gallery_Seq();
	
	public ArrayList<GalleryVO> gallerySelectAll();
	
	public WorkVO presentWork(int id);
	
	public GalleryVO presentGallery(int id);
	
	public HashMap<String, Object> informationGalleryJsp(int id);
	
	public ArrayList<HashMap<String, Object>> selectGalleryOne(int gallery_seq);
	
	public WorkVO selectWorkOne(HashMap<String , Object> map);
	
	public ArrayList<HashMap<String, Object>> selectMyGallery(String member_id);
	
	public int deleteGallery(int gallery_seq);

	public int insertReply(ReplyVO reply);

	public ArrayList<ReplyVO> getReplyList(int gallery_seq);

	public ArrayList<ReplyVO> getReplyList_5(int gallery_seq);
	
	public int deleteReply(ReplyVO reply);

	public void updateReply(ReplyVO reply);
	
	public ArrayList<HashMap<String, Object>> onlyMemberInformationGalleryJsp(String member_id);

	public int getGalTotal(HashMap<String, Object> map);

	public ArrayList<HashMap<String, Object>> listGallery(HashMap<String, Object> map, RowBounds rb);
	
	public void plusLike(int gallery_seq);
	
	public void minusLike(int gallery_seq);

	public int likeCount(int gallery_seq);

	public void onLike(LikeVO like);
	
	public void offLike(LikeVO like);
	
	public int likeCheck(LikeVO like);
}

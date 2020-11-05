package com.proj.web.dao;

import java.util.ArrayList;

import com.proj.web.vo.FollowVO;

public interface FollowMapper {

	public void insertFollower(FollowVO follow);
	
	public void deleteFollower(FollowVO follow);
	
	public int checkFollower(FollowVO follow);
	
	public int countFollower(FollowVO follow);
	
	public ArrayList<FollowVO> followerList(FollowVO follow);
	
	public ArrayList<FollowVO> followingList(FollowVO follow);
	
	public int countFollowing(FollowVO follow);
	
}

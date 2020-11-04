package com.proj.web.dao;

import com.proj.web.vo.FollowVO;

public interface FollowMapper {

	public void insertFollower(FollowVO follow);
	
	public void deleteFollower(FollowVO follow);
	
	public int checkFollower(FollowVO follow);
	
}

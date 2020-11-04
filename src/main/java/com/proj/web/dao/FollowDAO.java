package com.proj.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.proj.web.vo.FollowVO;

@Repository
public class FollowDAO {

	@Autowired
	private SqlSession ss;
	
	public void insertFollower(FollowVO follow) {
		
		FollowMapper fm = ss.getMapper(FollowMapper.class);
		
		try {
			fm.insertFollower(follow);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void deleteFollower(FollowVO follow) {
		
		FollowMapper fm = ss.getMapper(FollowMapper.class);
		
		try {
			fm.deleteFollower(follow);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int checkFollower(FollowVO follow) {
		
		FollowMapper fm = ss.getMapper(FollowMapper.class);
		int cnt = 0;
		
		try {
			cnt = fm.checkFollower(follow);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
		
	}
	
}

package com.wt.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.frame.Dao;
import com.wt.mapper.UserMapper;
import com.wt.vo.User;

@Repository("userDao")
public class UserDao implements Dao<User, String> {

	@Autowired
	UserMapper mapper;
	
	@Override
	public void insert(User t) {
		mapper.insert(t);		
	}
	

	@Override
	public void delete(String s) {
		mapper.delete(s);
	}

	@Override
	public void update(User t) {
		mapper.update(t);
	}

	@Override
	public User select(String s) {
		
		return mapper.select(s);
	}

	@Override
	public List<User> select() {
		return mapper.selectall();
	}


	// 사용 X
	@Override
	public List<User> selectCty(String s) {
		// TODO Auto-generated method stub
		return null;
	}

	// 사용 X
	@Override
	public List<User> selectLoc(String s) {
		// TODO Auto-generated method stub
		return null;
	}

	// 사용 X
	@Override
	public List<User> selectPrefRank(String s) {
		// TODO Auto-generated method stub
		return null;
	}

	// 사용X
	@Override
	public List<User> selectId(String s) {
		// TODO Auto-generated method stub
		return null;
	}

	// 사용X
	@Override
	public List<User> joinloc(String s) {
		// TODO Auto-generated method stub
		return null;
	}

	// 사용X
	@Override
	public List<User> joinlikey(String s) {
		// TODO Auto-generated method stub
		return null;
	}

	//사용X
	@Override
	public List<User> selectPrefContiCnt() {
		// TODO Auto-generated method stub
		return null;
	}

	//사용X
	@Override
	public List<User> selectPrefCityCnt() {
		// TODO Auto-generated method stub
		return null;
	}

}








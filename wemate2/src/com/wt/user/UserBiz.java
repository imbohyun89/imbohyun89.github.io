package com.wt.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wt.frame.Biz;
import com.wt.frame.Dao;
import com.wt.vo.User;

@Service("userBiz")
public class UserBiz implements Biz<User, String> {

	@Resource(name="userDao")
	Dao<User, String> dao;
	
	public UserBiz() {

	}
	
	@Override
	public void register(User t) {
		dao.insert(t);
		//dao.insert(t);
	}
	@Override
	public void remove(String s) {
		dao.delete(s);

	}
	@Override
	public void modify(User t) {
		dao.update(t);
	}

	@Override
	public User get(String s) {
		return dao.select(s);
	}

	@Override
	public List<User> get() {
		return dao.select();
	}
	
	// 사용X
	@Override
	public List<User> getCty(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	// 사용X
	@Override
	public List<User> getLoc(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	// 사용X
	@Override
	public List<User> getPrefRank(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 사용X
	@Override
	public List<User> getId(String s) {
		// TODO Auto-generated method stub
		return null;
	}

	// 사용X
	@Override
	public List<User> joinloc(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//사용X
	@Override
	public List<User> joinlikey(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	//사용X	
	@Override
	public List<User> getPrefContiCnt() {
		// TODO Auto-generated method stub
		return null;
	}
	//사용X
	@Override
	public List<User> getPrefCityCnt() {
		// TODO Auto-generated method stub
		return null;
	}

	


}











package com.wt.likey;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.frame.Dao;
import com.wt.mapper.LikeyMapper;
import com.wt.vo.Likey;

@Repository("likeyDao")
public class LikeyDao implements Dao<Likey, String> {

	@Autowired
	LikeyMapper mapper;
	
	@Override
	public void insert(Likey t) {
		mapper.insert(t);
	}

	@Override
	public void delete(String ss) {
		Integer s = Integer.parseInt(ss);
		mapper.delete(s);
	}

	@Override
	public void update(Likey t) {
		mapper.update(t);
	}

	@Override
	public Likey select(String ss) {
		Integer s = Integer.parseInt(ss);
		return mapper.select(s);
	}

	@Override
	public List<Likey> select() {
		return mapper.selectall();
	}
	
	@Override
	public List<Likey> selectId(String t) {
		return mapper.selectid(t);
	}
	
	// 사용 X
	@Override
	public List<Likey> selectCty(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//사용X
	@Override
	public List<Likey> selectLoc(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 사용X
	@Override
	public List<Likey> selectPrefRank(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 사용X
	@Override
	public List<Likey> joinloc(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 사용X
	@Override
	public List<Likey> joinlikey(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	//사용X
	@Override
	public List<Likey> selectPrefContiCnt() {
		// TODO Auto-generated method stub
		return null;
	}
	//사용X
	@Override
	public List<Likey> selectPrefCityCnt() {
		// TODO Auto-generated method stub
		return null;
	}

}

package com.wt.likey;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wt.frame.Biz;
import com.wt.frame.Dao;
import com.wt.vo.Likey;

@Service("likeyBiz")
public class LikeyBiz implements Biz<Likey, String> {

	@Resource(name="likeyDao")
	Dao<Likey, String> dao;
	
	public LikeyBiz() {
	}
	
	@Override
	public void register(Likey t) {
		dao.insert(t);
	}

	@Override
	public void remove(String s) {
		dao.delete(s);
	}

	@Override
	public void modify(Likey t) {
		dao.update(t);
	}

	@Override
	public Likey get(String s) {
		return dao.select(s);
	}

	@Override
	public List<Likey> get() {
		return dao.select();
	}

	@Override
	public List<Likey> getId(String s) {
		return dao.selectId(s);
	}
	
	// 사용X
	@Override
	public List<Likey> getCty(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	// 사용X
	@Override
	public List<Likey> getLoc(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	// 사용X
	@Override
	public List<Likey> getPrefRank(String s) {
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
	// 사용X
	@Override
	public List<Likey> getPrefContiCnt() {
		// TODO Auto-generated method stub
		return null;
	}
	// 사용X
	@Override
	public List<Likey> getPrefCityCnt() {
		// TODO Auto-generated method stub
		return null;
	}



}

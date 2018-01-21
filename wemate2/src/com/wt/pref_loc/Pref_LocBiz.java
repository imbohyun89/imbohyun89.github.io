package com.wt.pref_loc;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wt.frame.Biz;
import com.wt.frame.Dao;
import com.wt.vo.Likey;
import com.wt.vo.Pref_Loc;

@Service("preflocBiz")
public class Pref_LocBiz implements Biz<Pref_Loc, String> {

	@Resource(name="preflocDao")
	Dao<Pref_Loc, String> dao;
	
	public Pref_LocBiz() {
	}
	
	@Override
	public void register(Pref_Loc t) {
		dao.insert(t);
	}

	@Override
	public void remove(String s) {
		dao.delete(s);
	}

	@Override
	public void modify(Pref_Loc t) {
		dao.update(t);
	}

	@Override
	public Pref_Loc get(String s) {
		return dao.select(s);
	}

	@Override
	public List<Pref_Loc> get() {
		return dao.select();
	}

	// 사용X
	@Override
	public List<Pref_Loc> getCty(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	// 사용X
	@Override
	public List<Pref_Loc> getLoc(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	// 사용X
	@Override
	public List<Pref_Loc> getPrefRank(String s) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Pref_Loc> getId(String s) {
		return dao.selectId(s);
	}
	
	// 사용X
	@Override
	public List<Pref_Loc> joinloc(String s) {
		return null;
	}
	
	// 사용X
	@Override
	public List<Pref_Loc> joinlikey(String s) {
		return null;
	}

	// 사용X
	@Override
	public List<Pref_Loc> getPrefContiCnt() {
		// TODO Auto-generated method stub
		return null;
	}
	// 사용X
	@Override
	public List<Pref_Loc> getPrefCityCnt() {
		// TODO Auto-generated method stub
		return null;
	}


}

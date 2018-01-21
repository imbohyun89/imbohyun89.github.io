package com.wt.pref_loc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.frame.Dao;
import com.wt.mapper.Pref_LocMapper;
import com.wt.vo.Pref_Loc;

@Repository("preflocDao")
public class Pref_LocDao implements Dao<Pref_Loc, String> {

	@Autowired
	Pref_LocMapper mapper;
	
	@Override
	public void insert(Pref_Loc t) {
		mapper.insert(t);
	}

	@Override
	public void delete(String ss) {
		Integer s = Integer.parseInt(ss);
		mapper.delete(s);
	}

	@Override
	public void update(Pref_Loc t) {
		mapper.update(t);
	}

	@Override
	public Pref_Loc select(String ss) {
		Integer s = Integer.parseInt(ss);
		return mapper.select(s);
	}

	@Override
	public List<Pref_Loc> select() {
		return mapper.selectall();
	}
	
	@Override
	public List<Pref_Loc> selectId(String t) {
		return mapper.selectid(t);
	}
	
	// 사용 X
	@Override
	public List<Pref_Loc> selectCty(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//사용X
	@Override
	public List<Pref_Loc> selectLoc(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 사용X
	@Override
	public List<Pref_Loc> selectPrefRank(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 사용X
	@Override
	public List<Pref_Loc> joinloc(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	// 사용X
	@Override
	public List<Pref_Loc> joinlikey(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	//사용X
	@Override
	public List<Pref_Loc> selectPrefContiCnt() {
		// TODO Auto-generated method stub
		return null;
	}
	//사용X
	@Override
	public List<Pref_Loc> selectPrefCityCnt() {
		// TODO Auto-generated method stub
		return null;
	}

}

package com.wt.loc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.frame.Dao;
import com.wt.mapper.LocMapper;
import com.wt.vo.Loc;

@Repository("locDao")
public class LocDao implements Dao<Loc, Integer> {

	@Autowired
	LocMapper mapper;
	
	@Override
	public void insert(Loc t) {
		mapper.insert(t);
	}

	@Override
	public void delete(Integer s) {
		mapper.delete(s);
	}

	@Override
	public void update(Loc t) {
		mapper.update(t);
	}

	@Override
	public Loc select(Integer s) {
		return mapper.select(s);
	}

	@Override
	public List<Loc> select() {
		return mapper.selectall();
	}
	
	
	@Override
	public List<Loc> selectPrefRank(Integer s) {
		return mapper.selectprefrank(s);
	}
	@Override
	public List<Loc> joinloc(String s) {
		return mapper.joinloc(s);
	}
	
	@Override
	public List<Loc> joinlikey(String s) {
		return mapper.joinlikey(s);
	}
	
	// 사용 X
	@Override
	public List<Loc> selectCty(Integer s) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//사용X
	@Override
	public List<Loc> selectLoc(Integer s) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 사용X
	@Override
	public List<Loc> selectId(Integer s) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Loc> selectPrefContiCnt() {
		return mapper.selectprefconticnt();
	}

	@Override
	public List<Loc> selectPrefCityCnt() {
		return mapper.selectprefcitycnt();
	}


}

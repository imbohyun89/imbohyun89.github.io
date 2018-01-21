package com.wt.loc;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wt.frame.Biz;
import com.wt.frame.Dao;
import com.wt.vo.Loc;

@Service("locBiz")
public class LocBiz implements Biz<Loc, Integer> {

	@Resource(name="locDao")
	Dao<Loc, Integer> dao;
	
	public LocBiz() {
	}
	
	@Override
	public void register(Loc t) {
		dao.insert(t);
	}

	@Override
	public void remove(Integer s) {
		dao.delete(s);
	}

	@Override
	public void modify(Loc t) {
		dao.update(t);
	}

	@Override
	public Loc get(Integer s) {
		return dao.select(s);
	}

	@Override
	public List<Loc> get() {
		return dao.select();
	}

	// 사용X
	@Override
	public List<Loc> getCty(Integer s) {
		// TODO Auto-generated method stub
		return null;
	}
	// 사용X
	@Override
	public List<Loc> getLoc(Integer s) {
		// TODO Auto-generated method stub
		return null;
	}

	// 메인화면에 선호지역에 따른 사진 출력 시 사용
	@Override
	public List<Loc> getPrefRank(Integer s) {
		return dao.selectPrefRank(s);
	}

	// 선호지역 JOIN
	@Override
	public List<Loc> joinloc(String s) {
		return dao.joinloc(s);
	}
	
	// 관심지역 JOIN
	@Override
	public List<Loc> joinlikey(String s) {
		return dao.joinlikey(s);
	}

	// 사용X
	@Override
	public List<Loc> getId(Integer s) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Loc> getPrefContiCnt() {
		return dao.selectPrefContiCnt();
	}

	@Override
	public List<Loc> getPrefCityCnt() {
		return dao.selectPrefCityCnt();
	}



}

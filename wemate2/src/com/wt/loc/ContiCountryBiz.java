package com.wt.loc;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wt.frame.Biz;
import com.wt.frame.Dao;
import com.wt.vo.ContiCountry;

@Service("contiCountryBiz")
public class ContiCountryBiz implements Biz<ContiCountry, String> {

	@Resource(name="contiCountryDao")
	Dao<ContiCountry, String> dao;
	
	public ContiCountryBiz() {
	}
	
	@Override
	public void register(ContiCountry t) {
		dao.insert(t);
	}

	@Override
	public void remove(String s) {
		dao.delete(s);
	}

	@Override
	public void modify(ContiCountry t) {
		dao.update(t);
	}

	@Override
	public ContiCountry get(String s) {
		return dao.select(s);
	}

	@Override
	public List<ContiCountry> get() {
		return dao.select();
	}

	@Override
	public List<ContiCountry> getCty(String s) {
		return dao.selectCty(s);
	}

	@Override
	public List<ContiCountry> getLoc(String s) {
		// TODO Auto-generated method stub
		return dao.selectLoc(s);
	}

	// 사용X
	@Override
	public List<ContiCountry> getPrefRank(String s) {
		// TODO Auto-generated method stub
		return null;
	}

	// 사용X
	@Override
	public List<ContiCountry> getId(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 사용X
	@Override
	public List<ContiCountry> joinloc(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	// 사용X
	@Override
	public List<ContiCountry> joinlikey(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	//사용X
	@Override
	public List<ContiCountry> getPrefContiCnt() {
		// TODO Auto-generated method stub
		return null;
	}
	//사용X
	@Override
	public List<ContiCountry> getPrefCityCnt() {
		// TODO Auto-generated method stub
		return null;
	}

}

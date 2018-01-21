package com.wt.loc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wt.frame.Dao;
import com.wt.mapper.ContiCountryMapper;
import com.wt.vo.ContiCountry;

@Repository("contiCountryDao")
public class ContiCountryDao implements Dao<ContiCountry, String> {

	@Autowired
	ContiCountryMapper mapper;
	
	@Override
	public void insert(ContiCountry t) {
		mapper.insert(t);
	}

	@Override
	public void delete(String s) {
		mapper.delete(s);
	}

	@Override
	public void update(ContiCountry t) {
		mapper.update(t);
	}

	@Override
	public ContiCountry select(String s) {
		return mapper.select(s);
	}

	@Override
	public List<ContiCountry> select() {
		return mapper.selectall();
	}

	@Override
	public List<ContiCountry> selectCty(String s) {
		return mapper.selectcty(s); // s�� �����(��������� ����˻�)
	}

	@Override
	public List<ContiCountry> selectLoc(String s) {
		return mapper.selectloc(s); //s�� �����(��������� �����˻�)
	}

	// ���X
	@Override
	public List<ContiCountry> selectPrefRank(String s) {
		// TODO Auto-generated method stub
		return null;
	}

	// ���X
	@Override
	public List<ContiCountry> selectId(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	// ���X
	@Override
	public List<ContiCountry> joinloc(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// ���X
	@Override
	public List<ContiCountry> joinlikey(String s) {
		// TODO Auto-generated method stub
		return null;
	}
	//���X
	@Override
	public List<ContiCountry> selectPrefContiCnt() {
		// TODO Auto-generated method stub
		return null;
	}
	//���X
	@Override
	public List<ContiCountry> selectPrefCityCnt() {
		// TODO Auto-generated method stub
		return null;
	}

}

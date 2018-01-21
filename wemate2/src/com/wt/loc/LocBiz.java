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

	// ���X
	@Override
	public List<Loc> getCty(Integer s) {
		// TODO Auto-generated method stub
		return null;
	}
	// ���X
	@Override
	public List<Loc> getLoc(Integer s) {
		// TODO Auto-generated method stub
		return null;
	}

	// ����ȭ�鿡 ��ȣ������ ���� ���� ��� �� ���
	@Override
	public List<Loc> getPrefRank(Integer s) {
		return dao.selectPrefRank(s);
	}

	// ��ȣ���� JOIN
	@Override
	public List<Loc> joinloc(String s) {
		return dao.joinloc(s);
	}
	
	// �������� JOIN
	@Override
	public List<Loc> joinlikey(String s) {
		return dao.joinlikey(s);
	}

	// ���X
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

package com.wt.mapper;

import java.util.List;

import com.wt.vo.Loc;


public interface LocMapper {
	public void insert(Loc obj);
	public void delete(Integer obj);
	public void update(Loc obj);
	public Loc select(Integer obj);
	public List<Loc> selectprefrank(Integer obj);
	public List<Loc> selectprefconticnt();
	public List<Loc> selectprefcitycnt();
	public List<Loc> selectall();
	public List<Loc> joinloc(String obj);
	public List<Loc> joinlikey(String obj);

}

package com.wt.mapper;

import java.util.List;

import com.wt.vo.Loc;
import com.wt.vo.Pref_Loc;


public interface Pref_LocMapper {
	public void insert(Pref_Loc obj);
	public void delete(Integer obj);
	public void update(Pref_Loc obj);
	public Pref_Loc select(Integer obj);
	public List<Pref_Loc> selectid(String obj);
	public List<Pref_Loc> selectall();
}

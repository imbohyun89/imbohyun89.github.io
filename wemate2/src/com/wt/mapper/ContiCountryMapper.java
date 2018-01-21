package com.wt.mapper;

import java.util.List;

import com.wt.vo.ContiCountry;


public interface ContiCountryMapper {
	public void insert(ContiCountry obj);
	public void delete(String obj);
	public void update(ContiCountry obj);
	public ContiCountry select(String obj);
	public List<ContiCountry> selectcty(String obj);
	public List<ContiCountry> selectloc(String obj);
	public List<ContiCountry> selectall();
}

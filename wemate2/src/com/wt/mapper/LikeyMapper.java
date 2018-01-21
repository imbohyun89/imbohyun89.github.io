package com.wt.mapper;

import java.util.List;

import com.wt.vo.Loc;
import com.wt.vo.Likey;


public interface LikeyMapper {
	public void insert(Likey obj);
	public void delete(Integer obj);
	public void update(Likey obj);
	public Likey select(Integer obj);
	public List<Likey> selectid(String obj);
	public List<Likey> selectall();
}

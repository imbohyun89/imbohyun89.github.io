package com.wt.frame;

import java.util.List;

public interface Dao<T,S> {
	public void insert(T t);
	public void delete(S s);
	public void update(T t);
	public T select(S s);
	public List<T> select();

	public List<T> selectCty(S s);
	public List<T> selectLoc(S s);
	public List<T> selectPrefRank(S s);
	public List<T> selectId(S s);
	public List<T> joinloc(String s);
	public List<T> joinlikey(String s);
	
	public List<T> selectPrefContiCnt();
	public List<T> selectPrefCityCnt();
}










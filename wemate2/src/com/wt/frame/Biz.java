package com.wt.frame;

import java.util.List;

public interface Biz<T,S> {
	public void register(T t);
	public void remove(S s);
	public void modify(T t);
	public T get(S s);
	public List<T> get();
	
	public List<T> getCty(S s);
	public List<T> getLoc(S s);
	public List<T> getPrefRank(S s);
	public List<T> getId(S s);
	public List<T> joinloc(String s);
	public List<T> joinlikey(String s); // - 관심지역 JOIN
	
	public List<T> getPrefContiCnt();
	public List<T> getPrefCityCnt();
}











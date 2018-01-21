package com.wt.vo;

public class Pref_Loc { // 선호지역 테이블
	int num; //PK sequence
	int city_num; //FK
	String user_id; //FK

	
	public Pref_Loc() {
		super();
	}
	
	public Pref_Loc(int city_num, String user_id) {
		super();
		this.city_num = city_num;
		this.user_id = user_id;
	}

	public Pref_Loc(int num, int city_num, String user_id) {
		super();
		this.num = num;
		this.city_num = city_num;
		this.user_id = user_id;
	}
	public int getnum() {
		return num;
	}
	public void setnum(int num) {
		this.num = num;
	}
	public int getCity_num() {
		return city_num;
	}
	public void setCity_num(int city_num) {
		this.city_num = city_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "Pref_Loc [num=" + num + ", city_num=" + city_num + ", user_id=" + user_id + "]";
	}
	
	
	
}

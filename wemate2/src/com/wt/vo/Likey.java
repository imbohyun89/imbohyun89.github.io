package com.wt.vo;

public class Likey {
	int sq_num;
	String user_id;
	int city_num;
	public Likey() {
		super();
	}
	
	public Likey(String user_id, int city_num) {
		super();
		this.user_id = user_id;
		this.city_num = city_num;
	}

	public Likey(int sq_num, String user_id, int city_num) {
		super();
		this.sq_num = sq_num;
		this.user_id = user_id;
		this.city_num = city_num;
	}
	
	public int getSq_num() {
		return sq_num;
	}
	public void setSq_num(int sq_num) {
		this.sq_num = sq_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCity_num() {
		return city_num;
	}
	public void setCity_num(int city_num) {
		this.city_num = city_num;
	}
	@Override
	public String toString() {
		return "Likey [sq_num=" + sq_num + ", user_id=" + user_id + ", city_num=" + city_num + "]";
	}
	
	
	
}

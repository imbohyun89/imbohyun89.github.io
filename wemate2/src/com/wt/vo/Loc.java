package com.wt.vo;

public class Loc {
	int city_num; //PK
	String conti_name_kor;
	String conti_name_eng;
	String country_name_kor;
	String country_name_eng;
	String city_name_kor;
	String city_name_eng;
	int cnt;	// 메인 선호지역에 따른 사진 출력 변수
	int rank;	// 메인 선호지역에 따른 사진 출력 변수
	String id;	// (JOIN)회원가입시 선택하는 선호지역 변수 
	int num;	//  (JOIN)회원가입시 선택하는 선호지역 변수
	String user_id; // (JOIN)검색창에서 선택하는 관심지역 변수
	int sq_num; // (JOIN)검색창에서 선택하는 관심지역 변수
	
	// Constructor
	public Loc() {
		super();
	}
	
	public Loc(String conti_name_eng, String country_name_eng, String city_name_eng) {
		super();
		this.conti_name_eng = conti_name_eng;
		this.country_name_eng = country_name_eng;
		this.city_name_eng = city_name_eng;
	}

	public Loc(int city_num, String conti_name_kor, String conti_name_eng, String country_name_kor,
			String country_name_eng, String city_name_kor, String city_name_eng) {
		super();
		this.city_num = city_num;
		this.conti_name_kor = conti_name_kor;
		this.conti_name_eng = conti_name_eng;
		this.country_name_kor = country_name_kor;
		this.country_name_eng = country_name_eng;
		this.city_name_kor = city_name_kor;
		this.city_name_eng = city_name_eng;
	}
	
	public Loc(int city_num, String conti_name_kor, String conti_name_eng, String country_name_kor,
			String country_name_eng, String city_name_kor, String city_name_eng, int cnt, int rank) {
		super();
		this.city_num = city_num;
		this.conti_name_kor = conti_name_kor;
		this.conti_name_eng = conti_name_eng;
		this.country_name_kor = country_name_kor;
		this.country_name_eng = country_name_eng;
		this.city_name_kor = city_name_kor;
		this.city_name_eng = city_name_eng;
		this.cnt = cnt;
		this.rank = rank;
	}
	public Loc(int city_num, String conti_name_kor, String conti_name_eng, String country_name_kor,
			String country_name_eng, String city_name_kor, String city_name_eng, int cnt, int rank, String id,
			int num) {
		super();
		this.city_num = city_num;
		this.conti_name_kor = conti_name_kor;
		this.conti_name_eng = conti_name_eng;
		this.country_name_kor = country_name_kor;
		this.country_name_eng = country_name_eng;
		this.city_name_kor = city_name_kor;
		this.city_name_eng = city_name_eng;
		this.cnt = cnt;
		this.rank = rank;
		this.id = id;
		this.num = num;
	}

	public Loc(int city_num, String conti_name_kor, String conti_name_eng, String country_name_kor,
			String country_name_eng, String city_name_kor, String city_name_eng, int cnt, int rank, String id, int num,
			String user_id, int sq_num) {
		super();
		this.city_num = city_num;
		this.conti_name_kor = conti_name_kor;
		this.conti_name_eng = conti_name_eng;
		this.country_name_kor = country_name_kor;
		this.country_name_eng = country_name_eng;
		this.city_name_kor = city_name_kor;
		this.city_name_eng = city_name_eng;
		this.cnt = cnt;
		this.rank = rank;
		this.id = id;
		this.num = num;
		this.user_id = user_id;
		this.sq_num = sq_num;
	}

	// Setter and Getter
	public int getCity_num() {
		return city_num;
	}
	public void setCity_num(int city_num) {
		this.city_num = city_num;
	}
	
	public String getConti_name_kor() {
		return conti_name_kor;
	}

	public void setConti_name_kor(String conti_name_kor) {
		this.conti_name_kor = conti_name_kor;
	}

	public String getConti_name_eng() {
		return conti_name_eng;
	}

	public void setConti_name_eng(String conti_name_eng) {
		this.conti_name_eng = conti_name_eng;
	}

	public String getCountry_name_kor() {
		return country_name_kor;
	}
	public void setCountry_name_kor(String country_name_kor) {
		this.country_name_kor = country_name_kor;
	}
	public String getCountry_name_eng() {
		return country_name_eng;
	}
	public void setCountry_name_eng(String country_name_eng) {
		this.country_name_eng = country_name_eng;
	}
	public String getCity_name_kor() {
		return city_name_kor;
	}
	public void setCity_name_kor(String city_name_kor) {
		this.city_name_kor = city_name_kor;
	}
	public String getCity_name_eng() {
		return city_name_eng;
	}
	public void setCity_name_eng(String city_name_eng) {
		this.city_name_eng = city_name_eng;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	@Override
	public String toString() {
		return "Loc [city_num=" + city_num + ", conti_name_kor=" + conti_name_kor + ", conti_name_eng=" + conti_name_eng
				+ ", country_name_kor=" + country_name_kor + ", country_name_eng=" + country_name_eng
				+ ", city_name_kor=" + city_name_kor + ", city_name_eng=" + city_name_eng + ", cnt=" + cnt + ", rank="
				+ rank + ", id=" + id + ", num=" + num + ", user_id=" + user_id + ", sq_num=" + sq_num + "]";
	}

	
	
	
	

	
}

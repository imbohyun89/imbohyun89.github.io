package com.wt.vo;

public class ContiCountry {
	int city_num; //PK
	String conti_name_kor;
	String conti_name_eng;
	String country_name_kor;
	String country_name_eng;
	String city_name_kor;
	String city_name_eng;
	
	// Constructor
	public ContiCountry() {
		super();
	}
	
	public ContiCountry(int city_num, String conti_name_kor, String conti_name_eng, String country_name_kor,
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

	@Override
	public String toString() {
		return "ContiCountry [city_num=" + city_num + ", conti_name_kor=" + conti_name_kor + ", conti_name_eng="
				+ conti_name_eng + ", country_name_kor=" + country_name_kor + ", country_name_eng=" + country_name_eng
				+ ", city_name_kor=" + city_name_kor + ", city_name_eng=" + city_name_eng + "]";
	}
	
}

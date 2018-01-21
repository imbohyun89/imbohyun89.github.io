package com.wt.vo;

public class User {
	private String id;
	private String pwd;
	private String email;
	private String gender;
	private int birth;
	private int admin;
	
	public User() {
		super();
	}
	public User(String id, String pwd, String email, String gender, int birth, int admin) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
		this.admin = admin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", pwd=" + pwd + ", email=" + email + ", gender=" + gender + ", birth=" + birth
				+ ", admin=" + admin + "]";
	}

}







package com.classroom.bean;

public class User {
	private Integer u_Id;
	private String u_username;
	private String u_account;


	@Override
	public String toString() {
		return "User [u_Id=" + u_Id + ", u_username=" + u_username + ", u_account=" + u_account + ", u_password="
				+ u_password + ", u_identif=" + u_identif + ", u_active=" + u_active + "]";
	}

	public String getU_username() {
		return u_username;
	}

	public void setU_username(String u_username) {
		this.u_username = u_username;
	}

	private String u_password;
	private Integer u_identif;
	private Integer u_active;

	public Integer getU_Id() {
		return u_Id;
	}

	public void setU_Id(Integer u_Id) {
		this.u_Id = u_Id;
	}


	public String getU_account() {
		return u_account;
	}

	public void setU_account(String u_account) {
		this.u_account = u_account;
	}
	public String getU_password() {
		return u_password;
	}

	public void setU_password(String u_password) {
		this.u_password = u_password;
	}

	public Integer getU_identif() {
		return u_identif;
	}

	public void setU_identif(Integer u_identif) {
		this.u_identif = u_identif;
	}

	public Integer getU_active() {
		return u_active;
	}

	public void setU_active(Integer u_active) {
		this.u_active = u_active;
	}
}

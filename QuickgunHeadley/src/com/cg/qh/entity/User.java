package com.cg.qh.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "abc_users")
public class User {
	@Id
	private String username;
	private String password;
	private String teamName;
	private String mobileNumber;

	public User() {
		super();
	}

	public User(String username, String password, String teamName,
			String mobileNumber) {
		super();
		this.username = username;
		this.password = password;
		this.teamName = teamName;
		this.mobileNumber = mobileNumber;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

}

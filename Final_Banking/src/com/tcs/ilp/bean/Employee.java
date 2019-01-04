package com.tcs.ilp.bean;

public class Employee {
	
	private String userId;
	private String password;
	private String lastLogin;
	private String userType;
	
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Employee(String userId, String password, String lastLogin, String userType) {
		super();
		this.userId = userId;
		this.password = password;
		this.lastLogin = lastLogin;
		this.userType = userType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	
	

}

package com.tcs.ilp.bean;

public class Account {
	private int customerID;
	private int accountId;
	private String accountType ;
	private double balance;
	private String createDate;
	private String lastTransDate ;
	private int duration;
	private String status;
	
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Account(int customerID, int accountId, String accountType,
			double balance, String createDate, String lastTransDate,
			int duration, String status) {
		super();
		this.customerID = customerID;
		this.accountId = accountId;
		this.accountType = accountType;
		this.balance = balance;
		this.createDate = createDate;
		this.lastTransDate = lastTransDate;
		this.duration = duration;
		this.status = status;
	}


	public int getCustomerID() {
		return customerID;
	}

	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}


	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}


	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getLastTransDate() {
		return lastTransDate;
	}

	public void setLastTransDate(String lastTransDate) {
		this.lastTransDate = lastTransDate;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	


 

}

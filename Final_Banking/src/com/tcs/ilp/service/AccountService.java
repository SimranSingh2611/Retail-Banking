package com.tcs.ilp.service;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.tcs.ilp.bean.Account;
//import com.tcs.ilp.dao.AccountDao;
import com.tcs.ilp.dao.AccountDao;

public class AccountService {

	AccountDao dao = new AccountDao();

	public String createAccount(Account ac) {
		return dao.createAccount(ac);
	}

	public String deleteAccount(int account_id, String accountType) {
		System.out.println("Inside Service");
		return dao.deleteAccount(account_id, accountType);
	}

	public ResultSet accountStatus() {
		return dao.accountStatus();

	}

	public ArrayList<String> fetchDetails(String c_id) {
		ArrayList<String> acc = new AccountDao().fetchDetails(c_id);
		return acc;
	}

	public Account accountDetails(String a_id) {
		Account acc = new AccountDao().accountDetails(a_id);
		return acc;
	}

	public ArrayList<String> fetchDetailsBySSNID(String s_no) {
		// TODO Auto-generated method stub
		ArrayList<String> acc = new AccountDao().fetchDetailsBySSNID(s_no);
		return acc;
	}

	public int deposit(Account a, double amt) {
		int res = new AccountDao().deposit(a, amt);
		return res;
	}

	public int withdraw(Account a, double amt) {
		int res = new AccountDao().withdraw(a, amt);
		return res;
	}

	public ResultSet checkAccountId(int account_id) {
		return dao.checkAccountId(account_id);
	}

	public ResultSet getStatementByTransactions(int account_id,
			int transactions, String date1, String date2) {
		return dao.getStatementByTransactions(account_id, transactions, date1,
				date2);
	}
	public ResultSet getAccountCredentials(int target_acc_no) {
		
		return dao.getAccountCredentials(target_acc_no);
	}

	public ResultSet getAccountDetails(int target_acc_no) {
		return dao.getAccountDetails(target_acc_no);
		
	}

	public int getBalance(int target_acc_no) {

		return (dao.getBalance(target_acc_no));
		
	}

	public int debitBalance(int money, int current_acc_no) {
	return 	dao.debitBalance(money,current_acc_no);
		
	}

	public int creditBalance(int money, int target_acc_no) {
	return 	dao.creditBalance(money,target_acc_no);
		
	}

	public void updateTransaction(int current_acc_no, int target_acc_no,
			int money) {
		dao.updateTransaction(current_acc_no,target_acc_no,money);
		
	}


}

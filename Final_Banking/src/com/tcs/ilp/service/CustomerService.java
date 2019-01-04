package com.tcs.ilp.service;

import com.tcs.ilp.bean.Customer;
import com.tcs.ilp.dao.CustomerDao;
import java.sql.*;
import java.util.ArrayList;


public class CustomerService {

	CustomerDao dao = new CustomerDao();

	public String createCustomer(Customer customer) {
		return dao.createCustomer(customer);
	}
	
	public Customer fetchDetails(String ssnid, String customerid) {
		return dao.fetchDetails(ssnid, customerid);
	}

	public String deleteCustomer(String ssnid, String customerid) {
		return dao.deleteCustomer(ssnid, customerid);
	}
	
	public int updateCustomer(Customer cust) {
		return dao.updateCustomer(cust);
	}

	public ResultSet getCustomerCredential(Customer cust) {
		return dao.getCustomerCredential(cust);
	}
	
	public ResultSet customerStatus(){
		return dao.customerStatus();
	}
	
	public ResultSet customerStatus(int custID){
		return dao.customerStatus(custID);
	}
	
	public ResultSet viewProfile(int customerId){
		return dao.viewProfile(customerId);
	}

	public ArrayList<String> getState()
	{
		ArrayList<String> stateList= new CustomerDao().getState();
		return stateList;
	}
	
	public ArrayList<String> getCity(String state)
	{
		ArrayList<String> cityList=new CustomerDao().getCity(state);
		return cityList;
	}

}

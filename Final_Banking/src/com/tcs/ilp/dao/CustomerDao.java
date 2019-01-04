package com.tcs.ilp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.tcs.ilp.bean.Customer;
import com.tcs.ilp.util.DatabaseUtil;

public class CustomerDao {

	Connection con = null;
	PreparedStatement ps = null;
	Statement st = null;
	ResultSet rs = null;
	ResultSet rs1 = null;
	String sql = null;
	String sql1 = null;

	public String createCustomer(Customer customer) {
		int count = 0;

		try {
			con = DatabaseUtil.getConnection();
			if (con != null) {

				sql = "SELECT SSN_ID,Customer_id  FROM CUSTOMERDETAILS_G6 WHERE SSN_ID=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, customer.getSsnId());
				rs = ps.executeQuery();

				if (rs.next()) {

					sql = "UPDATE CUSTOMERSTATUS_G6 SET STATUS=?, MESSAGE=?, LASTUPDATED=(SELECT CURRENT_DATE FROM DUAL) WHERE CUSTOMER_ID=? AND STATUS=?";
					ps = con.prepareStatement(sql);
					ps.setString(1, "Active");
					ps.setString(2, "Account activated successfully");
					ps.setInt(3, rs.getInt(2));
					ps.setString(4, "Deactive");
					count = ps.executeUpdate();

					if (count == 1) {
						return "Customer activated successfully";
					} else {
						return "Customer is already active";
					}
				} else {

					sql = "INSERT INTO CUSTOMERDETAILS_G6(SSN_ID,CUSTOMER_ID,NAME,AGE,ADDRESSLINE1,ADDRESSLINE2,STATE,CITY) VALUES(?,CUSTOMERID_SEQ_G6.nextval,?,?,?,?,?,?)";
					ps = con.prepareStatement(sql);
					ps.setInt(1, customer.getSsnId());
					ps.setString(2, customer.getName());
					ps.setInt(3, customer.getAge());
					ps.setString(4, customer.getAddress1());
					ps.setString(5, customer.getAddress2());
					ps.setString(6, customer.getState());
					ps.setString(7, customer.getCity());
					count = ps.executeUpdate();

					return "Customer successfully created";
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		} finally {

			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
		}

		return "Failed to create customer";
	}

	public Customer fetchDetails(String ssnid, String customerid) {
		Customer cust = new Customer();

		try {
			con = DatabaseUtil.getConnection();

			if (con != null) {
				String sql = "select * from CUSTOMERDETAILS_G6 where ";
				if (!ssnid.equals("") && !customerid.equals(""))
					sql += "SSN_ID = " + ssnid + " or customer_id ="
							+ customerid;
				else if (!ssnid.equals(""))
					sql += "SSN_ID = " + ssnid;
				// System.out.println(sql);
				else if (!customerid.equals(""))
					sql += "customer_id =" + customerid;
				System.out.println(sql);
				st = con.createStatement();
				rs = st.executeQuery(sql);
				System.out.println(sql);
				if (rs.next()) {
					cust.setCustomerId(rs.getInt(3));
					cust.setSsnId(rs.getInt(1));
					cust.setName(rs.getString(2));
					cust.setAge(rs.getInt(4));
					cust.setAddress1(rs.getString(5) + " " + rs.getString(6));
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				st.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// DatabaseUtil.closeStatement(st);
			DatabaseUtil.closeConnection(con);
		}
		return cust;
	}

	public int updateCustomer(Customer cust) {
		int count = 0;
		try {
			con = DatabaseUtil.getConnection();
			sql = "update CUSTOMERDetails_G6 set name=?,age=?,addressline1=?,addressline2=?,state=?,city=?  where customer_id=?";
			ps = con.prepareStatement(sql);

			ps.setString(1, cust.getName());

			ps.setInt(2, cust.getAge());
			ps.setString(3, cust.getAddress1());
			ps.setString(4, cust.getAddress2());
			ps.setString(5, cust.getState());
			ps.setString(6, cust.getCity());
			/*
			 * ps.setInt(7, custbean.getMobile()); ps.setString(8,
			 * custbean.getEmail());
			 */
			ps.setInt(7, cust.getCustomerId());
			count = ps.executeUpdate();
			System.out.println("hello in update method" + count);
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;

	}

	// to check the customer while updating
	public ResultSet getCustomerCredential(Customer cust) {
		// TODO Auto-generated method stub
		try {
			con = DatabaseUtil.getConnection();
			sql = "select * from CUSTOMERDetails_G6 where customer_id=?";
			ps = con.prepareStatement(sql);

			ps.setInt(1, cust.getCustomerId());
			rs = ps.executeQuery();

			if (rs.next()) {
				System.out.println("in dao class checking credentials"
						+ rs.getInt(3));
			}
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public String deleteCustomer(String ssnid, String customerid) {
		int res = 0;
		try {
			con = DatabaseUtil.getConnection();

			if (con != null) {

				sql = "select status from CUSTOMERSTATUS_G6 where CUSTOMER_ID=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, customerid);
				rs = ps.executeQuery();

				while (rs.next()) {
					if (rs.getString(1).equalsIgnoreCase("Active")) {
						sql = "update CUSTOMERSTATUS_G6 set status='Deactive' where CUSTOMER_ID = "
								+ customerid;
						System.out.println(sql);
						st = con.createStatement();
						res = st.executeUpdate(sql);

						sql1 = "update accountstatus_g6 set status='Deactive' where customer_id= "
								+ customerid;
						st = con.createStatement();
						res = st.executeUpdate(sql);
						if (res == 1) {
							return "Deactivated succesfully";
						} else {
							return "Deactivated unsuccesfully";
						}

					} else {
						return "Customer is already deactivated";
					}

				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {

			DatabaseUtil.closeConnection(con);
		}
		return null;
	}

	public ResultSet customerStatus() {

		try {
			con = DatabaseUtil.getConnection();
			if (con != null) {
				
					sql = "select CUSTOMERDETAILS_G6.SSN_ID, CUSTOMERDETAILS_G6.Customer_ID, CUSTOMERSTATUS_G6.Status, "
							+ "CUSTOMERSTATUS_G6.Message, CUSTOMERSTATUS_G6.LastUpdated from CUSTOMERDETAILS_G6, "
							+ "CUSTOMERSTATUS_G6 where CUSTOMERDETAILS_G6.CUSTOMER_ID=CUSTOMERSTATUS_G6.CUSTOMER_ID "
							+ "ORDER BY CUSTOMERSTATUS_G6.CUSTOMER_ID";
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();
					
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return rs;

	}
	
	public ResultSet customerStatus(int custID) {

		try {
			con = DatabaseUtil.getConnection();
			if (con != null) {
					
					
					sql="select CUSTOMERDETAILS_G6.SSN_ID, CUSTOMERDETAILS_G6.Customer_ID, CUSTOMERSTATUS_G6.Status, "
							+ "CUSTOMERSTATUS_G6.Message, CUSTOMERSTATUS_G6.LastUpdated from CUSTOMERDETAILS_G6, "
							+ "CUSTOMERSTATUS_G6 where CUSTOMERDETAILS_G6.CUSTOMER_ID=CUSTOMERSTATUS_G6.CUSTOMER_ID AND" 
							+ " CUSTOMERSTATUS_G6.CUSTOMER_ID=?"
							+ "ORDER BY CUSTOMERSTATUS_G6.CUSTOMER_ID  ";
					
					ps = con.prepareStatement(sql);
					ps.setInt(1, custID);
					rs1 = ps.executeQuery();
					

			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return rs1;

	}

	public ResultSet viewProfile(int customerId) {
		String sql;
		try {
			con = DatabaseUtil.getConnection();
			if (con != null) {
				sql = "SELECT SSN_ID,NAME,cd.CUSTOMER_ID,AGE,ADDRESSLINE1,ADDRESSLINE2,STATE,CITY,cs.STATUS,acs.account_id, acs.ACCOUNTTYPE , acs.status FROMCUSTOMERDETAILS_G6 cd,CUSTOMERSTATUS_G6 cs,ACCOUNTSTATUS_G6 acs WHERE cd.Customer_id=cs.Customer_id and cs.customer_id=acs.Customer_id and cd.Customer_id=acs.Customer_id and cd.Customer_id=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, customerId);
				rs = ps.executeQuery();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;

	}
	public ArrayList<String> getState()
	{
		ArrayList<String> stateList=new ArrayList<>();
		
		try {
			con = DatabaseUtil.getConnection();
			sql = "SELECT distinct city_state from cities_g6 order by city_state";
			st=con.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				stateList.add(rs.getString(1));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return stateList;
	}
	
	public ArrayList<String> getCity(String state)
	{
		ArrayList<String> cityList=new ArrayList<>();
		
		try {
			con = DatabaseUtil.getConnection();
			sql = String.format("SELECT city_name from cities_g6 where city_state='%s' order by city_name",state);
			System.err.println(sql);
			st=con.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				cityList.add(rs.getString(1));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cityList;
	}

}

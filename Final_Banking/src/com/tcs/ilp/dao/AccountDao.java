package com.tcs.ilp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.tcs.ilp.bean.Account;
import com.tcs.ilp.util.DatabaseUtil;

public class AccountDao {

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	ResultSet rs1 = null;
	Statement st = null;
	String sql1 = null;
	String sql = null;

	public String createAccount(Account acc) {

		int c;
		String sql = null;
		try {

			con = DatabaseUtil.getConnection();
			if (con != null) {
				sql = "select customer_id from CustomerDetails_g6 where Customer_Id=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, acc.getCustomerID());
				rs = ps.executeQuery();

				if (rs.next()) {

					sql = "select status from AccountStatus_g6 where Customer_Id=? and accounttype=?";
					ps = con.prepareStatement(sql);
					ps.setInt(1, acc.getCustomerID());
					ps.setString(2, acc.getAccountType());
					rs1 = ps.executeQuery();

					if (rs1.next()) {
						if (rs1.getString(1).equalsIgnoreCase("Deactive")) {

							sql = "update AccountStatus_g6 set status=? where Customer_Id=? and accounttype=?";
							ps = con.prepareStatement(sql);
							ps.setString(1, "Active");
							ps.setInt(2, acc.getCustomerID());
							ps.setString(3, acc.getAccountType());
							c = ps.executeUpdate();
							return "Successfully updated from deactive to active";

						}
						if (rs1.getString(1).equalsIgnoreCase("Active")) {
							return "Already exist an active account of same type";
						}
					}

					else {
						sql = "insert into AccountDetails_g6(CUSTOMER_ID,ACCOUNT_ID,ACCOUNTTYPE,"
								+ "BALANCE,CR_DATA,CR_LASTTRANSDATE,DURATION) "
								+ "values(?,accIdseq.nextval ,?,?,(select current_date from dual),?,?)";

						ps = con.prepareStatement(sql);
						ps.setInt(1, acc.getCustomerID());
						ps.setString(2, acc.getAccountType());
						ps.setDouble(3, acc.getBalance());
						ps.setString(4, null);
						ps.setInt(5, 2);

						c = ps.executeUpdate();

						if (c == 1) {
							String status = "Active";
							String msg = "New Account Created Successfully";

							sql = "select account_id from AccountDetails_g6 where CUSTOMER_ID=? and ACCOUNTTYPE=?";
							ps = con.prepareStatement(sql);
							ps.setInt(1, acc.getCustomerID());
							ps.setString(2, acc.getAccountType());
							rs = ps.executeQuery();
							rs.next();

							sql = "insert into AccountStatus_g6(Customer_id,Account_id,Accounttype,status,message,lastupdated)"
									+ " values(?,?,?,?,?,(select current_date from dual))";
							ps = con.prepareStatement(sql);
							ps.setInt(1, acc.getCustomerID());
							ps.setInt(2, rs.getInt(1));
							ps.setString(3, acc.getAccountType());
							ps.setString(4, status);
							ps.setString(5, msg);

							c = ps.executeUpdate();
							return "Account is created successfully";

						} else
							return "Fail to create";
					}
				}

				else {
					return "Customer Id is not valid";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DatabaseUtil.closeConnection(con);
			DatabaseUtil.closeStatement(ps);

		}

		return null;
	}

	public String deleteAccount(int account_id, String accounttype) {

		System.out.println("Inside Delete");
		String sql = null;
		int count = 0;

		try {

			con = DatabaseUtil.getConnection();
			if (con != null) {
				sql = "Select Account_ID,status from AccountStatus_g6 where Account_ID=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, account_id);
				rs = ps.executeQuery();

				if (rs.next()) {
					System.out.println("Inside Delete");
					if (rs.getString(2).equalsIgnoreCase("Deactive")) {
						return "Account is already deactived";
					}

					else {
						System.out.println("Inside Delete");
						sql1 = "update AccountStatus_g6 set Status ='Deactive'"
								+ " , message='Deactivated Successfully'"
								+ " ,lastupdated=(select current_date from dual)"
								+ " where Account_ID =? and AccountType =?";
						ps = con.prepareStatement(sql1);

						ps.setInt(1, account_id);
						ps.setString(2, accounttype);

						count = ps.executeUpdate();
						System.out.println(count);
						if (count == 1) {
							return "Account Successfully Deactived";
						}

						else {
							return "Fail";
						}
					}

				} else {
					return "Inavlid Account ID";
				}

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			try {
				con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		}
		return null;

	}

	public ResultSet accountStatus() {

		String sql;
		try {
			con = DatabaseUtil.getConnection();
			if (con != null) {
				sql = "select * FROM ACCOUNTSTATUS_G6 ORDER BY CUSTOMER_ID";
				ps = con.prepareStatement(sql);

				rs = ps.executeQuery();

			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return rs;

	}

	public Account accountDetails(String a_id) {
		Account account = new Account();

		try {
			con = DatabaseUtil.getConnection();

			if (con != null) {
				String sql = "select * from AccountDetails_g6 where account_id="
						+ a_id;
				System.out.println(sql);
				st = con.createStatement();
				rs = st.executeQuery(sql);
				while (rs.next()) {

					account.setCustomerID(rs.getInt(1));
					account.setAccountId(rs.getInt(2));
					account.setAccountType(rs.getString(3));
					account.setBalance(rs.getDouble(4));
					account.setCreateDate(rs.getString(5));
					account.setLastTransDate(rs.getString(6));
					account.setDuration(rs.getInt(7));

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
		return account;
	}

	public ArrayList<String> fetchDetails(String c_num) {
		ArrayList<String> acc = new ArrayList<>();

		try {
			con = DatabaseUtil.getConnection();

			if (con != null) {
				String sql = "select Account_id from AccountDetails_g6 where customer_id="
						+ c_num;
				System.out.println(sql);
				st = con.createStatement();
				rs = st.executeQuery(sql);
				while (rs.next())
					acc.add(String.valueOf(rs.getInt(1)));

			}
		}

		catch (SQLException e) {
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
		return acc;
	}

	public ArrayList<String> fetchDetailsBySSNID(String s_num) {
		ArrayList<String> acc = new ArrayList<>();

		try {
			con = DatabaseUtil.getConnection();

			if (con != null) {
				String sql = "select Account_id from AccountDetails_g6 a, CUSTOMERDETAILS_G6 b where a.customer_id=b.customer_id and b.ssn_id="
						+ s_num;
				System.out.println(sql);
				st = con.createStatement();
				rs = st.executeQuery(sql);
				while (rs.next())
					acc.add(String.valueOf(rs.getInt(1)));

			}
		}

		catch (SQLException e) {
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
		return acc;
	}

	public int deposit(Account a, double amt) {
		int res = 0;
		try {
			con = DatabaseUtil.getConnection();

			if (con != null) {
				String sql = "update ACCOUNTDETAILS_G6 set balance=((select balance from ACCOUNTDETAILS_G6 where account_id="+a.getAccountId()+")+"+amt+") where account_id="
						+ a.getAccountId();
				System.out.println(sql);
				ps=con.prepareStatement(sql);
				res = ps.executeUpdate(sql);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// DatabaseUtil.closeStatement(st);
			DatabaseUtil.closeConnection(con);
		}
		return res;
	}

	public int withdraw(Account a, double amt) {
		int res = 0;
		try {
			con = DatabaseUtil.getConnection();

			if (con != null) {
				
				sql="select balance from ACCOUNTDETAILS_G6 where account_id="+a.getAccountId();
				ps=con.prepareStatement(sql);
				rs = ps.executeQuery();
				
				while(rs.next()){
					 
					if(rs.getDouble(1)!=0 && amt<=rs.getDouble(1)){
						sql = "update ACCOUNTDETAILS_G6 set balance=((select balance from ACCOUNTDETAILS_G6 where account_id="+a.getAccountId()+")-"+amt+") where account_id="
								+ a.getAccountId();
						System.out.println(sql);
						ps=con.prepareStatement(sql);
						res = ps.executeUpdate(sql);
						return res;
					}
					else{
						
						return res;
						
					}
					
					
				}
				
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// DatabaseUtil.closeStatement(st);
			DatabaseUtil.closeConnection(con);
		}
		return res;
	}
	

	public ResultSet checkAccountId(int account_id) {
		
		try
		{
			con = DatabaseUtil.getConnection();
			ps=con.prepareStatement("select account_id from AccountDetails_g6 where Account_ID=?");
			ps.setInt (1, account_id);
			rs=ps.executeQuery();
			
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet getStatementByTransactions(int account_id, int transactions, String date1, String date2) {
		
		
		
		try
		{
			con = DatabaseUtil.getConnection();
		
			
			if(transactions!=0 || (date1!=null && date2!=null))
			{
				if(transactions!=0){
			ps=con.prepareStatement("select * from TransactionDetails_g6 where ROWNUM <=?  and Source_AcctID = ? order by Trans_Date desc");
			ps.setInt(1, transactions);
			ps.setInt(2,account_id );
			rs = ps.executeQuery();

			}
			else{
				date1=date1.concat("T00.00.00");
				System.out.println(date1);
				date2=date2.concat("T00.00.00");
				System.out.println(date2);
				
			ps=con.prepareStatement("select * from TransactionDetails_g6 where " +
					"Trans_Date BETWEEN TO_DATE(?,'YYYY-MM-DD\"T\"HH24:MI:SS') and TO_DATE(?,'YYYY-MM-DD\"T\"HH24:MI:SS') order by Trans_Date desc");
			ps.setString(1, date1);
			ps.setString(2, date2);
			rs=ps.executeQuery();
			
			}
			}	
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		
			return rs;
		
	}

	public ResultSet getAccountCredentials(int acc) {
		// TODO Auto-generated method stub
		try {
			// System.out.println("customer id ser = "+acc.getAccountId());
			con = DatabaseUtil.getConnection();
			ps = con.prepareStatement("select * from AccountDetails_g6 where Account_ID =?");

			ps.setInt(1, acc);
			rs = ps.executeQuery();

			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

	public ResultSet getAccountDetails(int acc) {
		try {
			con = DatabaseUtil.getConnection();
			ps = con.prepareStatement("select c.name,c.customer_id from CUSTOMERDETAILS_G6 c, ACCOUNTDETAILS_G6 a where c.customer_id=(select customer_id from ACCOUNTDETAILS_G6 where account_id='"
					+ acc + "') group by c.name,c.customer_id");

			rs = ps.executeQuery();
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

	public int getBalance(int target_acc_no) {
		try {
			con = DatabaseUtil.getConnection();
			ps = con.prepareStatement("select sum(balance) from ACCOUNTDETAILS_G6 where account_id=?");
			ps.setInt(1, target_acc_no);
			rs = ps.executeQuery();
			rs.next();
			
			return rs.getInt(1);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}

	public int debitBalance(int money, int current_acc_no) {
		int count = 0;
		try {

			con = DatabaseUtil.getConnection();
			ps = con.prepareStatement("update ACCOUNTDETAILS_G6 set balance =balance-? , cr_lasttransdate=(select current_date from dual)  where account_id=?");
			ps.setInt(1, money);
			ps.setInt(2, current_acc_no);
			count = ps.executeUpdate();
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return count;
		}
	}

	public int creditBalance(int money, int target_acc_no) {
		int count = 0;
		try {

			con = DatabaseUtil.getConnection();
			ps = con.prepareStatement("update ACCOUNTDETAILS_G6 set balance =balance+? , cr_lasttransdate=(select current_date from dual) where account_id=?");
			ps.setInt(1, money);
			ps.setInt(2, target_acc_no);
			count = ps.executeUpdate();
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return count;
		}

	}

	public void updateTransaction(int current_acc_no, int target_acc_no,
			int money) {
		String current_acc_type = null;
		String target_acc_type = null;
		
		try {
			PreparedStatement ps1 = con
					.prepareStatement("select * from ACCOUNTDETAILS_G6 where account_id=? ");
			ps1.setInt(1, current_acc_no);
			rs = ps1.executeQuery();
			while (rs.next()) {
				
				current_acc_type = rs.getString(3);
			}

			// target account type

			ps1 = con.prepareStatement("select * from ACCOUNTDETAILS_G6 where account_id=? ");
			ps1.setInt(1, target_acc_no);
			rs = ps1.executeQuery();
			while (rs.next()) {
				
				target_acc_type = rs.getString(3);
			}

			con = DatabaseUtil.getConnection();
			ps = con.prepareStatement("insert into TRANSACTIONDETAILS_G6 values(?,(select current_date from dual),?,? ,?,?,'Transaction Details',seq_trans_detail.nextval)");

			ps.setInt(1, money);
			ps.setInt(2, current_acc_no);
			ps.setInt(3, target_acc_no);
			ps.setString(4, current_acc_type);
			ps.setString(5, target_acc_type);
			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
	}

	/*public ResultSet getStatementByTransactions(String date1, String date2) {
		return null;
	}
	
	*/


}

package com.tcs.ilp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.tcs.ilp.bean.Employee;
import com.tcs.ilp.util.DatabaseUtil;

public class EmployeeDao {

	Connection con=null;
	Statement st=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	ResultSet rs1=null;

	
	public ResultSet verifyUser(Employee emp){
		
		
		try{
			con=DatabaseUtil.getConnection();
			if(con!=null){
				String sql="SELECT LOGINID,USERTYPE FROM USERSTORE_G6 WHERE LOGINID=? AND PASSWORD=? AND USERTYPE=?";
				ps=con.prepareStatement(sql);
				ps.setString(1, emp.getUserId());
				ps.setString(2, emp.getPassword());
				ps.setString(3, emp.getUserType());
				rs=ps.executeQuery();
				
				if(rs!=null){		
					String sql1="UPDATE USERSTORE_G6 SET LOGIN_TIME=(select current_date from dual) WHERE LOGINID=?";
					ps=con.prepareStatement(sql1,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
					ps.setString(1, emp.getUserId());
					ps.executeUpdate();
					return rs;
				}
				
			} 
			
		}
		catch (SQLException e) {
		// TODO Auto-generated catch block
			System.out.println(e);
		}finally{
			
		//DatabaseUtil.closeConnection(con);
		//DatabaseUtil.closeStatement(ps);
		
		}
	   
	return null;
		
	}

}

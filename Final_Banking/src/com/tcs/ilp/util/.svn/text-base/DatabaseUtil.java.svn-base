package com.tcs.ilp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DatabaseUtil {
	
	
	private static final String DRIVERNAME="oracle.jdbc.driver.OracleDriver";
	private static final String URL="jdbc:oracle:thin:@INGNRGPILPHP01:1521:ORCLILP";
	private static final String USERNAME="aja37core";
	private static final String PASSWORD="aja37core";
	
	
	
	public static Connection getConnection(){
		
		Connection con=null;
		try {
			Class.forName(DRIVERNAME);
			con=DriverManager.getConnection(URL, USERNAME, PASSWORD);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		return con;
		
		
	
	}
	

	
	public static void closeStatement(PreparedStatement ps){
		
		if(ps!=null){
			
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e);
			}
		}
		
		
	}
	
	
	
	public static void closeConnection(Connection  con){
		
		if(con!=null){
			
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e);
			}
		}
		
		
	}
	
	

}

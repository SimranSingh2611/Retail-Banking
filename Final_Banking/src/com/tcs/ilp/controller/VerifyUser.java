package com.tcs.ilp.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.ilp.bean.Employee;
import com.tcs.ilp.service.EmployeeService;

/**
 * Servlet implementation class VerifyUser
 */
@WebServlet("/VerifyUser")
public class VerifyUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public VerifyUser() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Employee emp = new Employee();
		EmployeeService service = new EmployeeService();
		ResultSet rs = null;

		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String userType = request.getParameter("userType");

		emp.setUserId(userId);
		emp.setPassword(password);
		emp.setUserType(userType);

		rs = service.verifyUser(emp);
		
		
	
			try {
				HttpSession session = request.getSession(true);
				while (rs.next()) {
				
					session.setAttribute("userid", rs.getString(1));
					session.setAttribute("usertype", rs.getString(2));
					session.setAttribute("status","success");
		
					response.sendRedirect(request.getContextPath()+"/JSP/Home.jsp");
				}
				
				session.setAttribute("status", "fail");
				response.sendRedirect(request.getContextPath()+"/JSP/Login.jsp");


			} catch (SQLException e) {
				e.printStackTrace();
			}
			catch(Exception e){
				e.printStackTrace();

		}

	}

}

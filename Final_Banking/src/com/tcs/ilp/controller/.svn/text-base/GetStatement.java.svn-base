package com.tcs.ilp.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.ilp.service.AccountService;

/**
 * Servlet implementation class GetStatement
 */
@WebServlet("/GetStatement")
public class GetStatement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetStatement() {
		super();
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
		int account_id = Integer.parseInt(request.getParameter("account_id"));
		int transactions = Integer.parseInt(request
				.getParameter("transactions"));
		
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");

		
		System.out.println(account_id);
		System.out.println(transactions);
		System.out.println(date1);
		System.out.println(date2);
		ResultSet rs = null;

		AccountService service = new AccountService();
		rs = service.checkAccountId(account_id);

		

		try {
			if (rs.next()) {
				System.out.println(rs.getInt(1));
				ResultSet rs1 = service.getStatementByTransactions(account_id,
						transactions, date1, date2);
				request.setAttribute("trans", rs1);
		
				request.getRequestDispatcher("/JSP/ViewStatement.jsp")
						.forward(request, response);
			}
			else{
				System.out.println("Sorry Invalid account ID");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

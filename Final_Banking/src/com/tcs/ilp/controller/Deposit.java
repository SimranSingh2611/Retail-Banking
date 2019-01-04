package com.tcs.ilp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.ilp.bean.Account;
import com.tcs.ilp.service.AccountService;

/**
 * Servlet implementation class Deposit
 */
@WebServlet("/Deposit")
public class Deposit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Deposit() {
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
		
		int res=0;
		
		if(request.getParameter("action")!=null && (request.getParameter("action").equalsIgnoreCase("Deposit"))){
			System.out.println("s");
			int accountID=Integer.parseInt(request.getParameter("accID"));
			double amount=Double.parseDouble(request.getParameter("amount"));
			Account a=new Account();
			a.setAccountId(accountID);
			res = new AccountService().deposit(a, amount);
			
			
		}
		else{
			System.out.println("sdss");
			Account a = (Account) request.getSession().getAttribute("aDetails");
			double amt = Double.parseDouble(request.getParameter("depositamount"));

			res = new AccountService().deposit(a, amt);
			
			
		}
		
		if (res > 0)
		{
			request.setAttribute("status", "Deposited Successfully");
		    request.getRequestDispatcher("/JSP/AccountOperations2.jsp").forward(request, response);
		}else{
			request.setAttribute("status", "Failed to Deposit");
		    request.getRequestDispatcher("/JSP/AccountOperations2.jsp").forward(request, response);
		}
		
		

	}

}

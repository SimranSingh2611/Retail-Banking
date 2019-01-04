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
 * Servlet implementation class CreateAccount
 */
@WebServlet("/CreateAccount")
public class CreateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ID = Integer.parseInt(request.getParameter("customerId"));
		String accountType = request.getParameter("accountType");
		int depositAmount = Integer.parseInt(request.getParameter("depositAmount"));
		AccountService service=new AccountService();
		Account acc=new Account();
		acc.setCustomerID(ID);
		acc.setAccountType(accountType);
		acc.setBalance(depositAmount);

		String status=service.createAccount(acc);
		System.out.println(status);
		request.setAttribute("status", status);

		
		
		/*
		 * RequestDispatcher rd =
		 * request.getRequestDispatcher("/JSP/AddAccountSuccess.jsp");
		 * rd.forward(request, response);
		 */
	}

	

}

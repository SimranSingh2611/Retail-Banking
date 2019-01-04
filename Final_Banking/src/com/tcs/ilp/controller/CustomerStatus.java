package com.tcs.ilp.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.ilp.dao.CustomerDao;
import com.tcs.ilp.service.CustomerService;

/**
 * Servlet implementation class CustomerStatus
 */
@WebServlet("/CustomerStatus")
public class CustomerStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerStatus() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		CustomerService service = new CustomerService();
		ResultSet rs1 = null;
		ResultSet rs2 = null;

		rs1 = service.customerStatus();
		request.setAttribute("result_set1", rs1);

		if (request.getParameter("action") != null) {
			int customerId = Integer.parseInt(request.getParameter("action"));
			System.out.println(customerId);
			rs2 = service.customerStatus(customerId);
			request.setAttribute("CustomerID",customerId);
			request.setAttribute("result_set2", rs2);

		}
		request.getRequestDispatcher("/JSP/CustomerStatus.jsp").forward(
				request, response);

	}
}

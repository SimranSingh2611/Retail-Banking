package com.tcs.ilp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.ilp.bean.Customer;
import com.tcs.ilp.service.CustomerService;

/**
 * Servlet implementation class UpdateCustomer
 */
@WebServlet("/UpdateCustomer")
public class UpdateCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateCustomer() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		System.out.println("in do post first");
		

		if (request.getParameter("action").equalsIgnoreCase("first")) {
			int id = Integer.parseInt(request.getParameter("cust_id"));
			System.out.println("id = " + id);
			Customer cust = new Customer();
			cust.setCustomerId(id);
			CustomerService service = new CustomerService();
			ResultSet rst = service.getCustomerCredential(cust);
			try {
				if (rst != null) {
					System.out.println("SSID = " + rst.getInt(1));
					request.setAttribute("cust", rst);
					request.getRequestDispatcher("/JSP/UpdateCustomerSuccess.jsp").forward(
							request, response);
					// I HAVE CHANGE A CODE HERE

					/*
					 * request.getRequestDispatcher("/JSP/UpdateCustomer.jsp")
					 * .include(request, response);
					 */

				} else {
					out.println("<h3>Customer with this " + id
							+ " is not present in Database.Re-Enter ID </h3>");
					request.getRequestDispatcher("/JSP/UpdateCustomer.jsp").forward(
							request, response);

					// I HAVE CHANGE A CODE HERE

					/*
					 * request.getRequestDispatcher("/JSP/UpdateCredentials.jsp")
					 * .forward(request, response);
					 */
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				out.println("<h3>Customer with this " + id
						+ " is not present in Database.Re-Enter ID </h3>");
				request.getRequestDispatcher("/JSP/UpdateCustomer.jsp").forward(
						request, response);
				/*
				 * request.getRequestDispatcher("/JSP/UpdateCredentials.jsp").
				 * forward( request, response);
				 */
			}

		} else {
			int id = Integer.parseInt(request.getParameter("id"));

			System.out.println("in final update class"
					+ request.getAttribute("id"));

			String cust_address_line1 = request
					.getParameter("cust_address_line1");
			int cust_age = Integer.parseInt(request.getParameter("cust_age"));
			String cust_name = request.getParameter("cust_name");
			String cust_address_line2 = request
					.getParameter("cust_address_line2");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			Customer cust = new Customer();
			cust.setState(state);

			cust.setAddress1(cust_address_line1);
			cust.setAddress2(cust_address_line2);
			cust.setCity(city);

			cust.setAge(cust_age);

			cust.setCustomerId(id);
			cust.setName(cust_name);

			CustomerService service = new CustomerService();

			int count = service.updateCustomer(cust);
			if (count > 0) {

				out.println("<h3>Customer with this " + id
						+ " has been updated successfully</h3>");
			//	request.getRequestDispatcher("#").include(request, response);
			} else {
				out.println("<h3>Customer with this " + id
						+ " has been failed to update re enter credentials</h3>");
				/*request.getRequestDispatcher(request.getContextPath()+"/JSP/UpdateCustomer.jsp").forward(
						request, response);*/

			}
		}

	}

}

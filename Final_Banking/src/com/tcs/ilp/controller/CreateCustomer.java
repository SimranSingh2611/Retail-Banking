package com.tcs.ilp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.ilp.bean.Customer;
import com.tcs.ilp.service.CustomerService;

/**
 * Servlet implementation class CreateCustomer
 */
@WebServlet("/CreateCustomer")
public class CreateCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateCustomer() {
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
		
		Customer customer = new Customer();
		CustomerService service=new CustomerService();
		System.out.println("sds");
		int customerSSNId = Integer.parseInt(request.getParameter("customerSSNId"));
		String customerName = request.getParameter("customerName");
		int age = Integer.parseInt(request.getParameter("age"));
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String state = request.getParameter("state");
		String city = request.getParameter("city");

		
		customer.setSsnId(customerSSNId);
		customer.setName(customerName);
		customer.setAge(age);
		customer.setAddress1(address1);
		customer.setAddress2(address2);
		customer.setState(state);
		customer.setCity(city);
		
		String status = service.createCustomer(customer);
		System.out.println(status);
		
		/*if(count<0){
			
			System.out.println("already");
		}
		
		if (count==1) {
			request.setAttribute("status","Customer creation initiated successfully");
			System.out.println("Customer creation initiated successfully");
			
		} else {
			request.setAttribute("msg", "Customer creation cannot be initiated");
			System.out.println("Customer creation cannot be initiated");
			
		}*/
		
		/*request.getRequestDispatcher("CreateCustomer.jsp").include(
				request, response);
*/
	}

}

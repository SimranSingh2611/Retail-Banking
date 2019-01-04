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
 * Servlet implementation class PopulateServ
 */
@WebServlet("/PopulateServ")
public class PopulateServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PopulateServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CustomerService service= new CustomerService();
		
		String ssnid = request.getParameter("ssnid");
		String customerid =  request.getParameter("customerid");
		
		Customer cus =  service.fetchDetails(ssnid,customerid);
		request.getSession().setAttribute("CustDetails", cus);
		response.sendRedirect(request.getContextPath()+"/JSP/DeleteCustomer.jsp");
	}

}

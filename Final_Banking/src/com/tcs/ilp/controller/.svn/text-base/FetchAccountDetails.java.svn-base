package com.tcs.ilp.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.ilp.service.AccountService;

/**
 * Servlet implementation class FetchAccountDetails
 */
@WebServlet("/FetchAccountDetails")
public class FetchAccountDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchAccountDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String c_no = request.getParameter("c_no");

		ArrayList<String> aList = new AccountService().fetchDetails(c_no);
		/*System.out.println(c_no+"\n"+aList);
	
		String res = "";
		for(String s : aList)
			res += s+",";
		res = "["+res.substring(0,res.length()-1)+"]";*/
		
		response.getWriter().print(aList.toString());

	}

}

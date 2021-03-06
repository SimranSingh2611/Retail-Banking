package com.tcs.ilp.controller;

import java.io.IOException;
import java.util.ArrayList;
import org.json.JSONArray;

import com.tcs.ilp.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class City
 */
@WebServlet("/City")
public class City extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public City() {
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
		System.out.println("sd");
		ArrayList<String> cityList=new CustomerService().getCity(request.getParameter("state"));
		JSONArray array = new JSONArray();
		for(String s : cityList)
			array.put(s);
		System.out.println(array);
		response.getWriter().print(array);
	}


}

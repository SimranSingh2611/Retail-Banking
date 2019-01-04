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
import javax.servlet.http.HttpSession;

import com.tcs.ilp.bean.Account;
import com.tcs.ilp.service.AccountService;

/**
 * Servlet implementation class Transfer
 */
@WebServlet("/Transfer")
public class Transfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Transfer() {
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
		String errorMessage=null;
		
		if(request.getParameter("action").equalsIgnoreCase("first")){
			HttpSession session = request.getSession();
			ResultSet rst = null;
			//PrintWriter out = response.getWriter();
			int target_acc_no = Integer.parseInt(request
					.getParameter("target_acc_no"));
			System.out.println(request
					.getParameter("target_acc_no"));
			System.out.println(request.getParameter("current_acc_no"));
			int current_acc_no = Integer.parseInt(request
					.getParameter("current_acc_no"));
			System.out.println(current_acc_no);
			
		
			Account acc = new Account();
			acc.setAccountId(target_acc_no);
			
			AccountService service = new AccountService();
			/* int check_id=0; */
			try {
				ResultSet rs = service.getAccountCredentials(target_acc_no);
				
					rst = service.getAccountDetails(target_acc_no);
					//rst.next();
					System.out.println("sa");
					request.setAttribute("rs", rs);
					request.setAttribute("rst", rst);
					request.setAttribute("current_acc_no", current_acc_no);
					request.getRequestDispatcher("/JSP/TransferSecond.jsp").include(
							request, response);

				
				/*errorMessage="<h3>Target account ID does not exist.\n</h3> Enter a valid Account ID ";
				request.getSession().setAttribute("errorMessage", errorMessage);
				response.sendRedirect(request.getContextPath()+"/JSP/Transfer.jsp");*/
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
			//	out.println("requested account id does not exist");
				errorMessage="Target account ID does not exist.Enter a valid Account ID ";
				request.getSession().setAttribute("errorMessage", errorMessage);
				request.getRequestDispatcher("/JSP/Transfer.jsp").forward(request, response);
				e.printStackTrace();
			}
		

			
		}
		else if(request.getParameter("action").equalsIgnoreCase("second")){
			int balance=0;
			int c1=0,c2=0;
			System.out.println("1");
			if(request.getParameter("target_acc_no")==null || request.getParameter("current_acc_no")==null)
			{
				errorMessage="Account Ids can't be null.Enter a valid Account ID ";
				request.getSession().setAttribute("errorMessage", errorMessage);
				request.getRequestDispatcher(request.getContextPath()+"/JSP/Transfer.jsp").forward(request, response);
			}
			System.out.println(request
					.getParameter("current_acc_no"));
			
			int current_acc_no = Integer.parseInt(request
					.getParameter("current_acc_no"));
			
			System.out.println("sh"+current_acc_no);
			int target_acc_no = Integer.parseInt(request
					.getParameter("target_acc_no"));
			System.out.println("sh"+target_acc_no);
			
			int money = Integer.parseInt(request.getParameter("money"));
			System.out.println("sh"+money);
			PrintWriter out = response.getWriter();

	      
			AccountService service = new AccountService();
			balance=service.getBalance(current_acc_no);
			if(balance==-1)
			{
				errorMessage="transaction not possible";
				request.setAttribute("errorMessage", errorMessage);
				request.getRequestDispatcher("/JSP/Transfer.jsp").forward(request, response);
				
				
			}
			else if((balance-money)>=0)
			{
				
				c1=service.debitBalance(money,current_acc_no);
				c2=service.creditBalance(money,target_acc_no);
				if(c1==1 && c2==1){
					service.updateTransaction(current_acc_no,target_acc_no,money);
					errorMessage="Transaction occured successfully";
					request.setAttribute("errorMessage", errorMessage);
					request.getRequestDispatcher("/JSP/Transfer.jsp").forward(request, response);
					
				
				}
			}else if((balance-money)<0 )
			{
				errorMessage="Transaction not possible Requested user Does not meet the Balance Credentials";
				request.setAttribute("errorMessage", errorMessage);
				request.getRequestDispatcher("/JSP/Transfer.jsp").forward(request, response);
				
			}
			else{
				errorMessage="Transaction not possible";
				request.setAttribute("errorMessage", errorMessage);
				request.getRequestDispatcher("/JSP/Transfer.jsp").forward(request, response);
				
				
				
			}
		}


		}
	

}

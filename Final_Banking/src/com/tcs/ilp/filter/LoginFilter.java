package com.tcs.ilp.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/*")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession(false);

		String loginURI = request.getContextPath() + "/JSP/Login.jsp";

		boolean loggedIn = session != null
				&& session.getAttribute("userid") != null;
		boolean loginRequest = request.getRequestURI().equals(loginURI);
		boolean loginRequest2 = request.getRequestURI().equals(
				request.getContextPath() + "/VerifyUser");
		/*boolean loginRequest3 = request.getRequestURI().equals(
				request.getContextPath() + "/images/background.jpg");
		boolean loginRequest4 = request.getRequestURI().equals(
				request.getContextPath() + "/images/logo.png");*/

		if (loggedIn || loginRequest || loginRequest2) {
			chain.doFilter(request, response);
		} else {
			response.sendRedirect(loginURI);
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

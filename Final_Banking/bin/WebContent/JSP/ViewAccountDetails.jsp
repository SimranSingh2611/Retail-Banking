<%@page import="com.tcs.ilp.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Account Details</title>
<script type="text/javascript">
	function Deposit() {
		window.location = '/JSP/Deposit.jsp';
	}
	function Withdraw() {
		window.location = '/JSP/Withdraw.jsp';
	}
	function Transfer() {
		window.location = '/JSP/Transfer.jsp';
	}
</script>
</head>
<body>
	<table>
		<%
			Account a = (Account) request.getSession().getAttribute("aDetails");
			if (a.getAccountId() == 0) {
				out.print("<script>alert('does not exist');window.location = 'AccountDetails.jsp';</script>");

			} else {
				out.print("<tr><td>Account ID</td><td>" + a.getAccountId()
						+ "</td></tr>");
				out.print("<tr><td>Customer ID</td><td>" + a.getCustomerID()
						+ "</td></tr>");
				out.print("<tr><td>Account Type</td><td>" + (a.getAccountType()=="C"? "Current" : "Savings")
						+ "</td></tr>");
				out.print("<tr><td>Balance</td><td>" + a.getBalance()
						+ "</td></tr>");
				out.print("<tr><td>Create Date</td><td>" + a.getCreateDate()
						+ "</td></tr>");
				out.print("<tr><td>Last Updated</td><td>"
						+ a.getLastTransDate() + "</td></tr>");
				out.print("<tr><td>Duration</td><td>" + a.getDuration()
						+ "</td></tr>");

			}
		%>
		
		
	</table>
	<br>
	<br>
	<br>
	<input type="button" onclick="Deposit();" value="Deposit">
	<input type="button" onclick="Withdraw();" value="Withdraw">
	<input type="button" onclick="Transfer();" value="Transfer">
</body>
</html>
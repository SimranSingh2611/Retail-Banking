<%@page import="com.tcs.ilp.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deposit</title>

</head>
<body>
	<form action="../Deposit" method="post">
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
					out.print("<tr><td>Account Type</td><td>"
							+ (a.getAccountType() == "C" ? "Current" : "Savings")
							+ "</td></tr>");
					out.print("<tr><td>Balance</td><td>" + a.getBalance()
							+ "</td></tr>");

				}
			%>
			<tr>
				<td>Deposit Amount</td>
				<td><input type="number" name="depositamount" ></td>
			</tr>
			<tr>
				<td><input type="submit" value="Deposit"></td>
			</tr>


		</table>
	</form>
</body>
</html>
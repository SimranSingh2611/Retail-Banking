<%@page import="com.tcs.ilp.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Withdraw</title>
<script type="text/javascript">
function checkBal()
{
	
	var b = document.getElementById("balance").innerHTML;
	var a = document.getElementById("depositamount").value;
	

	
	if((b-a)<0)
		{
				alert("Insufficient Balance");
				return false;
		}
}

</script>
</head>
<body>
	<form action="../Withdraw" method="post" onsubmit="return checkBal();">
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
					out.print("<tr><td>Balance</td><td id=\"balance\">" + a.getBalance()
							+ "</td></tr>");

				}
			%>
			<tr>
				<td>Withdraw Amount</td>
				<td><input type="number" name="withdrawamount" id="depositamount"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Withdraw"></td>
			</tr>


		</table>
	</form>
</body>
</html>
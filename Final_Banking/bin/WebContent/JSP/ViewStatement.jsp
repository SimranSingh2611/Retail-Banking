<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
ResultSet rs= (ResultSet)request.getAttribute("trans") ; %>

<table border="1">
<tr>
<th>TransactionId </th>
<th>AccountType </th>
<th>Amount number</th>
<th>Trans_Date </th>
<th>Source_AcctID </th>
<th>Target_AcctID  </th>
<th>Source_Acct_Type </th>
<th>Target_Acct_type  </th>
<th>Description  </th>
</tr>


<% while(rs.next())
	{%>
	<tr>
	<td><%=rs.getInt(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getInt(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getInt(5)%></td>
	<td><%=rs.getInt(6)%></td>
	<td><%=rs.getString(7)%></td>
	<td><%=rs.getString(8)%></td>
	<td><%=rs.getString(9)%></td>
	</tr>
	
	
	<%} %>
</table>
</body>
</html>
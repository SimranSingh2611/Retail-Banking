<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Status</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
</head>

<body>

	<%
		ResultSet rs = (ResultSet) request.getAttribute("result_set");
	%>
	<center>
		<div class="container-fluid">
			<%@include file="Header.jsp"%>
			<h3>Account Status</h3>
			<div class="row" style="margin-top:20px;margin-bottom:20px;">
			
				<table class="table table-striped">
					<tr>
						<th>Customer Id</th>
						<th>Account Id</th>
						<th>Type</th>
						<th>Status</th>
						<th>Message</th>
						<th>Last Update</th>
						<th>Refresh</th>


					</tr>


					<%
						while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getInt(1)%></td>
						<td><%=rs.getInt(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(5)%></td>
						<td><%=rs.getString(6)%></td>

						<td><a
							href="<%=request.getContextPath()%>/JSP/AddAccountSuccess.jsp">Refresh</a></td>


					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</center>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
<%@include file="Footer.jsp"%>
</html>
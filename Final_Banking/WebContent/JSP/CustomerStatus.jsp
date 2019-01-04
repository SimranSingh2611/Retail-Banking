<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Status</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
</head>
<body>

	<%
		ResultSet rs = (ResultSet) request.getAttribute("result_set1");
		ResultSet rs1 = (ResultSet) request.getAttribute("result_set2");
		int custID=0;
		if(request.getAttribute("CustomerID")!=null){
		 custID= (Integer)request.getAttribute("CustomerID");
		}
		
	%>
	<center>
		<div class="container-fluid">
			<%@include file="Header.jsp"%>
			<h3>Customer Status</h3>
			<div class="row" style="margin-top: 20px; margin-bottom: 120px;">
				<table class="table table-striped">
					<tr>
						<th>SSN Id</th>
						<th>Customer Id</th>
						<th>Status</th>
						<th>Message</th>
						<th>Last Update</th>
						<th>Refresh</th>
						<th>View Profile</th>

					</tr>


					<%
						while (rs.next()) {
							if( request.getAttribute("CustomerID")!=null && rs.getInt(2)==custID){
								while(rs1.next()){
								
					%>		
							<tr>
							<td><%=rs1.getInt(1)%></td>
							<td><%=rs1.getInt(2)%></td>
							<td><%=rs1.getString(3)%></td>
							<td><%=rs1.getString(4)%></td>
							<td><%=rs1.getString(5)%></td>
							<td><a href="<%=request.getContextPath()%>/CustomerStatus?action=<%=rs1.getInt(2)%>">Refresh</a></td>
							<td><a
								href="<%=request.getContextPath()%>/ViewProfile?action=<%=rs1.getInt(1)%>">View
									Profile</a></td>

						</tr>
							
					<% 			} }
								else{ %>		
					
					<tr>
						<td><%=rs.getInt(1)%></td>
						<td><%=rs.getInt(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(5)%></td>
						<td><a href="<%=request.getContextPath()%>/CustomerStatus?action=<%=rs.getInt(2)%>">Refresh</a></td>
						<td><a
							href="<%=request.getContextPath()%>/ViewProfile?action=<%=rs.getInt(1)%>">View
								Profile</a></td>

					</tr>
					<%
						} }
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
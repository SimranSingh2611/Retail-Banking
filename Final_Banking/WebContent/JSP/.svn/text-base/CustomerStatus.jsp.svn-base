<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	ResultSet rs = (ResultSet) request.getAttribute("result_set");
%>
<table class="table"  BORDER="1">
	<tr>
		<th>SSN ID</th>
	    <th>CUSTOMER ID</th>	    
  	    <th>STATUS</th>
	    <th>MESSAGE</th>
	    <th>LAST UPDATE</th>
	    <th>REFRESH</th>
	    <th>VIEW PROFILE</th>
	    
	</tr>
	
	
	<% while(rs.next()){ %>
		<tr>
		    <td> <%= rs.getInt(1) %></td>
		     <td> <%= rs.getInt(2) %></td>
		    <td> <%= rs.getString(3) %></td>
		     <td> <%= rs.getString(4) %></td>
		     <td> <%= rs.getString(5) %></td>
		     <td><a href="CustomerStatus" >Refresh</a></td>
	    	<td><a href="<%=request.getContextPath()%>/ViewProfile?action=<%=rs.getInt(1)%>">View Profile</a></td>
		    
		</tr>
            <% } 
            %>
        </table>
<br><br><br><br>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
     <%@page import="com.tcs.ilp.service.CustomerService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	int customerId =(Integer)request.getAttribute("action");
	ResultSet rs = (ResultSet) request.getAttribute("result_set1");
	/* CustomerService service = new CustomerService();
	ResultSet result = service.viewProfile(customerId); */

	//rs= result;
%>

<table class="table"  BORDER="1">
	<tr>
	  
	    <th>SSN ID</th>
	    <th>NAME</th>  
	    <th>CUSTOMER ID</th>
  	    <th>AGE</th>
	    <th>ADDRESS LINE 1</th>
	    <th>ADDRESS LINE 2</th>
	    <th>STATE</th>
	    <th>CITY</th>
	    
	</tr>
	
	
	<% while(rs.next()){ %>
		<tr>
		    <td> <%= rs.getInt(1) %></td>
		     <td> <%= rs.getString(2) %></td>
		    <td> <%= rs.getInt(3) %></td>
		     <td> <%= rs.getInt(4) %></td>
		     <td> <%= rs.getString(5) %></td>
		  	<td> <%= rs.getString(6) %></td>
		     <td> <%= rs.getString(7) %></td>
		     <td> <%= rs.getString(8) %></td>
		   
		    
		</tr>
            <% } 
            %>
        </table>
<br><br><br><br>

<% if(rs != null) rs.close(); %>

</body>
</html>
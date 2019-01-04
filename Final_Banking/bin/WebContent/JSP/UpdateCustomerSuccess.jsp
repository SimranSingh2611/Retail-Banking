<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Details</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
</head>
<%
	ResultSet rst = (ResultSet) request.getAttribute("cust");
%>
<%-- <%
	request.setAttribute("id", rst.getInt(3));
%> --%>
<%@include file="Header.jsp"%>
<body>
	<center>
		<div class="container-fluid">
			<div class="row" style="margin-bottom: 100px">
				<div class="col-md-6 col-md-offset-3" style="margin-top: 50px;">
					<form method="post" class="well form-horizontal"
						name="UpdateCustomer"
						action="<%=request.getContextPath()%>/UpdateCustomer?action=final">
						<h3>New Customer Credentials</h3>
						<br> <input type="hidden" name="id"
							value="<%=rst.getInt(3)%>" />
						<div class="form-group">
							<label class="control-label col-md-3"> Customer SSN ID</label>
							<div class="col-md-8">
								<input type="text" class="form-control" disabled
									value="<%=rst.getInt(1)%>">
								<%-- <label><%=rst.getInt(1)%> </label> --%>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3"> Customer ID</label>
							<div class="col-md-8">
								<input type="text" class="form-control" disabled
									value=" <%=rst.getInt(3)%>">

							</div>
						</div>
						<%-- <td><input type="hidden" name="id" value="<%=rst.getInt(3) %>"></td> --%>
						<label> Age</label>
						<%=rst.getInt(4)%></label>

						<tr>

							<td><label>New Age</label></td>
							<td><input type="number" name="cust_age"
								placeholder="Enter your age" required></td>



						</tr>
						<tr>

							<td><label>Old Customer Name</label></td>
							<td><label><%=rst.getString(2)%> </label></td>

						</tr>
						<tr>


							<td><label>New Customer Name <span
									style="color: red">*</span>&nbsp; &nbsp; &nbsp; &nbsp;
							</label></td>
							<td><input type="text" name="cust_name"
								placeholder="Enter new name" required></td>

						</tr>
						<tr>


							<td><label>Old Address </label></td>
							<td><label> <%=rst.getString(5)%> &nbsp; <%=rst.getString(6)%>
							</label></td>

						</tr>
						<tr>


							<td><label>New Address Line 1 <span
									style="color: red">*</span></label></td>
							<td><input type="text" name="cust_address_line1"
								placeholder="Enter updated address" required="required"></td>

						</tr>

						<tr>


							<td><label>New Address Line 2<span
									style="color: red">*</span></label></td>
							<td><input type="text" name="cust_address_line2"
								placeholder="Enter updated address" required="required"></td>

						</tr>
						<tr>


							<td><label>City<span style="color: red">*</span></label></td>
							<td><input type="text" name="city" placeholder="Enter city"
								required="required"></td>

						</tr>

						<tr>


							<td><label>State<span style="color: red">*</span></label></td>
							<td><input type="text" name="state"
								placeholder="Enter state" required="required"></td>

						</tr>


						<tr>
							<td></td>
							<td colspan="1"><span style="color: red">[*]Fields
									are Mandatory</span> &nbsp; &nbsp; &nbsp; &nbsp;</td>

						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td colspan="3"><input type="submit" name=Update
								value="Update"></td>
						</tr>

						</table>

					</form>
				</div>
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
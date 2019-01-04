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
							<label class="control-label col-md-5"> Customer SSN ID</label>
							<div class="col-md-6">
								<input type="text" class="form-control" disabled
									value="<%=rst.getInt(1)%>">
								<%-- <label><%=rst.getInt(1)%> </label> --%>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-5"> Customer ID</label>
							<div class="col-md-6">
								<input type="text" class="form-control" disabled
									value=" <%=rst.getInt(3)%>">

							</div>
						</div>
						<%-- <td><input type="hidden" name="id" value="<%=rst.getInt(3) %>"></td> --%>
						<div class="form-group">
							<label class="control-label col-md-5"> Age</label>
							<div class="col-md-6">
								<input type="text" class="form-control" disabled
									value=" <%=rst.getInt(4)%>">

							</div>

						</div>
						<div class="form-group">
							<label class="control-label col-md-5">New Age</label>
							<div class="col-md-6">
								<input type="number" class="form-control" name="cust_age"
									placeholder="Enter your age" required>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-5">Old Customer Name</label>
							<div class="col-md-6">
								<input type="text" class="form-control" disabled
									value=" <%=rst.getString(2)%> ">

							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-5">New Customer Name <span
								style="color: red">*</span>
							</label>
							<div class="col-md-6">
								<input type="text" class="form-control" name="cust_name"
									placeholder="Enter new name" required>
							</div>

						</div>
						<div class="form-group">
							<label class="control-label col-md-5">Old Address </label>
							<div class="col-md-6">
								<input type="text" class="form-control" disabled
									value=" <%=rst.getString(5)%> <%=rst.getString(6)%> ">

							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-5">New Address Line 1
								<span style="color: red">*</span>
							</label>
							<div class="col-md-6">
								<input type="text" class="form-control"
									name="cust_address_line1" placeholder="Enter updated address"
									required="required">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-5">New Address Line 2<span
								style="color: red">*</span></label>
							<div class="col-md-6">
								<input type="text" class="form-control"
									name="cust_address_line2" placeholder="Enter updated address"
									required="required">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-5">City<span
								style="color: red">*</span></label>
							<div class="col-md-6">
								<input type="text" name="city" class="form-control"
									placeholder="Enter city" required="required">
							</div>

						</div>
						<div class="form-group">
							<label class="control-label col-md-5">State<span
								style="color: red">*</span></label>
							<div class="col-md-6">
								<input type="text" name="state" class="form-control"
									placeholder="Enter state" required="required">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-5"></div>
							<div class="col-md-2">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
							<div class="col-md-1">
								<button type="reset" class="btn btn-danger">Reset</button>
							</div>
						</div>


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
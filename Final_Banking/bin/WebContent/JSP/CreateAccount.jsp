<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
</head>
<%@include file="Header.jsp" %>
<body>
<center>
	<div class="container">
	<div class="row" style="margin-bottom: 90px">
		<div class="col-md-8 col-md-offset-2">
			<h3>Create Account</h3>
			<form class="well form-horizontal" action="<%=request.getContextPath()%>/CreateAccount" method="post" >
				<div class="form-group">
					<label class="control-label col-md-3">Customer ID:</label> 
					<div class="col-md-8">
					<input type="text" class="form-control" name="customerId" id="customerId" placeholder="Customer ID" required />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">Account Type:</label> 
					<div class="col-md-8">
					<select name="accountType" id="accountType" class="form-control">
						<option value="S">Savings</option>
						<option value="C">Current</option>
					</select>
				</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">Deposit Amount:</label>
					<div class="col-md-8">
					 <input
						type="text" name="depositAmount" id="depositAmount" required
						placeholder="Amount" class="form-control" />
				</div>
				</div>
				<div class="form-group">
							<div class="col-md-4"></div>
							<div class="col-md-3">
								<button type="submit" class="btn btn-primary">Create</button>
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

<%@include file="Footer.jsp" %>	
</body>

</html>
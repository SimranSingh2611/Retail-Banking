<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deposit</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
</head>
<body>
	<center>
		<div class="container-fluid">
			<%@include file="Header.jsp"%>
			<div class="row" style="margin-bottom: 5px; padding-bottom: 120px;">
				<div class="col-md-6 col-md-offset-3" style="margin-top: 40px">
					<form class="well form-horizontal"
						action="<%=request.getContextPath()%>/<%=request.getParameter("action")%>?action=<%=request.getParameter("action")%>"
						method="post" name="AccountOperations" id="AccountOperations">
						
						<%
								String status = (String) request.getAttribute("status");
							%>
							<%
								if (status != null && (status.equalsIgnoreCase("Failed to Deposit")||status.equalsIgnoreCase("Failed to Withdraw"))) {
							%>
							<div class="alert alert-danger">
								<p>
									<strong>Try Again.</strong>
								<p><%=status %></p>
								</p>
							</div>
							<%
								}else if(status != null && (status.equalsIgnoreCase("Deposited Successfully")||status.equalsIgnoreCase("Withdraw Successfully") )){
									
							%>
							<div class="alert alert-success">
								<p>
									<strong>Success</strong>
								<p><%=status %></p>
								</p>
							</div>
							<%} %>
						<div class="form-group">
							<label class="control-label col-md-4">Account id</label>
							<div class="col-md-8">
								<input type="number" class="form-control" name="accID"
									required="required" placeholder="Account ID" id="accID">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Amount</label>
							<div class="col-md-8">
								<input type="number" class="form-control" name="amount"
									required="required" pattern=/[^0-9.]/g placeholder="Amount"
									id="amount">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-4"></div>
							<div class="col-md-2">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
							<div class="col-md-2">
								<button type="reset" class="btn btn-danger">Reset</button>
							</div>
						</div>

					</form>
				</div>
			</div>
			<%@include file="Footer.jsp"%>
		</div>
	</center>
</body>
<script src="../JS/Withdraw.js">
</script>
</html>
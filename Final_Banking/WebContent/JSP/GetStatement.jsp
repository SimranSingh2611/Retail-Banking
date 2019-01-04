<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get Statement</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" />
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>


<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" />
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
</head>
<body>
	<center>
		<div class="container-fluid">
			<%@include file="Header.jsp"%>
			<div class="row" style="margin-bottom: 100px">
				<div class="col-md-6 col-md-offset-3" style="margin-top: 20px;">
					<form class="well form-horizontal"
						action="<%=request.getContextPath()%>/GetStatement" method="post" id="GetStatement">
						<h3>Get Statement</h3>
						<br>

						<div class="form-group">
							<label class="control-label col-md-4">Account ID:<span
								style="color: red;">*</span>
							</label>
							<div class="col-md-7">
								<input type="number" class="form-control" name="account_id"
									required />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Select No of
								Transactions:<span style="color: red;">*</span>
							</label>
							<div class="col-md-7">
								<select class="form-control" name="transactions"
									id="transactions">
									<option value="0">Select Number of Transactions</option>
					
									<option value="5">5</option>
									<option value="10">10</option>
									<option value="15">15</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">From Date:<span
								style="color: red;">*</span></label>
							<div class="col-md-7">
								<input class="form-control" type="date" name="date1"
									min="2016-01-02" id="date1">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">To Date:<span
								style="color: red;">*</span></label>
							<div class="col-md-7">
								<input type="date" class="form-control" name="date2"
									max="2017-09-31" id="date2">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-4"></div>
							<div class="col-md-3">
								<button type="submit" class="btn btn-primary">Get Statement</button>
								
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
</body>
<%@include file="Footer.jsp"%>
<script src="../JS/GetStatement.js">
</script>

</html>
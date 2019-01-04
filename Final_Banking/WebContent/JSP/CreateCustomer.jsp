<%@page import="javax.swing.text.DocumentFilter"%>
<%@page import="javax.print.Doc"%>
<%@page import="com.tcs.ilp.bean.Customer"%>
<%@page import="java.sql.*"%>
<%@page import="com.tcs.ilp.util.DatabaseUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Customer</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	<script type="text/javascript" src="../JS/state.js"></script>
<script src="../JS/CreateCustomer.js">
			</script>
	
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<style>
.nav>li>a:hover {
	color: black !important;
}

a.dropdown-toggle:hover {
	color: black !important;
}
a.dropdown-toggle:visited {
	color: white !important;
}

</style>
</head>


<body style="margin: 0px; padding: 0px;" ng-app="cityApp" ng-controller="statecityController">
	<center>
		<div class="container-fluid">
			<%@include file="Header.jsp"%>
			<div class="row" style="margin-bottom: 5px; padding-bottom: 30px;">
				<div class="col-md-6 col-md-offset-3" style="margin-top: 20px">
					<form class="well form-horizontal"
						action="<%=request.getContextPath()%>/CreateCustomer" method="post" name="create"
						onsubmit="checkCreateCustomer" id="CreateCustomer">
                       <h3>Create Customer</h3>
                       <br>
						<div class="form-group">
							<label class="control-label col-md-4">Customer SSN Id<span
								style="color: red">*</span>
							</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="customerSSNId"
									id="customerSSNId" required placeholder="Customer SSN Id" on>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Customer Name<span
								style="color: red">*</span></label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="customerName"
									id="customerName" required placeholder="Customer Name">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Age<span
								style="color: red">*</span></label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="age" id="age"
									required placeholder="Age">
							</div>
							</div>
						
						<div class="form-group">
							<label class="control-label col-md-4">Address Line1<span
								style="color: red">*</span></label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="address1"
									id="address1" required placeholder="Address Line1">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Address Line2</label>
							<div class="col-md-8">
								<input type="text" name="address2" class="form-control"
									id="address2" placeholder="Address Line2">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">State<span
								style="color: red">*</span></label>
							<div class="col-md-8">
								<select id="state" name="state" class="form-control"  data-ng-init="getState();" ng-change="getCity();" ng-model="sc"><option>Select</option>
							<option ng-repeat="x in state" value="{{x}}">{{ x }}</option>
							
							

								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">City<span
								style="color: red">*</span></label>
							<div class="col-md-8">
								<select id="city" name="city" class="form-control"><option>Select</option>
								<option ng-repeat="x in city" value="{{x}}">{{ x }}</option>
							
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-4"></div>
							<div class="col-md-2">
								<button type="submit" class="btn btn-primary">Create</button>
							</div>
							<div class="col-md-2">
								<button type="reset" class="btn btn-danger">Reset</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			
			<script src="../JS/CreateCustomer.js">
			</script>
		
		</div>
	</center>
	
		
</body>
	<%@include file="Footer.jsp"%>
</html>
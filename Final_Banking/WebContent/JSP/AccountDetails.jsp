<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="../JS/AccountDetails.js">
		</script>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Details</title>

<script type="text/javascript">
	var app = angular.module('selectApp', []);
	app.controller('selectController', function($scope, $http) {
		$scope.getAccNoByCid = function(c_no) {
			$('#accSelect').show();
			$http.get("../FetchAccountDetails?c_no=" + c_no.value).then(
					function(response) {
						$scope.names = response.data;
						
					});
		}
		
		$scope.getAccNoBySSN = function(c_no) {
			$('#accSelect').show();
			$http.get("../FetchDetails?c_no=" + c_no.value).then(
					function(response) {
						$scope.names = response.data;
						
					});
		}
		

	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#accSelect').hide();
	});
</script>


<script type="text/javascript">
	function sendToViewDetails() {

		var x = document.getElementById("accSelect").value;
		document.getElementById("accountid").value = x;

		if (x == "select")
			alert('Select account id to proceed');
		<%-- else
			window.location = "<%=request.getContextPath()%>/AccountDetails?a_id="+ x; --%>
	}
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
</head>
<body ng-app="selectApp" ng-controller="selectController">
	<center>
		<div class="container-fluid">
			<%@include file="Header.jsp"%>
			<div class="row" style="margin-bottom: 100px">
				<div class="col-md-6 col-md-offset-3" style="margin-top: 20px;margin-bottom:-40px;">

					<form class="well form-horizontal" name="myForm"
						action="<%=request.getContextPath()%>/AccountDetails" method="post" id="AccountDetails">
						<h3>Account Details</h3>
						<br>
						<div class="form-group">
							<label class="control-label col-md-3">SSNID</label>
							<div class="col-md-8">
								<input type="number" class="form-control" id="ssnid"
									name="ssnid" ng-blur="getAccNoBySSN($event.target);">
							</div>
						</div>
						<label>OR</label>
						<div class="form-group">
							<label class="control-label col-md-3">Customer ID</label>
							<div class="col-md-8">
								<input type="number" class="form-control" name="customerid"
									id="customerid" ng-blur="getAccNoByCid($event.target);">
							</div>
						</div>

						<label>OR</label>
						<div class="form-group">
							<label class="control-label col-md-3">Account ID</label>
							<div class="col-md-8">
								<input type="number" class="form-control" id="accountid"
									name="a_id" >
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-3"></div>
							<div class="col-md-8">
								<select class="form-control" id="accSelect" onchange="sendToViewDetails();">
									<option value="select">Select Account Id</option>
									<option ng-repeat="x in names" value="{{x}}" >{{ x }}</option>
								</select>
							</div>

						</div>

						<div class="form-group">
							<div class="col-md-4"></div>
							<div class="col-md-2">
								<button type="submit" class="btn btn-primary" >Update</button>
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
</html>
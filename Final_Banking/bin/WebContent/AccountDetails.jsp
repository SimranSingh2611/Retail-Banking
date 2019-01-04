<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="myscript.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Details</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var app = angular.module('selectApp', []);
	app.controller('selectController', function($scope, $http) {
		$scope.getAccNoByCid = function(c_no) {
			$('#accSelect').show();
			$http.get("/FetchAccountDetails?c_no=" + c_no.value).then(
					function(response) {
						$scope.names = response.data;
						
					});
		}
		
		$scope.getAccNoBySSN = function(c_no) {
			$('#accSelect').show();
			$http.get(request.getContextPath()+"/FetchDetails?c_no=" + c_no.value).then(
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
		else
			window.location = "<%=request.getContextPath()%>/AccountDetails?a_id=" + x;
	}
</script>
</head>
<body ng-app="selectApp" ng-controller="selectController">



	<form name="myForm" action="<%=request.getContextPath()%>/AccountDetails" method="get">

		<table>
			<tr>
				<td id="ssnId">SSNID</td>
				<td><input type="number" id="ssnid" name="ssnid"
					ng-blur="getAccNoBySSN($event.target);"></td>
			</tr>
			<tr>
				<td>OR</td>
			</tr>
			<tr>
				<td>Customer ID</td>
				<td><input type="number" name="customerid" id="customerid"
					ng-blur="getAccNoByCid($event.target);"></td>
					
			</tr>

			<tr>
				<td>OR</td>
			</tr>

			<tr>
				<td id="accountid">Account ID</td>
				<td><input type="number" id="accountid" name="a_id" ></td>
				<td>	<select id="accSelect" onchange="sendToViewDetails();">
			<option value="select">- select -</option>
			<option ng-repeat="x in names" value="{{x}}">{{ x }}</option>
		</select></td>
			</tr>


			<tr>
				<td><input type="submit" value="Find"></td>
			</tr>

		</table>
		
	</form>
	
	<br>
	<br>
	<br>
</body>
</html>
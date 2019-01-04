<%@page import="javax.swing.text.DocumentFilter"%>
<%@page import="javax.print.Doc"%>
<%@page import="com.tcs.ilp.bean.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function populateData() {

		var ssnid = document.getElementById("ssnid").value;
		var customerid = document.getElementById("customerid").value;
		
		window.location.href = "<%=request.getContextPath()%>/PopulateServ?ssnid="+ ssnid + "&customerid=" + customerid; 
	}
	
	function reset(){
		alert("sd");
		window.location.href = "<%=request.getContextPath()%>/JSP/DeleteCustomer.jsp";
		
	}
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Customer</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<style>
.nav>li>a:hover {
	color: black !important;
}
a.dropdown-toggle:hover {
color: black !important;
}
</style>
</head>

<body>
	<center>
		<div class="container-fluid">
			<%@include file="Header.jsp" %>
			<div class="row" style="margin-bottom: 100px">
				<div class="col-md-6 col-md-offset-3" style="margin-top: 50px;">
					<form class="well form-horizontal" action="<%=request.getContextPath()%>/DeleteCustomer"
						method="post">
						<h3>Delete Customer</h3>
						<br>
						<div class="form-group">
							<label class="control-label col-md-3">SSNID<span
								style="color: red">*</span></label>
							<div class="col-md-8">
								<input type="text" id="ssnid" name="ssnid" class="form-control"
									onblur="populateData()"
									<%if ((Customer) request.getSession().getAttribute("CustDetails") != null) {
				Customer c = (Customer) request.getSession().getAttribute(
						"CustDetails");
				out.print("value=\"" + c.getSsnId() + "\" ");

			}%>>
							</div>
						</div>
						<label>OR</label>
						<div class="form-group">
							<label class="control-label col-md-3">Customer ID<span
								style="color: red">*</span></label>
							<div class="col-md-8">
								<input type="text" name="customerid" id="customerid"
									class="form-control" onfocusout="populateData();"
									<%if ((Customer) request.getSession().getAttribute("CustDetails") != null) {
				Customer c = (Customer) request.getSession().getAttribute(
						"CustDetails");
				out.print("value=\"" + c.getCustomerId() + "\" ");
			}%>>
							</div>
						</div>


						<%
							if ((Customer) request.getSession().getAttribute("CustDetails") != null) {
								out.print("<div class=\"form-group\"><label class=\"control-label col-md-3\">Name</label>"
								+"<div class=\"col-md-8\"><input class=\"form-control\" type=\"text\" name=\"name\" disabled ");
								if ((Customer) request.getSession().getAttribute("CustDetails") != null) {
									Customer c = (Customer) request.getSession().getAttribute(
											"CustDetails");
									out.print("value=\"" + c.getName() + "\"></div> </div>");
								}
								out.print("<div class=\"form-group\"><label class=\"control-label col-md-3\">Age</label>"
										+"<div class=\"col-md-8\"><input class=\"form-control\" type=\"text\" name=\"age\" disabled ");
								if ((Customer) request.getSession().getAttribute("CustDetails") != null) {
									Customer c = (Customer) request.getSession().getAttribute(
											"CustDetails");
									out.print("value=\"" + c.getAge() + "\"></div> </div>");
								}
								out.print("<div class=\"form-group\"><label class=\"control-label col-md-3\">Address</label>"
										+"<div class=\"col-md-8\"><input class=\"form-control\" type=\"text\" name=\"address\" disabled ");
								if ((Customer) request.getSession().getAttribute("CustDetails") != null) {
									Customer c = (Customer) request.getSession().getAttribute(
											"CustDetails");
									out.print("value=\"" + c.getAddress1() + "\"></div> </div>");
								}
								out.print("<br>");

								request.getSession().setAttribute("CustDetails", null);
							}
						%>


						<div class="form-group">
							<div class="col-md-4"></div>
							<div class="col-md-3">
								<button type="submit" class="btn btn-primary">
					Delete</button>
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
<%@include file="Footer.jsp" %>
</html>
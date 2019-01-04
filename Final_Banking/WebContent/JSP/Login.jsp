<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


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
	<style>
	body {
background-image: url("../images/banking1.jpg");
}
	</style>
</head>
<body>
	<%
		response.setHeader("Cache-Control",
				"no-cache, no-store, must-revalidate"); //prevent back button feature

		response.setHeader("Pragma", "no-cache");

		response.setHeader("Expires", "0");
	%>
	<center>
		<div class="container-fluid">
			
			<div class="row" style="margin-bottom: 5px; padding-bottom: 30px;">
				<div class="col-md-6 col-md-offset-3" style="margin-top: 100px"
					id="divform">
				
						<form class="well form-horizontal" action="<%=request.getContextPath()%>/VerifyUser"
							method="post" id="login">
							<h1>Login</h1>
							<br>
							<div class="form-group">
								<label class="control-label">Login id</label> 
								<input type="text" class="form-control"
									name="userId" placeholder="Login Id">
							</div>
							<div class="form-group">
								<label>Password</label> <input type="password"
									class="form-control" name="password" placeholder="Password">
							</div>

							<div class="form-group">
								<label>Type</label> <select name="userType" class="form-control">
									<option value="S">Account Executive</option>
									<option value="C">Cashier</option>
								</select>

							</div>
							<div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
							<br>

							<%
								String status = (String) session.getAttribute("status");
								session.removeAttribute("status");
							%>
							<%
								if (status != null && status.equalsIgnoreCase("fail")) {
							%>
							<div class="alert alert-danger">
								<p>
									<strong>Try Again.</strong>
								<p>Invalid LoginID and Password</p>
								</p>
							</div>
							<%
								}
							%>

						</form>
					

				</div>
			</div>
		</div>
</center>


</body>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/scripts.js"></script>
<script src="../JS/Login.js">
	
</script>
</html>
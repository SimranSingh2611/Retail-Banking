<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Bootstrap 3, from LayoutIt!</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.carousel-inner>.item>img,.carousel-inner>.item>a>img {
	width: 80%;
	margin: auto;
}

#myCarousel {
	float: left;
	width: 700px;
	height: 450px;
	display: inline-block;
}

#divform {
	float: left;
	width: 250px;
	height: 400px;
	margin: 4em;
	margin-top: 15px;
	display: inline-block;
}

#div1 {
	width: 750px;
	height: 300px;
	margin-top: 50px;
}

#div2 {
	width: 750px;
	height: 300px;
	margin-top: 50px;
}

#div3 {
	width: 750px;
	height: 300px;
	margin-top: 50px;
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

	<div class="container-fluid">
		<div class="row" style="background-color: #1f7a7a">
			<div class="col-md-12">
				<h2 style="color: white">AMEX Bank</h2>
			</div>
		</div>


		<div class="row" style="background-color: #ebfafa;">
			<div class="col-md-7">
				<div id="myCarousel" class="carousel slide" data-ride="carousel"
					style="margin-top: 1px">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active" id="div1">
							<img src="../images/bank1.jpg" alt="Bank 1">
						</div>

						<div class="item" id="div2">
							<img src="../images/bank2.jpg" alt="Bank 2">
						</div>

						<div class="item" id="div3">
							<img src="../images/bank3.png" alt="Bank 3">
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<!-- corousel end -->


			<div class="col-md-5" align="right" id="divform">

				<form style="width: 300px"
					action="<%=request.getContextPath()%>/VerifyUser" method="post">

					<div class="form-group" align="left">
						<h1>Login</h1>
					</div>
					<div class="form-group" align="left">
						<label>Login id</label> <input type="text" class="form-control"
							name="userId" placeholder="Login Id">
					</div>
					<div class="form-group" align="left">
						<label>Password</label> <input type="password"
							class="form-control" name="password" placeholder="Password">
					</div>

					<div class="form-group" align="left">
						<label>Type</label> <select name="userType" class="form-control">
							<option value="S">Account Executive</option>
							<option value="C">Cashier</option>
						</select>

					</div>
					<div align="left">
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
					<div class="alert alert-danger" align="left">
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

		<div class="row" style="background-color: #1f7a7a">
			<div class="col-md-4" style="text-align: justify;">
				<h2>About Us</h2>
				<p>AMEX bank is founded in 15th Oct 2017 with the objective of
					providing with the detail services based on Retail Banking
					operations.The Retail Internet Banking of fedChoice Bank offers a
					plethora of products and services,to cater its customers by
					providing certain services with an easy volving offers and ways to
					do the required job without including the process.</p>
			</div>
			<div class="col-md-4">
				<h2>Services</h2>
				<p>Retail and Consumer Banking Personal Internet Banking
					Corporate Internet Banking Debit and Credit Cards</p>
			</div>
			<div class="col-md-4">
				<h2>Contact Us</h2>
				Email:priyanka.takkar@tcs.com <br> Contact No.:+91-987654321<br>
				Address: Corporate Office,Garima Park, Gandinagar,Ahmedabad,382421
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get Statement</title>

</head>
<body>
	<center>
		
		<form action="<%=request.getContextPath()%>/GetStatement" method="post">

			Account ID:<span style="color: red;">*</span> <input type="number"
				name="account_id" required /> 
				
			Select No of Transactions:<span
				style="color: red;">*</span>
				 <select name="transactions" id="transactions">
					 <option value="0">0</option>
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="15">15</option>
				</select>
				
		   From Date:<span style="color: red;">*</span> <input type="date"
				name="date1" min="2016-01-02" id="date1">
				
		  To Date:<span	style="color: red;">*</span> <input type="date" name="date2"
				max="2017-09-31" id="date2">
				
			 <input type="submit" value="SUBMIT">

		</form>
	</center>
</body>
</html>
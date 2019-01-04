<%@page import="java.sql.ResultSet"%>
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://www.shieldui.com/shared/components/latest/css/light/all.min.css" />
<script type="text/javascript"
	src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript"
	src="http://www.shieldui.com/shared/components/latest/js/jszip.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript">
	jQuery(function($) {
		$("#exportButton").click(function() {
			// parse the HTML table element having an id=exportTable
			var dataSource = shield.DataSource.create({
				data : "#exportTable",
				schema : {
					type : "table",
					fields : {

						TransactionId : {
							type : Number
						},
						Amount : {
							type : Number
						},
						Trans_Date : {
							type : String
						},
						Source_AcctID : {
							type : Number
						},
						Target_AcctID : {
							type : Number
						},
						Source_Acct_Type : {
							type : String
						},
						Target_Acct_type : {
							type : String
						},
						Description : {
							type : String
						}

					}
				}
			});

			// when parsing is done, export the data to PDF
			dataSource.read().then(function(data) {

				var pdf = new shield.exp.PDFDocument({
					author : "Pratidhi",
					created : new Date()
				});

				pdf.addPage("a4", "portrait");

				pdf.table(50, 50, data, [ {
					field : "TransactionId",
					title : "Transaction Id",
					width : 100
				}, {
					field : "Amount",
					title : "Amount",
					width : 50
				}, {
					field : "Trans_Date",
					title : "Date",
					width : 50
				}, {
					field : "Source_AcctID",
					title : "Source AccID",
					width : 100
				}, {
					field : "Target_AcctID",
					title : "Target AccID",
					width : 100
				},

				{
					field : "Description",
					title : "Description",
					width : 90
				}

				], {
					margins : {
						top : 50,
						left : 50
					}
				});

				pdf.saveAs({
					fileName : "TransactionPDF"
				});
			});
		});
	});
</script>


<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
</head>
<body>
	<%
		ResultSet rs = (ResultSet) request.getAttribute("trans");
	%>
	<center>
		<div class="container-fluid">
			<%@include file="Header.jsp"%>
			<h3>Customer Status</h3>
			<div class="row" style="margin-top: 20px; margin-bottom: 205px;">

				<table class="table table-striped" id="exportTable">
					<thead>
						<tr>
							<th>TransactionId</th>
							<th>Amount</th>
							<th>Trans_Date</th>
							<th>Source_AcctID</th>
							<th>Target_AcctID</th>
							<th>Source_Acct_Type</th>
							<th>Target_Acct_type</th>
							<th>Description</th>
						</tr>
					</thead>
					<tbody>
						<%
							while (rs.next()) {
						%>
						<tr>
							<td><%=rs.getInt(8)%></td>
							<td><%=rs.getInt(1)%></td>
							<td><%=rs.getString(2)%></td>
							<td><%=rs.getInt(3)%></td>
							<td><%=rs.getInt(4)%></td>
							<td><%=rs.getString(5)%></td>
							<td><%=rs.getString(6)%></td>
							<td><%=rs.getString(7)%></td>
						</tr>

					</tbody>
					<%
						}
					%>
					<button id="exportButton" class="btn btn-lg btn-danger clearfix">
						<span class="fa fa-file-pdf-o"></span> Export to PDF
					</button>
				</table>
			</div>
			<%@include file="Footer.jsp" %>
		</div>
	</center>
</body>
</html>
<%
String usertype=(String)session.getAttribute("usertype");
if(usertype.equalsIgnoreCase("S"))
{
%>

<div class="row" style="background-color: #B65881; height: 60px;">
				<div class="col-md-3">
					<h3 style="color: white; margin-left: 10px;">AMEX Bank</h3>
				</div>
				<div class="col-md-9" style="margin-top: 10px;">
					<ul class="nav nav-pills">
						<li><a href="#" style="color: white;">Home</a></li>
						<li class="dropdown"><a id="cust" class="dropdown-toggle"
							data-toggle="dropdown" href="#" style="color: white;"><span>Customer
									Management<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="ViewProfile.jsp">View Profile</a></li>
								<li><a href="<%=request.getContextPath() %>/JSP/CreateCustomer.jsp">Create Customer</a></li>
								<li><a href="<%=request.getContextPath() %>/JSP/UpdateCustomer.jsp">Update Customer</a></li>
								<li><a href="<%=request.getContextPath() %>/JSP/DeleteCustomer.jsp">Delete Customer</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"  style="color: white;">Account
								Management <span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="<%=request.getContextPath() %>/JSP/CreateAccount.jsp">Create Account</a></li>
								<li><a href="<%=request.getContextPath() %>/JSP/DeleteAccount.jsp">Delete Account</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"  style="color: white;">Account
								Transaction <span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#">Deposit</a></li>
								<li><a href="#">Withdraw</a></li>
								<li><a href="#">Transfer</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"  style="color: white;">Status
								<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="<%=request.getContextPath()%>/CustomerStatus">Customer Status</a></li>
								<li><a href="<%=request.getContextPath()%>/AccountStatus">Account Status</a></li>
							</ul></li>
						<li><a href="" style="color: white;">Log Out</a></li>
					</ul>
				</div>
			</div>
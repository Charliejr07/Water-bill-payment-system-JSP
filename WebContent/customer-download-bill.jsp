<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Water Billing System</title>
<link rel="stylesheet" type="text/css" href="Resources/Css/contact.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- popinsFont -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&display=swap"
	rel="stylesheet">
<!-- forntAwesome -->
<link rel="stylesheet" href="Resources/Fonts/css/all.min.css">
<!-- css file -->
<link rel="stylesheet" href="Resources/Css/style.css">
<!--  <link rel="stylesheet" href="Resources/Css/responsive.css"> -->
<link rel="stylesheet" href="Resources/Css/media.css">
</head>
<body>
	<div class="my-warp">
		<header>
			<div class="container">
				<nav class="navbar navbar-expand-md navbar-light bg-light">
					<h1>Water Billing System</h1>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav m-auto">
							<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
							<li class="nav-item"><a class="nav-link"
								href="customer-download-bill.jsp">Bill Download</a></li>
							<li class="nav-item"><a class="nav-link"
								href="feedback-or-comments.jsp">Feedback/Comments</a></li>
							<li class="nav-item"><a class="nav-link"
								href="admin-login.jsp">Admin Login</a></li>
						</ul>
					</div>
				</nav>
			</div>
			<!-- contianer -->
		</header>
		<!-- <section class="contact" id="contact"> -->
		<div class="contactForm">
			<div class="tit">
				<h4 class="titTxt">
					<span>Download Your Water Bill</span>
				</h4>

			</div>
			<form action="customer-download-bill.jsp" method="post">
				<div class="inputBox">
					<label for="waterNo">Enter Your Water No :</label> <input
						id="electricityNo" type="text" name="waterNo"
						placeholder="Enter Your Water No">
				</div>
				<div class="inputBox">
					<input type="submit" value="Search">
				</div>
			</form>
			<%
				String electricityNo = request.getParameter("waterNo");
				ResultSet resultset = DatabaseConnection
						.getResultFromSqlQuery("select * from tblcustomersbillingrecords where waterno='"
								+ electricityNo + "' order by id desc");
				if (resultset.next()) {
			%>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th colspan="12"><font color="blue">Customer
								Information</font></th>
					</tr>
					<tr>
						<th colspan="1">Water No</th>
						<td colspan="3"><input type="text" name="telephoneNo"
							class="form-control"
							value="<%=resultset.getString("waterno")%>"></td>
						<th colspan="1">Customer No</th>
						<td colspan="3"><input type="text" name="customerNo"
							class="form-control" value="<%=resultset.getString("custumno")%>"></td>
						<th colspan="1">Bill No</th>
						<td colspan="3"><input type="text" name="billNo"
							class="form-control" value="<%=resultset.getString("billno")%>"></td>
					</tr>
					<tr>
						<th>Customer Name</th>
						<td colspan="12"><input type="text" name="fullName"
							class="form-control"
							value="<%=resultset.getString("customer_name")%>"></td>
					</tr>
					<tr>
						<th colspan="12"><font color="blue">Address</font></th>
					</tr>
					<tr>
						<th colspan="1">At-Post</th>
						<td colspan="3"><input type="text" name="atPost"
							class="form-control" value="<%=resultset.getString("atpost")%>"></td>

						<th colspan="1">Plot No</th>
						<td colspan="2"><input type="text" name="plotNo"
							class="form-control" value="<%=resultset.getInt("plotno")%>"></td>

						<th colspan="1">Area</th>
						<td colspan="1"><input type="text" name="area"
							class="form-control" value="<%=resultset.getString("area")%>"></td>

						<th colspan="1">Taluka</th>
						<td colspan="2"><input type="text" name="taluka"
							class="form-control" value="<%=resultset.getString("taluka")%>"></td>
					</tr>
					<tr>
						<th colspan="1">District</th>
						<td colspan="3"><input type="text" name="district"
							class="form-control" value="<%=resultset.getString("dist")%>"></td>

						<th colspan="1">State</th>
						<td colspan="3"><input type="text" name="state"
							class="form-control" value="<%=resultset.getString("state")%>"></td>

						<th colspan="1">Pincode</th>
						<td colspan="3"><input type="text" name="pincode"
							class="form-control" value="<%=resultset.getInt("pincode")%>"></td>
					</tr>
					<tr>
						<th colspan="12"><font color="blue">Meter Reading's</font></th>
					</tr>
					<tr>
						<th colspan="1">Opening Reading</th>
						<td colspan="5"><input type="text" name="initialMeterReading"
							class="form-control"
							value="<%=resultset.getString("initialMeterReading")%>"></td>
						<th colspan="1">Closed Reading</th>
						<td colspan="5"><input type="text" name="finalMeterReading"
							class="form-control"
							value="<%=resultset.getString("finalMeterReading")%>"></td>
					</tr>
					<tr>
						<th colspan="12"><font color="blue">Call's</font></th>
					</tr>
					<tr>
						<th colspan="1">Total Call</th>
						<td colspan="3"><input type="text" name="totalCall"
							class="form-control"
							value="<%=resultset.getString("totalUnit")%>"></td>

						<th colspan="1">Free Call</th>
						<td colspan="3"><input type="text" name="freecall"
							class="form-control" value="<%=resultset.getString("freeUnit")%>"></td>

						<th colspan="1">Net Chargeable Call</th>
						<td colspan="3"><input type="text" name="netcall"
							class="form-control"
							value="<%=resultset.getString("netChargeableUnit")%>"></td>
					</tr>
					<tr>
						<th colspan="12"><font color="blue">Bill Calculation</font></th>
					</tr>
					<tr>
						<th colspan="1">Fixed Monthly Charges</th>
						<td colspan="2"><input type="text" name="monthfixedCharge"
							class="form-control"
							value="<%=resultset.getString("fixedMonthlyCharges")%>"></td>
						<th colspan="1">Meter Charges</th>
						<td colspan="2"><input type="text" name="meteredcharge"
							class="form-control"
							value="<%=resultset.getString("meterCharges")%>"></td>
						<th colspan="1">Service Tax</th>
						<td colspan="1"><input type="text" name="serviceTax"
							class="form-control"
							value="<%=resultset.getString("serviceTax")%>"></td>
						<th colspan="1">Total Bill</th>
						<td colspan="3"><input type="text" name="totalbill"
							class="form-control"
							value="<%=resultset.getString("totalBill")%>"></td>
					</tr>
					<tr>
						<td colspan="12"><a titlt="print screen" alt="print screen"
							onclick="window.print();" target="_blank"
							style="cursor: pointer;"><center>
									<img src="images/print.png">
								</center></a></td>
					</tr>
				</tbody>
			</table>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>

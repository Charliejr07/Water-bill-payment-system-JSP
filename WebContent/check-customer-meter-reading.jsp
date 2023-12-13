<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<html lang="en">
<head>
<title>Electricity Billing System</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="assets/css/demo.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
</head>

<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<!-- WRAPPER -->
	<div id="wrapper">
		<jsp:include page="admin-header.jsp"></jsp:include>
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">Check Customer Meter Readings</h3>
					<div class="row">
						<div class="col-md-12">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Check Customer Meter Readings</h3>
								</div>
								<div class="panel-body">
									<form action="check-customer-meter-readings.jsp" method="post">
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="electricityNo">Electricity No</label> <input
													type="text" class="form-control" id="electricityNo"
													name="electricityNo"
													placeholder="Please Enter Electricity No">
											</div>
											<div class="form-group col-md-2">
												<label for="electricityNo">&nbsp;</label><br> <input
													type="submit" class="btn btn-danger"
													value="Check Meter Readings">
											</div>
											<br>
										</div>
									</form>
									<%
										String waterNo = request.getParameter("electricityNo");
											int initialMeterReading = 0;
											ResultSet resultset = DatabaseConnection.getResultFromSqlQuery(
													"select initialmeterReading from tblcustomer where electricityno='" + waterNo + "'");
											if (resultset.next()) {
												initialMeterReading = resultset.getInt("initialmeterReading");
											}
									%>
									<form action="generate-customer-electricity-bill.jsp"
										method="post">
										<input type="hidden" name="electricityNo"
											value="<%=waterNo%>">
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="initialMeterReading">Customer Initial
													Meter Reading</label> <input type="text" class="form-control"
													id="initialMeterReading" name="initialMeterReading"
													value="<%=initialMeterReading%>" readonly>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="finalMeterReading">Final Meter Reading</label> <input
													type="text" class="form-control" id="finalMeterReading"
													name="finalMeterReading"
													placeholder="Enter Final Meter Reading">
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-8">
												<%
													String quantity = (String) session.getAttribute("meter-reading");
														if (quantity != null) {
															session.removeAttribute("meter-reading");
												%>
												<div class="alert alert-danger" id="danger">Final
													meter reading should be greater than initial meter reading.</div>
												<%
													}
												%>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-8">
												<label for="instruction">Note - Final meter reading
													should be greater than customer initial meter reading.</label>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-8">
												<label for="telephoneNo">&nbsp;</label><input type="submit"
													class="btn btn-primary" value="Generate Bill">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<jsp:include page="admin-footer.jsp"></jsp:include>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
	<%
		} else {
			response.sendRedirect("admin-login.jsp");
		}
	%>
</body>
</html>

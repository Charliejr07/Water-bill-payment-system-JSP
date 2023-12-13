<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!doctype html>
<html lang="en">

<head>
<title>Water Billing System</title>
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
					<h3 class="page-title">Customer Water No Wise Billing Report</h3>
					<div class="row">
						<div class="col-md-12">
							<!-- TABLE HOVER -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Customer Water No Wise Billing
										Report</h3>
								</div>
								<div class="panel-body">
									<form action="view-customers-reports.jsp" method="post">
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="waterNo">Select Water No</label> <select
													class="form-control" name="waterNo">
													<option>Select Water No</option>
													<%
														String waterNo = null;
															ResultSet rs = DatabaseConnection
																	.getResultFromSqlQuery("select distinct(waterno) from tblcustomersbillingrecords");
															while (rs.next()) {
																waterNo = rs.getString(1);
													%>
													<option><%=waterNo%></option>
													<%
														}
													%>
												</select>
											</div>
											<div class="form-group col-md-2">
												<label for="telephoneNo">&nbsp;</label><br> <input
													type="submit" class="btn btn-danger" value="Search Reports">
											</div>
										</div>
									</form>
									<br>
									<div class="row">
										<div class="col-md-12">
											<!-- Advanced Tables -->
											<div class="panel panel-default">
												<div class="panel-heading">Customers Billing Reports</div>
												<div class="panel-body">
													<div class="table-responsive">
														<table
															class="table table-striped table-bordered table-hover"
															id="dataTables-example">
															<thead>
																<tr>
																	<th>Id</th>
																	<th>Customer Name</th>
																	<th>Water No</th>
																	<th>Area</th>
																	<th>Total Units</th>
																	<th>Total Bill</th>
																	<th>Date</th>
																</tr>
															</thead>
															<%
																String electNo = request.getParameter("waterNo");
																	ResultSet resultset = DatabaseConnection.getResultFromSqlQuery(
																			"select * from tblcustomersbillingrecords where waterno='" + waterNo + "'");
																	while (resultset.next()) {
															%>
															<tbody>
																<tr class="odd gradeX">
																	<td><%=resultset.getInt("id")%></td>
																	<td><%=resultset.getString("customer_name")%></td>
																	<td><%=resultset.getString("waterno")%></td>
																	<td class="center"><%=resultset.getString("area")%></td>
																	<td class="center"><%=resultset.getInt("netChargeableUnit")%></td>
																	<td class="center"><%=resultset.getInt("totalBill")%></td>
																	<td class="center"><%=resultset.getString("system_date")%></td>
																</tr>
															</tbody>
															<%
																}
															%>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- END TABLE HOVER -->
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
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
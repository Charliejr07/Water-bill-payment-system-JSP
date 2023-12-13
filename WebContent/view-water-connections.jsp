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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
					<h3 class="page-title">View Water Connections</h3>
					<div class="row">
						<div class="col-md-12">
							<%
								String customer = (String) session.getAttribute("customer-update");
									if (customer != null) {
										session.removeAttribute("customer-update");
							%>
							<div class="alert alert-info" id="info">Customer info
								updated successfully.</div>
							<%
								}
							%>
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">View Water Connections</h3>
								</div>
								<div class="panel-body">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>Action</th>
												<th>Id</th>
												<th>Customer No</th>
												<th>Customer Name</th>
												<th>At-Post</th>
												<th>Plot No</th>
												<th>Taluka</th>
												<th>District</th>
												<th>Pincode</th>
												<th>State</th>
												<th>Area</th>
												<th>Water No</th>
												<th>Meter Reading</th>
											</tr>
										</thead>
										<%
											ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcustomer");
												while (resultset.next()) {
													String customerName = resultset.getString("firstname") + " " + resultset.getString("parentname")
															+ " " + resultset.getString("surname");
										%>
										<tbody>
											<tr>
												<td><a
													href="edit-water-connection.jsp?customerId=<%=resultset.getString("custumno")%>"
													class="btn btn-danger">Edit</a></td>
												<td><%=resultset.getInt("id")%></td>
												<td><%=resultset.getString("custumno")%></td>
												<td><%=customerName%></td>
												<td><%=resultset.getString("atpost")%></td>
												<td><%=resultset.getInt("plotno")%></td>
												<td><%=resultset.getString("taluka")%></td>
												<td><%=resultset.getString("dist")%></td>
												<td><%=resultset.getInt("pincode")%></td>
												<td><%=resultset.getString("state")%></td>
												<td><%=resultset.getString("area")%></td>
												<td><%=resultset.getString("waterno")%></td>
												<td><%=resultset.getString("initialmeterReading")%></td>
											</tr>
										</tbody>
										<%
											}
										%>
									</table>
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
	<script type="text/javascript">
		$(function() {
			$('#info').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#danger').delay(3000).show().fadeOut('slow');
		});
	</script>
</body>

</html>

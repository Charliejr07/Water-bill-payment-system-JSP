<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
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
					<h3 class="page-title">Admin Profile</h3>
					<div class="row">
						<div class="col-md-12">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Admin Profile</h3>
								</div>
								<%
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery(
												"select * from tbladmin where uname='" + session.getAttribute("uname") + "'");
										while (resultset.next()) {
								%>
								<div class="panel-body">
									<div class="form-row">
										<div class="form-group col-md-7">
											<label for="Id">Admin Id</label> <input type="text"
												class="form-control" name="" placeholder=""
												value="<%=resultset.getString("id")%>" readonly>
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-7">
											<label for="email">Email Id</label> <input type="text"
												class="form-control" id="" name="" placeholder=""
												value="<%=resultset.getString("email")%>">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-7">
											<label for="uname">User Name</label> <input type="text"
												class="form-control" id="" name="" placeholder=""
												value="<%=resultset.getString("uname")%>">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-7">
											<label for="uname">Password</label> <input type="password"
												class="form-control" id="" name="" placeholder=""
												value="<%=resultset.getString("upass")%>">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-7">
											<label for="createdAt">Created At</label> <input type="text"
												class="form-control" id="" name="" placeholder=""
												value="<%=resultset.getString("created_at")%>" readonly>
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-7">
											<label for="updatedAt">Updated At</label> <input type="text"
												class="form-control" id="" name="" placeholder=""
												value="<%=resultset.getString("updated_at")%>" readonly>
										</div>
									</div>
								</div>
								<%
									}
								%>
							</div>
							<!-- END INPUTS -->
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
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
					<h3 class="page-title">Admin Change Password</h3>
					<div class="row">
						<div class="col-md-12">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Admin Change Password</h3>
								</div>
								<div class="form-row">
									<div class="form-group col-md-7">
										<%
											String message = (String) session.getAttribute("password-change-success");
												if (message != null) {
													session.removeAttribute("password-change-success");
										%>
										<div class='alert alert-success' id='success'>Password
											change successfully.</div>
										<%
											}
										%>
										<%
											String fail = (String) session.getAttribute("password-change-fail");
												if (fail != null) {
													session.removeAttribute("password-change-fail");
										%>
										<div class="alert alert-danger" id='danger'>Old password
											does not match..</div>
										<%
											}
										%>
										<%
											String passwordConfirm = (String) session.getAttribute("password-not-match");
												if (passwordConfirm != null) {
													session.removeAttribute("password-not-match");
										%>
										<div class="alert alert-danger" id='danger'>New password
											and confirm password does not match.</div>
										<%
											}
										%>
									</div>
								</div>
								<%
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery(
												"select * from tbladmin where uname='" + session.getAttribute("uname") + "'");
										if (resultset.next()) {
								%>
								<form action="AdminChangePassword" method="post">
									<div class="panel-body">
										<div class="form-row">
											<div class="form-group col-md-7">
												<label for="upass">Current Password</label> <input
													type="password" class="form-control" id="" name="cpassword"
													placeholder="" value="<%=resultset.getString("upass")%>">
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-7">
												<label for="upass">New Password</label> <input
													type="password" class="form-control" id="" name="password"
													placeholder="New Password">
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-7">
												<label for="upass">Confirm Password</label> <input
													type="password" class="form-control" id="" name="confpass"
													placeholder="Confirm Password">
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-7">
												<input type="submit" class="btn btn-primary"
													value="Change Password">
											</div>
										</div>
									</div>
								</form>
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
	<script type="text/javascript">
		$(function() {
			$('#success').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#danger').delay(3000).show().fadeOut('slow');
		});
	</script>
</body>
</html>

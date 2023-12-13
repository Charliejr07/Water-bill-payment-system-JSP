<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Water Billing System</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8" />
<meta name="keywords"
	content="Working Signin form Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!-- //Meta tag Keywords -->
<link
	href="//fonts.googleapis.com/css2?family=Karla:wght@400;700&display=swap"
	rel="stylesheet">
<!--/Style-CSS -->
<link rel="stylesheet" href="css/login-style.css" type="text/css"
	media="all" />
<!--//Style-CSS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<section class="w3l-workinghny-form">
		<div class="workinghny-form-grid">
			<div class="wrapper">
				<div class="logo">
					<h3>
						Water Billing System | <span>Admin</span> Sign In
					</h3>
				</div>
				<div class="workinghny-block-grid">
					<div class="workinghny-left-img align-end">
						<img src="images/2.png" class="img-responsive" alt="img" />
					</div>
					<div class="form-right-inf">
						<div class="login-form-content">
							<h2>Where to?</h2>
							<form action="AdminLogin" method="post">
								<div class="one-frm">
									<%
										String credential = (String) session.getAttribute("credential");
										if (credential != null) {
											session.removeAttribute("credential");
									%>
									<div class="alert alert-danger" id="danger">You have
										enter wrong credentials.</div>
									<%
										}
									%>
									<%
										String captchaCode = (String) session.getAttribute("verificationCode");
										if (captchaCode != null) {
											session.removeAttribute("verificationCode");
									%>
									<div class="alert alert-info" id="info">You have enter
										wrong verification code.</div>
									<%
										}
									%>
								</div>
								<br>
								<div class="one-frm">

									<label>User Name</label> <input type="text" placeholder=""
										name="uname" required="">
								</div>
								<div class="one-frm">
									<label>Password</label> <input type="password" placeholder=""
										name="upass" required="">
								</div>
								<div class="one-frm">
									<label>Enter Verification (Captcha) Code</label> <input
										type="text" placeholder="" name="vercode" required="">
								</div>
								<%
									String captcha = null;
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select captcha from tblcaptcha");
									if (resultset.next()) {
										captcha = resultset.getString(1);
									}
								%>
								<div class="one-frm">
									<label>Captcha</label><input type="text" name="captcha"
										value="<%=captcha%>" readonly disabled>
								</div>
								<input type="submit" value="Sign In" class="btn btn-style mt-3">
							</form>
							<a href="index.jsp">Go To Home</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //form -->
		<!-- copyright-->
		<div class="copyright text-center">
			<div class="wrapper">
				<p class="copy-footer-29">Water Billing System</p>
			</div>
		</div>
		<!-- //copyright-->
	</section>
	<script type="text/javascript">
		$(function() {
			$('#danger').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#info').delay(3000).show().fadeOut('slow');
		});
	</script>
</body>
</html>
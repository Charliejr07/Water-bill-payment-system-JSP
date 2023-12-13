<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
			<center>
				<div class="tit">
					<h4 class="titTxt">
						<span>Customer Feedback</span>
					</h4>

				</div>
			</center>
			<h3>Please fill all the texts in the fields.</h3>
			<%
				String feedback = (String) session.getAttribute("feedback");
				if (feedback != null) {
					session.removeAttribute("feedback");
			%>
			<div class="alert alert-success" id="success">
				<strong><%=feedback%></strong>
			</div>
			<%
				}
			%>
			<form action="Feedback" method="post">
				<div class="inputBox">
					<label for="name">Your Name :</label> <input id="name" type="text"
						name="name" placeholder=" Your Full Name">
				</div>
				<div class="inputBox">
					<label for="email">Your Email :</label> <input id="email"
						type="text" name="email" placeholder="Your Email Id">
				</div>
				<div class="inputBox">
					<label for="sub">Mobile No :</label> <input id="sub" type="text"
						name="mobile" placeholder="Mobile No">
				</div>
				<div class="inputBox">
					<label for="msg">Feedback/Complaint :</label>
					<textarea id="msg" rows="4" placeholder="Your Feedback to us"
						name="feedback"></textarea>
				</div>
				<div class="inputBox">
					<input type="submit" value="Submit">
				</div>
			</form>
		</div>
		<!-- </section> -->
	</div>
	<script type="text/javascript">
		$(function() {
			$('#success').delay(3000).show().fadeOut('slow');
		});
	</script>
</body>
</html>

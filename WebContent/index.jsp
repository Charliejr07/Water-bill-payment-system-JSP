<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<title>Water System</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
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
		<!-- navbar -->
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
							<li class="nav-item"><a class="nav-link" href="#contact">Contact
									Us</a></li>
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
		<!-- header -->

		<!-- hero section -->
		<div class="hero-section">
			<div class="container">
				<div class="content">
					<h1>Water Billing System</h1>
					<span class="mb"></span>
					<p>It mainly focuses on the calculation of units consumed
						during the specified time and the money to be paid to Water
						offices.</p>
					<!-- btn-box -->
				</div>
			</div>
			<!-- contianer -->
		</div>
		<!-- simple section -->

		<section class="simple-section">
			<div class="container">
				<div class="content">
					<h2>Water Billing System</h2>
					<p>Electronic billing or electronic bill payment and
						presentment, is when a seller such as company, organization, or
						group sends its bills or invoices over the internet, and customers
						pay the bills electronically.</p>
				</div>
				<!-- content -->
			</div>
			<!-- container -->
		</section>
		<!-- simple section -->

		<!-- services-section -->

		<section class="services-section" id="serv">
			<div class="container">
				<div class="iteam">
					<div class="row">
						<div class="col-sm-6 col-12 col-md-4">
							<div class="card">
								<div class="icon-box">
									<i class="fas fa-mobile-alt"></i>
								</div>
								<!-- icon -box -->
								<p>There are a number of advantages to electronic billing
									that include the faster presentation of invoices and reductions
									in costs in handling paper document.</p>
							</div>
							<!-- card -->
						</div>
						<!-- col -->
						<div class="col-sm-6 col-12 col-md-4">
							<div class="card">
								<div class="icon-box">
									<i class="fas fa-paper-plane"></i>
								</div>
								<!-- icon -box -->
								<p>However to take full advantage of electronic billing both
									seller and buyer need to have in place computer systems able to
									handle electronic billing and have access to financial
									institutions that can do electronic payments.</p>
							</div>
							<!-- card -->
						</div>
						<!-- col -->
						<div class="col-sm-6 col-12 col-md-4">
							<div class="card">
								<div class="icon-box">
									<i class="fas fa-bullhorn"></i>
								</div>
								<!-- icon-box -->
								<p>Electronic billing systems are computer systems that
									assist with generating and delivering invoices and accepting
									customer payments.</p>
							</div>
							<!-- card -->
						</div>
						<!-- col -->
					</div>
					<!-- row -->
				</div>
				<!-- iteam -->
			</div>
			<!-- contianer -->
		</section>
		<!-- services section -->
		<!-- contact-section -->
		<section class="contact-section" id="contact">
			<div class="container">
				<div class="content">
					<h3>Stay with us</h3>
					<p>We ensure quality &amp; support</p>
				</div>
				<%
					String help = (String) session.getAttribute("message");
					if (help != null) {
						session.removeAttribute("message");
				%>
				<div class="alert alert-info" id="info">
					<strong><%=help%></strong>
				</div>
				<%
					}
				%>
				<!-- content -->
				<div class="form-box">
					<form action="ContactUs" method="post">
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<input type="text" class="form-control" name="name"
										placeholder="Full name"
										style="border-color: white; font-weight: bold; color: black; background-color: white;">
								</div>
								<!-- form-grp -->
							</div>
							<!-- col -->
						</div>
						<!-- row -->
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<input type="email" class="form-control" name="email"
										placeholder="Email"
										style="border-color: white; font-weight: bold; color: black; background-color: white;">
								</div>
								<!-- form-grp -->
							</div>
							<!-- col -->
						</div>
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<input type="text" class="form-control" name="mobile"
										placeholder="Mobile No"
										style="border-color: white; font-weight: bold; color: black; background-color: white;">
								</div>
								<!-- form-grp -->
							</div>
							<!-- col -->
						</div>
						<!-- row -->
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<textarea id="" cols="30" rows="10" class="form-control"
										name="message" placeholder="Message"
										style="border-color: white; color: black; background-color: white;"></textarea>
								</div>
								<!-- form-grp -->
							</div>
							<!-- col -->
						</div>
						<!-- row -->
						<div class="row mt-2">
							<div class="col-6"></div>
							<!-- col -->
							<div class="col-6 a">
								<input type="submit" value="Send" class="btn btn-contact">
							</div>
							<!-- col -->
						</div>
						<!-- row -->
					</form>
				</div>
				<!-- form-box -->
			</div>
			<!-- contianer -->
		</section>
		<!-- contact-section -->

		<footer id="about">
			<div class="container">
				<div class="row">
					<div class="col-12 col-sm-6 col-md-6 align-self-center">
						<span>Copyritht 2021 ></span>
					</div>
					<div class="col-12 col-sm-6 col-md-6 text-center">
						<ul>
							<li><a href=""><i class="fab fa-facebook-f"></i></a></li>
							<li><a href=""><i class="fab fa-twitter"></i></a></li>
							<li><a href=""><i class="fab fa-google-plus-g"></i></a></li>
							<li><a href=""><i class="fab fa-linkedin"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
		<div class="scroll">
			<i class="fas fa-angle-up"></i>
		</div>
	</div>
	<!-- warp -->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"
		integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="Resources/js/main.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#info').delay(3000).show().fadeOut('slow');
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-btn">
			<button type="button" class="btn-toggle-fullwidth">
				<i class="lnr lnr-arrow-left-circle"></i>
			</button>
		</div>
		<div class="brand">
			<a href="admin-dashboard.jsp">Water Billing System</a>
		</div>
		<div id="navbar-menu">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><img src="assets/img/user.png"
						class="img-circle" alt="Avatar"> <span><%=session.getAttribute("uname")%></span>
						<i class="icon-submenu lnr lnr-chevron-down"></i></a>
					<ul class="dropdown-menu">
						<li><a href="admin-profile.jsp"><i class="lnr lnr-user"></i>
								<span>My Profile</span></a></li>
						<li><a href="admin-change-password.jsp"><i
								class="lnr lnr-cog"></i> <span>Settings</span></a></li>
						<li><a href="logout.jsp"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>
<div id="sidebar-nav" class="sidebar">
	<div class="sidebar-scroll">
		<nav>
			<ul class="nav">
				<li><a href="admin-dashboard.jsp" class="active"><i
						class="lnr lnr-home"></i> <span>Dashboard</span></a></li>
				<li><a href="#subPages" data-toggle="collapse"
					class="collapsed"><i class="lnr lnr-pencil"></i> <span>Customers</span>
						<i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages" class="collapse ">
						<ul class="nav">
							<li><a href="new-water-connection.jsp" class="">New
									Water Connection</a></li>
							<li><a href="view-water-connections.jsp" class="">View
									Water Connections</a></li>
						</ul>
					</div></li>
				<li><a href="check-customer-meter-readings.jsp" class=""><i
						class="lnr lnr-thumbs-up"></i> <span>Check Meter Reading</span></a></li>
				<li><a href="customers-billing-list.jsp" class=""><i
						class="lnr lnr-inbox"></i> <span>Customers Billing List</span></a></li>
				<li><a href="view-customers-reports.jsp" class=""><i
						class="lnr lnr-cog"></i> <span>Customers Reports</span></a></li>
				<li><a href="monthly-billing-reports.jsp" class=""><i
						class="lnr lnr-dice"></i> <span>Billing Monthly Report</span></a></li>

				<li><a href="view-contacts.jsp" class=""><i
						class="lnr lnr-dice"></i> <span>View Contacts</span></a></li>
				<li><a href="view-feedback-comments.jsp" class=""><i
						class="lnr lnr-pencil"></i> <span>Feedback Or Comments</span></a></li>
				<li><a href="logout.jsp" class=""><i class="lnr lnr-user"></i>
						<span>Logout</span></a></li>
			</ul>
		</nav>
	</div>
</div>
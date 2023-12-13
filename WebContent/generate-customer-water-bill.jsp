<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
	<div id="wrapper">
		<jsp:include page="admin-header.jsp"></jsp:include>
		<div class="main">
			<%
				String waterNo = request.getParameter("waterNo");
					System.out.println("Water No " + waterNo);
					double initialMeterReading = Double.parseDouble(request.getParameter("initialMeterReading"));
					double finalMeterReading = Double.parseDouble(request.getParameter("finalMeterReading"));
					double totalUnit = finalMeterReading - initialMeterReading;
					String firstName = null;
					String middleName = null;
					String surName = null;
					String fullName = null;
					String atPost = null;
					int plotNo = 0;
					String taluka = null;
					String district = null;
					int pincode = 0;
					String state = null;
					String customerNo = null;
					String area = "";
					int freeUnit = 0;
					double serviceTax = 0.0;
					double monthfixedCharge = 0.0;
					int billNo = 0;
					double netUnits = 0.0;
					double meteredcharge = 0.0;
					double totalbill = 0.0;

					if (finalMeterReading - initialMeterReading >= 0) {
						try {
							ResultSet resultset = DatabaseConnection
									.getResultFromSqlQuery("select * from tblcustomer where waterno='" + waterNo + "'");
							while (resultset.next()) {
								firstName = resultset.getString("firstname");
								middleName = resultset.getString("parentname");
								surName = resultset.getString("surname");
								fullName = firstName + " " + middleName + " " + surName;
								atPost = resultset.getString("atpost");
								plotNo = Integer.parseInt(resultset.getString("plotno"));
								taluka = resultset.getString("taluka");
								district = resultset.getString("dist");
								pincode = Integer.parseInt(resultset.getString("pincode"));
								state = resultset.getString("state");
								customerNo = resultset.getString("custumno");
								area = resultset.getString("area");
								billNo = billNo + 1;
							}

							int data = DatabaseConnection
									.insertUpdateFromSqlQuery("update tblcustomer set initialmeterReading='"
											+ finalMeterReading + "' where waterno ='" + waterNo + "'");

							if (area.equals("Rural")) {
								freeUnit = 30;
								monthfixedCharge = 125.00;

								netUnits = (finalMeterReading - initialMeterReading) - freeUnit;

								if (netUnits >= 0) {
									meteredcharge = netUnits * 6.0;
								} else {
									netUnits = 0.0;
								}

								serviceTax = (meteredcharge * 8 / 100) + 5.0;
								totalbill = monthfixedCharge + meteredcharge + serviceTax;

							} else {
								freeUnit = 15;
								monthfixedCharge = 175.00;

								netUnits = (finalMeterReading - initialMeterReading) - freeUnit;

								if (netUnits >= 0) {
									meteredcharge = netUnits * 9.0;
								} else {
									netUnits = 0.0;

								}
								serviceTax = (meteredcharge * 10 / 100) + 8.0;
								totalbill = monthfixedCharge + meteredcharge + serviceTax;

							}
						} catch (Exception e) {
							e.printStackTrace();
						}
			%>
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">Final Water Bill</h3>
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<form action="CustomerBillingInformation" method="post">
									<div class="panel-body">
										<table class="table table-bordered">
											<tbody>
												<tr>
													<th colspan="12"><font color="blue">Customer
															Information</font></th>
												</tr>
												<tr>
													<th colspan="1">Water No</th>
													<td colspan="3"><input type="text" name="waterNo"
														class="form-control" value="<%=waterNo%>"></td>
													<th colspan="1">Customer No</th>
													<td colspan="3"><input type="text" name="customerNo"
														class="form-control" value="<%=customerNo%>"></td>
													<th colspan="1">Bill No</th>
													<td colspan="3"><input type="text" name="billNo"
														class="form-control" value="<%=billNo%>"></td>
												</tr>
												<tr>
													<th>Customer Name</th>
													<td colspan="12"><input type="text" name="fullName"
														class="form-control" value="<%=fullName%>"></td>
												</tr>
												<tr>
													<th colspan="12"><font color="blue">Address</font></th>
												</tr>
												<tr>
													<th colspan="1">At-Post</th>
													<td colspan="3"><input type="text" name="atPost"
														class="form-control" value="<%=atPost%>"></td>

													<th colspan="1">Plot No</th>
													<td colspan="1"><input type="text" name="plotNo"
														class="form-control" value="<%=plotNo%>"></td>

													<th colspan="1">Area</th>
													<td colspan="3"><input type="text" name="area"
														class="form-control" value="<%=area%>"></td>

													<th colspan="1">Taluka</th>
													<td colspan="3"><input type="text" name="taluka"
														class="form-control" value="<%=taluka%>"></td>
												</tr>
												<tr>
													<th colspan="1">District</th>
													<td colspan="3"><input type="text" name="district"
														class="form-control" value="<%=district%>"></td>

													<th colspan="1">State</th>
													<td colspan="3"><input type="text" name="state"
														class="form-control" value="<%=state%>"></td>

													<th colspan="1">Pincode</th>
													<td colspan="3"><input type="text" name="pincode"
														class="form-control" value="<%=pincode%>"></td>
												</tr>
												<tr>
													<th colspan="12"><font color="blue">Meter
															Reading's</font></th>
												</tr>
												<tr>
													<th colspan="1">Opening Reading</th>
													<td colspan="5"><input type="text"
														name="initialMeterReading" class="form-control"
														value="<%=initialMeterReading%>"></td>
													<th colspan="1">Closed Reading</th>
													<td colspan="5"><input type="text"
														name="finalMeterReading" class="form-control"
														value="<%=finalMeterReading%>"></td>
												</tr>
												<tr>
													<th colspan="12"><font color="blue">Call's</font></th>
												</tr>
												<tr>
													<th colspan="1">Total Unit</th>
													<td colspan="3"><input type="text" name="totalUnits"
														class="form-control" value="<%=totalUnit%>"></td>

													<th colspan="1">Free Unit</th>
													<td colspan="3"><input type="text" name="freeUnits"
														class="form-control" value="<%=freeUnit%>"></td>

													<th colspan="1">Net Chargeable Unit</th>
													<td colspan="3"><input type="text" name="netUnits"
														class="form-control" value="<%=netUnits%>"></td>
												</tr>
												<tr>
													<th colspan="12"><font color="blue">Bill
															Calculation</font></th>
												</tr>
												<tr>
													<th colspan="1">Fixed Monthly Charges</th>
													<td colspan="2"><input type="text"
														name="monthfixedCharge" class="form-control"
														value="<%=monthfixedCharge%>"></td>
													<th colspan="1">Meter Charges</th>
													<td colspan="2"><input type="text"
														name="meteredcharge" class="form-control"
														value="<%=meteredcharge%>"></td>
													<th colspan="1">Service Tax</th>
													<td colspan="2"><input type="text" name="serviceTax"
														class="form-control" value="<%=serviceTax%>"></td>
													<th colspan="1">Total Bill</th>
													<td colspan="2"><input type="text" name="totalbill"
														class="form-control" value="<%=totalbill%>"></td>
												</tr>
												<tr>
													<td colspan="6"><input type="submit"
														class="btn btn-primary" value="Save Bill">&nbsp;&nbsp;</td>
													<td colspan="6"><a titlt="print screen"
														alt="print screen" onclick="window.print();"
														target="_blank" style="cursor: pointer;"><center>
																<img src="images/print.png">
															</center></a></td>
												</tr>
											</tbody>
										</table>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="admin-footer.jsp"></jsp:include>
			</div>
			<%
				} else {
						String message = "Final meter reading should be greater than initial meter reading";
						session.setAttribute("meter-reading", message);
						response.sendRedirect("check-customer-meter-reading.jsp");
					}
			%>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
	<script>
		function CallPrint(strid) {
			var prtContent = document.getElementById("example");
			var WinPrint = window
					.open('', '',
							'left=0,top=0,width=800,height=800,toolbar=0,scrollbars=0,status=0');
			WinPrint.document.write(prtContent.innerHTML);
			WinPrint.document.close();
			WinPrint.focus();
			WinPrint.print();
			WinPrint.close();
		}
	</script>
	<%
		} else {
			response.sendRedirect("admin-login.jsp");
		}
	%>
</body>
</html>

package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class CustomerBillingInformation
 */
@SuppressWarnings("serial")
@WebServlet("/CustomerBillingInformation")
public class CustomerBillingInformation extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = 0;
		String waterNo = request.getParameter("waterNo");
		String customerNo = request.getParameter("customerNo");
		String billNo = request.getParameter("billNo");
		int billno = Integer.parseInt(billNo) + 1;
		String fullName = request.getParameter("fullName");
		String atPost = request.getParameter("atPost");
		String plotNo = request.getParameter("plotNo");
		String area = request.getParameter("area");
		String taluka = request.getParameter("taluka");
		String district = request.getParameter("district");
		String state = request.getParameter("state");
		String pincode = request.getParameter("pincode");
		String initialMeterReading = request.getParameter("initialMeterReading");
		String finalMeterReading = request.getParameter("finalMeterReading");
		String totalUnits = request.getParameter("totalUnits");
		System.out.println("Total Units " + totalUnits);
		String freeUnit = request.getParameter("freeUnits");
		System.out.println("Free Units " + freeUnit);
		String netUnits = request.getParameter("netUnits");
		System.out.println("Net Units " + netUnits);
		String monthfixedCharge = request.getParameter("monthfixedCharge");
		String meteredcharge = request.getParameter("meteredcharge");
		String serviceTax = request.getParameter("serviceTax");
		String totalbill = request.getParameter("totalbill");

		try {
			int billing = DatabaseConnection.insertUpdateFromSqlQuery(
					"insert into tblcustomersbillingrecords(id,waterno,custumno,billno,customer_name,atpost,plotno,taluka,dist,state,pincode,area,initialMeterReading,finalMeterReading,totalUnit,freeUnit,netChargeableUnit,fixedMonthlyCharges,meterCharges,serviceTax,totalBill,system_date) values('"
							+ id + "','" + waterNo + "','" + customerNo + "','" + billno + "','" + fullName + "','"
							+ atPost + "','" + plotNo + "','" + taluka + "','" + district + "','" + state + "','"
							+ pincode + "','" + area + "','" + initialMeterReading + "','" + finalMeterReading + "','"
							+ totalUnits + "','" + freeUnit + "','" + netUnits + "','" + monthfixedCharge + "','"
							+ meteredcharge + "','" + serviceTax + "','" + totalbill + "',SYSDATE())");
			if (billing > 0) {
				response.sendRedirect("check-customer-meter-readings.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

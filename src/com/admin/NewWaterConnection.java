package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class NewWaterConnection
 */
@SuppressWarnings("serial")
@WebServlet("/NewWaterConnection")

public class NewWaterConnection extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = 0;
		int initialMeterReading = 0;
		int billNo = 0;
		String firstname = request.getParameter("firstname");
		String middilename = request.getParameter("middilename");
		String lastname = request.getParameter("lastname");
		String atpost = request.getParameter("atpost");
		int plotno = Integer.parseInt(request.getParameter("plotno"));
		String taluka = request.getParameter("taluka");
		String district = request.getParameter("district");
		int pincode = Integer.parseInt(request.getParameter("pincode"));
		String state = request.getParameter("state");
		String area = request.getParameter("area");
		String customerNo = request.getParameter("customerNo");
		String waterNo = request.getParameter("waterNo");
		HttpSession hs = request.getSession();
		int newTelephoneConnection = DatabaseConnection.insertUpdateFromSqlQuery(
				"insert into tblcustomer(id,firstname,parentname,surname,atpost,plotno,taluka,dist,pincode,state,area,waterno,initialmeterReading,custumno,billno) values('"
						+ id + "','" + firstname + "','" + middilename + "','" + lastname + "','" + atpost + "','"
						+ plotno + "','" + taluka + "','" + district + "','" + pincode + "','" + state + "','" + area
						+ "','" + waterNo + "','" + initialMeterReading + "','" + customerNo + "','" + billNo + 1
						+ "')");
		if (newTelephoneConnection > 0) {
			String message = "Customer water account created successfully.";
			hs.setAttribute("success", message);
			response.sendRedirect("new-water-connection.jsp");
		}

	}
}

package com.feedback;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class Feedback
 */
@SuppressWarnings("serial")
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = 0;
		HttpSession hs = request.getSession();
		String name = request.getParameter("name");
		System.out.println("Name " + name);
		String email = request.getParameter("email");
		System.out.println("email " + email);
		String mobile = request.getParameter("mobile");
		System.out.println("mobile " + mobile);
		String feedback = request.getParameter("feedback");
		System.out.println("feedback " + feedback);
		try {
			int help = DatabaseConnection
					.insertUpdateFromSqlQuery("insert into tblfeedback(contact_id,name,email,mobile,feedback)values('"
							+ id + "','" + name + "','" + email + "','" + mobile + "','" + feedback + "')");
			if (help > 0) {
				String message = "Thanks for giving feedback to us! We will get in touch with you.";
				hs.setAttribute("feedback", message);
				response.sendRedirect("feedback-or-comments.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

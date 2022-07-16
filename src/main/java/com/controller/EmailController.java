package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dto.EmailDTO;
import com.dto.UserDTO;
import com.service.EmailService;
import com.service.UserService;

/**
 * Servlet implementation class EmailController
 */
public class EmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmailService emailService = new EmailService();
	UserService userService = new UserService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmailController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date date = new Date();
		String ctime = formatter.format(date);

		if (request.getParameter("reciever").isEmpty() || request.getParameter("subject").isEmpty()
				|| request.getParameter("message").isEmpty()) {
			UserDTO userEmail = (UserDTO) request.getSession().getAttribute("email");
			EmailService emailService = new EmailService();

			String sender = userEmail.getEmail();
			String reciever = request.getParameter("reciever");
			String subject = request.getParameter("subject");
			String message = request.getParameter("message");
			String time = ctime;
//			String status = "SENT";

			EmailDTO email = new EmailDTO();
			email.setSender(sender);
			email.setReciever(reciever);
			email.setSubject(subject);
			email.setMessage(message);
			email.setCurrentTime(time);
//			email.setStatus(status);
			try {
				String status = "DRAFT";
				email.setStatus(status);
				EmailDTO emailDTO = emailService.getMailsById(reciever);
				request.getSession().setAttribute("emailDTO", emailDTO);

				emailService.sendEmail(email);
				
				request.setAttribute("success", "Email save as a draft..!");
				RequestDispatcher rd = request.getRequestDispatcher("compose.jsp");
				rd.include(request, response);

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else {
			UserDTO userEmail = (UserDTO) request.getSession().getAttribute("email");
			EmailService emailService = new EmailService();

			String sender = userEmail.getEmail();
			String reciever = request.getParameter("reciever");
			String subject = request.getParameter("subject");
			String message = request.getParameter("message");
			String status = "SENT";
			String time = ctime;

			EmailDTO email = new EmailDTO();
			email.setSender(sender);
			email.setReciever(reciever);
			email.setSubject(subject);
			email.setMessage(message);
			email.setStatus(status);
			email.setCurrentTime(time);
			try {
				EmailDTO emailDTO = emailService.getMailsById(reciever);
				request.getSession().setAttribute("emailDTO", emailDTO);
				emailService.sendEmail(email);
				
				request.setAttribute("success", "Email sent successfully..!");
				RequestDispatcher rd = request.getRequestDispatcher("compose.jsp");
				rd.include(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		 
//		RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
//		dispatcher.forward(request, response);

	}

}

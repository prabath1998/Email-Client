package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dto.EmailDTO;
import com.dto.UserDTO;
import com.service.EmailService;

public class ViewMailContaroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ViewMailContaroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("view") != null) {
			System.out.println("view is checked");
			
			int emailId = Integer.parseInt(request.getParameter("view"));
			System.out.println(emailId);
			
//			EmailService emailService = new EmailService();
//			
//			EmailDTO email_id = emailService.getById(emailId);
			
			request.getSession().setAttribute("email_id", emailId);
			response.sendRedirect("view_mail.jsp");
			
//			RequestDispatcher dispatcher = request.getRequestDispatcher("view_mail.jsp");
//			dispatcher.forward(request, response);
		}
		
		
		
	}

}

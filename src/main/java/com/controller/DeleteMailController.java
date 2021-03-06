package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.EmailDTO;
import com.dto.UserDTO;
import com.service.EmailService;
import com.util.JDBCUtil;

/**
 * Servlet implementation class DeleteMailController
 */
public class DeleteMailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("delete") != null) {
			System.out.println("delete is checked");
			EmailService emailService = new EmailService();
			EmailDTO emailDTO = new EmailDTO();
			UserDTO userEmail = (UserDTO) request.getSession().getAttribute("email");
			int emailId = 0;
			int eid = 0;

			eid = Integer.parseInt(request.getParameter("delete"));
//			System.out.println(eid);
			try {
				emailService.deleteEmail(eid);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}			
			request.setAttribute("success", "Email deleted successfully..!");
			RequestDispatcher rd = request.getRequestDispatcher("trash.jsp");
			rd.include(request, response);
		}
//		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("trash.jsp");
//		dispatcher.forward(request, response);
		
	}

}

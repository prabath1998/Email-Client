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
 * Servlet implementation class TrashMailController
 */
public class TrashMailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TrashMailController() {
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
//		System.out.println("trash checked");

		if (request.getParameter("trash") != null) {
			System.out.println("trash is checked");
			EmailService emailService = new EmailService();
			EmailDTO emailDTO = new EmailDTO();
			UserDTO userEmail = (UserDTO) request.getSession().getAttribute("email");
			
			
			int eid = 0;

			eid = Integer.parseInt(request.getParameter("trash"));
			System.out.println(eid);
			try {
				emailService.updateStatus(eid);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}

//			try {
//				Connection connection = null;
//				PreparedStatement preStat = null;
//
//				String getAll = "SELECT * FROM emails";
//				connection = JDBCUtil.getConnection();
//				preStat = connection.prepareStatement(getAll);
//				ResultSet rs = preStat.executeQuery();
//
//				while (rs.next()) {
//
//					emailDTO.setEmail_id(rs.getInt("email_id"));
//					emailId = rs.getInt("email_id");
//
//				}
//				emailService.updateStatus(emailId);
//
//			} catch (Exception e) {
//
//			}
		}
		
		
		

		RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
		dispatcher.forward(request, response);
	}

}

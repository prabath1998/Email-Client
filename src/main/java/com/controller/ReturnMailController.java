package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.dto.EmailDTO;
import com.dto.UserDTO;
import com.service.EmailService;

/**
 * Servlet implementation class ReturnMailController
 */
public class ReturnMailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnMailController() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		if (request.getParameter("restore") != null) {
			System.out.println("restore is checked");
			EmailService emailService = new EmailService();
			EmailDTO emailDTO = new EmailDTO();
			UserDTO userEmail = (UserDTO) request.getSession().getAttribute("email");		
			
			int eid = 0;

			eid = Integer.parseInt(request.getParameter("restore"));
			System.out.println(eid);
			try {
				emailService.updateStatusToDraft(eid);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}		
		}		

		RequestDispatcher dispatcher = request.getRequestDispatcher("trash.jsp");
		dispatcher.forward(request, response);
	}

}

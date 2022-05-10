package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.dto.UserDTO;
import com.service.UserService;


public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService = new UserService();
    
    public RegisterController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Do Post..!");
		
		String fullName = request.getParameter("fullName");
		String gender = request.getParameter("gender");
		String contactno = request.getParameter("contact");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDTO user = new UserDTO();
		user.setFullName(fullName);
		user.setGender(gender);
		user.setContactNo(contactno);
		user.setEmail(email);
		user.setPassword(password);
		
		try {
			userService.registerUser(user);
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

}

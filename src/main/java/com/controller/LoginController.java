package com.controller;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

import com.dto.UserDTO;
import com.service.UserService;



public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginController() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username =  request.getParameter("email");
		String password =  request.getParameter("password");
		
		UserDTO user = new UserDTO();
		user.setEmail(username);
		user.setPassword(password);
		
		UserService userService = new UserService();
		if (userService.validate(user)) {
			UserDTO email = userService.getId(username);
			request.getSession().setAttribute("email", email);
			response.sendRedirect("home.jsp");
		}else {
			response.sendRedirect("login.jsp");
			
		}  
	}

}

package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.websocket.Session;

import java.io.IOException;
import java.io.PrintWriter;

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
		 PrintWriter out = response.getWriter();
		
		UserDTO user = new UserDTO();
		user.setEmail(username);
		user.setPassword(password);
		
		UserService userService = new UserService();
		
		
		
		if (userService.validate(user)) {			
			UserDTO email = userService.getId(username);
			request.getSession().setAttribute("email", email);
			response.sendRedirect("home.jsp");
		}else {
			
			request.setAttribute("error", "Invalid login credentials");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.include(request, response);			
		}  	
		
	}

}

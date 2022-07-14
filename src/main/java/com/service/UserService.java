package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.UserDTO;
import com.util.JDBCUtil;

public class UserService {
	public int registerUser(UserDTO user) throws SQLException{
		Connection connection = null;
		PreparedStatement preStat = null;
		
		String insertSQL = "INSERT INTO users(fullname,gender,contact_no,email,password)VALUES(?,?,?,?,?)";
		int result = 0;
		
		try {
			connection = JDBCUtil.getConnection();
			preStat = connection.prepareStatement(insertSQL);
			preStat.setString(1, user.getFullName());
			preStat.setString(2, user.getGender());
			preStat.setString(3, user.getContactNo());
			preStat.setString(4, user.getEmail());
			preStat.setString(5, user.getPassword());
			
			System.out.println(preStat);
			
			result = preStat.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return result;
	}
	
	public UserDTO getId(String email) {
		Connection connection = null;
		PreparedStatement preStat = null;
		ResultSet rs = null;
	
		String selectQuery = "SELECT email from users where email= ?";
		UserDTO user = new UserDTO();
		
		try {
			connection = JDBCUtil.getConnection();
			preStat = connection.prepareStatement(selectQuery);
			preStat.setString(1, email);			
			System.out.println(preStat);			
			rs = preStat.executeQuery();
			while(rs.next()) {
				user.setEmail(rs.getString("email"));
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return user;
	}	
	
	public boolean validate(UserDTO user) {
		Connection connection = null;
		PreparedStatement preStat = null;
		ResultSet rs = null;
		boolean status = false;
		connection = JDBCUtil.getConnection();
		
		String selectSQL = "SELECT email,password FROM users WHERE email = ? and password = ?";
		try {
			preStat = connection.prepareStatement(selectSQL);
			preStat.setString(1, user.getEmail());
			preStat.setString(2, user.getPassword());
			rs = preStat.executeQuery();
			status = rs.next();
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		return status;
	}
	
	
	
	

}

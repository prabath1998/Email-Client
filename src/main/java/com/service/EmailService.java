package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.EmailDTO;
import com.dto.UserDTO;
import com.util.JDBCUtil;

public class EmailService {
	public int sendEmail(EmailDTO email) throws SQLException {
		Connection connection = null;
		PreparedStatement preStat = null;

		String insertSQL = "INSERT INTO emails(sender,reciever,subject,message,status,time)VALUES(?,?,?,?,?,?)";
		int result = 0;

		try {
			connection = JDBCUtil.getConnection();
			preStat = connection.prepareStatement(insertSQL);
			preStat.setString(1, email.getSender());
			preStat.setString(2, email.getReciever());
			preStat.setString(3, email.getSubject());
			preStat.setString(4, email.getMessage());
			preStat.setString(5, email.getStatus());
			preStat.setString(6, email.getCurrentTime());

			System.out.println(preStat);

			result = preStat.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return result;
	}	

	public static void updateStatus(int email) throws SQLException {
		Connection connection = null;
		PreparedStatement preStat = null;

		String updateSQL = "UPDATE emails SET status = 'TRASH' where email_id = ?";
		int result = 0;

		try {
			connection = JDBCUtil.getConnection();
			preStat = connection.prepareStatement(updateSQL);
//			preStat.setString(1, email.getStatus());
			preStat.setInt(1, email);

			System.out.println(preStat);

			result = preStat.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

	}	
	
	public static void updateStatusToDraft(int email) throws SQLException {
		Connection connection = null;
		PreparedStatement preStat = null;

		String updateSQL = "UPDATE emails SET status = 'DRAFT' where email_id = ?";
		int result = 0;

		try {
			connection = JDBCUtil.getConnection();
			preStat = connection.prepareStatement(updateSQL);
//			preStat.setString(1, email.getStatus());
			preStat.setInt(1, email);

			System.out.println(preStat);

			result = preStat.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

	}	

	public EmailDTO getMailsById(String email) {
		Connection connection = null;
		PreparedStatement preStat = null;
		ResultSet rs = null;

		String selectQuery = "SELECT * from emails where reciever= ?";
		EmailDTO emailDTO = new EmailDTO();

		try {
			connection = JDBCUtil.getConnection();
			preStat = connection.prepareStatement(selectQuery);
			preStat.setString(1, email);
			System.out.println(preStat);
			rs = preStat.executeQuery();
			System.out.println(rs);
			while (rs.next()) {
				emailDTO.setReciever(rs.getString("reciever"));
				emailDTO.setSender(rs.getString("sender"));
				emailDTO.setSubject(rs.getString("subject"));
				emailDTO.setMessage(rs.getString("message"));
				emailDTO.setStatus(rs.getString("status"));
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return emailDTO;
	}
	
	public EmailDTO getAllMails() {
		Connection connection = null;
		PreparedStatement preStat = null;
		ResultSet rs = null;

		String selectQuery = "SELECT * from emails";
		EmailDTO emailDTO = new EmailDTO();

		try {
			connection = JDBCUtil.getConnection();
			preStat = connection.prepareStatement(selectQuery);
			
			System.out.println(preStat);
			rs = preStat.executeQuery();
			System.out.println(rs);
			while (rs.next()) {
				emailDTO.setEmail_id(rs.getInt("email_id"));
				emailDTO.setReciever(rs.getString("reciever"));
				emailDTO.setSender(rs.getString("sender"));
				emailDTO.setSubject(rs.getString("subject"));
				emailDTO.setMessage(rs.getString("message"));
				emailDTO.setStatus(rs.getString("status"));
				emailDTO.setCurrentTime(rs.getString("time"));
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return emailDTO;
	}
	
	public static void deleteEmail(int emailId)throws SQLException {
		Connection connection = null;
		PreparedStatement preStat = null;
		
		try {
			String deleteSQL = "DELETE FROM emails where email_id = ?";
			connection = JDBCUtil.getConnection();
			preStat = connection.prepareStatement(deleteSQL);
			preStat.setLong(1, emailId);
			System.out.println(preStat);
			int returnValue = preStat.executeUpdate();
			System.out.println("Return of SQL - " + returnValue);
		} catch (Exception e) {
			System.out.println("Delete failed - " + e.getMessage());
		}finally {
			preStat.close();
			connection.close();
		}
	}
	
	public EmailDTO getById(int email) {
		Connection connection = null;
		PreparedStatement preStat = null;
		ResultSet rs = null;

		String selectQuery = "SELECT * from emails where email_id= ?";
		EmailDTO emailDTO = new EmailDTO();

		try {
			connection = JDBCUtil.getConnection();
			preStat = connection.prepareStatement(selectQuery);
			preStat.setInt(1, email);
			System.out.println(preStat);
			rs = preStat.executeQuery();
			System.out.println(rs);
			while (rs.next()) {
				emailDTO.setReciever(rs.getString("reciever"));
				emailDTO.setSender(rs.getString("sender"));
				emailDTO.setSubject(rs.getString("subject"));
				emailDTO.setMessage(rs.getString("message"));
				emailDTO.setStatus(rs.getString("status"));
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return emailDTO;
	}

}

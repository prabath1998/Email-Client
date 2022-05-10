package com.dto;

public class EmailDTO {
	private int email_id;
	private String reciever;
	private String sender;
	private String subject;
	private String message;
	private String status;
	
	public EmailDTO() {}

	public EmailDTO(int email_id, String reciever, String sender, String subject, String message, String status) {
		super();
		this.email_id = email_id;
		this.reciever = reciever;
		this.sender = sender;
		this.subject = subject;
		this.message = message;
		this.status = status;
	}
	
	

	public int getEmail_id() {
		return email_id;
	}

	public void setEmail_id(int email_id) {
		this.email_id = email_id;
	}

	public String getReciever() {
		return reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	

}

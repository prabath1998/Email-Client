package com.dto;

public class UserDTO {
	private String fullName;
	private String gender;
	private String contactNo;
	private String email;
	private String password;
	
	
	public UserDTO() {}
	
	public UserDTO(String fullName, String gender, String contactNo, String email, String password) {
		super();
		this.fullName = fullName;
		this.gender = gender;
		this.contactNo = contactNo;
		this.email = email;
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}

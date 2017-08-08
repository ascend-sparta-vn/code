package com.webtrucking.json.entity;

public class ChangePassRequest {

	private String password;
	private String newPassword;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public ChangePassRequest(String password, String newPassword) {
		super();
		this.password = password;
		this.newPassword = newPassword;
	}
	public ChangePassRequest() {
		super();
	}
	
	
}

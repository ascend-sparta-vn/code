package com.webtrucking.json.entity;

public class UserInfo {
	
	private Integer id;
	
	private String username;
	
	private String password;
	
	private boolean enabled;
	
	private String createdDate;
	
	private String lastSignInDate;
	
	private String listRole;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getLastSignInDate() {
		return lastSignInDate;
	}
	public void setLastSignInDate(String lastSignInDate) {
		this.lastSignInDate = lastSignInDate;
	}
	
	public String getListRole() {
		return listRole;
	}
	public void setListRole(String listRole) {
		this.listRole = listRole;
	}
	public UserInfo(String username, String password, boolean enabled,
			String createdDate, String lastSignInDate, String listRole, Integer id) {
		super();
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.createdDate = createdDate;
		this.lastSignInDate = lastSignInDate;
		this.listRole = listRole;
		this.id = id;
	}
	public UserInfo() {
		super();
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
}

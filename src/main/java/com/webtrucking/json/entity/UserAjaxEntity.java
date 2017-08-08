package com.webtrucking.json.entity;

public class UserAjaxEntity {
	
	private Integer userId;
	private String username;
	private String password;
	private String roleModal;
	private boolean enabled;
	
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
	public String getRoleModal() {
		return roleModal;
	}
	public void setRoleModal(String roleModal) {
		this.roleModal = roleModal;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	} 
	
}

package com.webtrucking.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "forgot_password")
public class ForgotPassword {

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 11)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "account_id", nullable = false)
	private int accountId;
	
	@Column(name = "email", nullable = false, length = 255)
	private String email;
	
	@Column(name = "reset_key", nullable = false, length = 1000)
	private String resetKey;
	
	@Column(name = "created_date")
	private Date createdDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getResetKey() {
		return resetKey;
	}

	public void setResetKey(String resetKey) {
		this.resetKey = resetKey;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public ForgotPassword(int id, int accountId, String email, String resetKey,
			Date createdDate) {
		super();
		this.id = id;
		this.accountId = accountId;
		this.email = email;
		this.resetKey = resetKey;
		this.createdDate = createdDate;
	}

	public ForgotPassword() {
		super();
	}
	
	
}

package com.webtrucking.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "api_configuration")
public class ApiConfiguration {

	@Id
	@Column(name = "api_id", unique = true, nullable = false, length = 11)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer apiID;

	@Column(name = "name", nullable = false, length = 255)
	private String name;

	@Column(name = "url", nullable = false, length = 255)
	private String url;

	@Column(name = "request")
	private String request;

	@Column(name = "response")
	private String response;

	@Column(name = "method")
	private String method;

	public Integer getApiID() {
		return apiID;
	}

	public void setApiID(Integer apiID) {
		this.apiID = apiID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}
}
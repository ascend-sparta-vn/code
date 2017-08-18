/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webtrucking.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;
import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author vuquocdat
 */
@Entity
@Table(name = "orders")
public class Order implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Basic(optional = false)
	@Column(name = "id")
	private Integer id;
	@Basic(optional = false)
	@Column(name = "status")
	private Integer status;
	// @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
	@Column(name = "total_amount")
	private BigDecimal totalAmount;
	@Column(name = "state")
	private Boolean state;
	@Basic(optional = false)
	@Column(name = "user_id")
	private int userId;
	@Column(name = "created_timestamp")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdTimestamp;
	@Column(name = "last_updated_timestamp")
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastUpdatedTimestamp;

	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "delivery_order",
			joinColumns = @JoinColumn(name = "order_id", referencedColumnName = "id"),
			inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"))
	private Set<User> delivers;

	@ManyToOne
	@JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false)
	private User user;

	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "order_item",
			joinColumns = @JoinColumn(name = "order_id", referencedColumnName = "id"),
			inverseJoinColumns = @JoinColumn(name = "product_id", referencedColumnName = "id"))
	private Set<Product> products;


	public Order() {
	}

	public Order(Integer id) {
		this.id = id;
	}

	public Order(Integer id, Integer status, int userId) {
		this.id = id;
		this.status = status;
		this.userId = userId;
	}

	public Set<User> getDelivers() {
		return delivers;
	}

	public void setDelivers(Set<User> delivers) {
		this.delivers = delivers;
	}
/**/
	public Integer getCurrentDeliverId() {
		if (this.delivers != null && !this.delivers.isEmpty()) {
			return this.delivers.iterator().next().getId();
		}
		return -1;
	}

	public String getCurrentDeliverName() {
		if (this.delivers != null && !this.delivers.isEmpty()) {
			return this.delivers.iterator().next().getUsername();
		}
		return "";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set<Product> getProducts() {

		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStatus() {
		return status;
	}

	public BigDecimal getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Boolean getState() {
		return state;
	}

	public void setState(Boolean state) {
		this.state = state;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getCreatedTimestamp() {
		return createdTimestamp;
	}

	public void setCreatedTimestamp(Date createdTimestamp) {
		this.createdTimestamp = createdTimestamp;
	}

	public Date getLastUpdatedTimestamp() {
		return lastUpdatedTimestamp;
	}

	public void setLastUpdatedTimestamp(Date lastUpdatedTimestamp) {
		this.lastUpdatedTimestamp = lastUpdatedTimestamp;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (id != null ? id.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		// TODO: Warning - this method won't work in the case the id fields are not set
		if (!(object instanceof Order)) {
			return false;
		}
		Order other = (Order) object;
		if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "javaapplication1.Order[ id=" + id + "," +  totalAmount  + " ]";
	}
}

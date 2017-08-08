package com.webtrucking.dao;

import org.springframework.data.repository.CrudRepository;

import com.webtrucking.entity.Account;
import com.webtrucking.entity.UserRole;

public interface UserRoleDAO extends CrudRepository<UserRole, Integer>{
	public UserRole findByUser(Account user);
}

package com.webtrucking.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.webtrucking.entity.Account;

public interface AccountDAO extends CrudRepository<Account, Integer>{
	public List<Account> findAccountByUsername(@Param("username") String username);
	public List<Account> findAccountByUsernameAndStatus(@Param("username") String username, @Param("status") Integer status);
	public List<Account> findAccountByKeyActive(@Param("keyActive") String keyActive);
	
}

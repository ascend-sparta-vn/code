package com.webtrucking.dao;

import com.webtrucking.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface userDAO extends CrudRepository<User, Integer>{
	public List<User> findAccountByUsername(@Param("username") String username);
	public List<User> findAccountByUsernameAndStatus(@Param("username") String username, @Param("status") Integer status);

	public List<User> findAllByUserType(@Param("userType") Integer userType);

}

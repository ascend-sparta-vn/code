package com.webtrucking.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import com.webtrucking.entity.ForgotPassword;

public interface ForgotPasswordDAO extends CrudRepository<ForgotPassword, Integer>{
	
	@Transactional
    void deleteByEmail(String email);
	
	List<ForgotPassword> findByEmail(String email);
}

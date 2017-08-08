package com.webtrucking.dao;

import org.springframework.data.repository.CrudRepository;

import com.webtrucking.entity.Message;

public interface MessageDAO extends CrudRepository<Message, Integer>{
	
}

package com.webtrucking.dao;

import org.springframework.data.repository.CrudRepository;

import com.webtrucking.entity.TruckType;

public interface TruckTypeDAO extends CrudRepository<TruckType, Integer>{
	
}

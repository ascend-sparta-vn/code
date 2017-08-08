package com.webtrucking.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.webtrucking.entity.StatisticShipment;

@Transactional
public interface StatisticShipmentDAO extends CrudRepository<StatisticShipment, Integer>{
	void deleteByObjectType(int type);
}

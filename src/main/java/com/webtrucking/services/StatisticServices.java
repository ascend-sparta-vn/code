package com.webtrucking.services;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.annotations.Synchronize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webtrucking.dao.StatisticShipmentDAO;
import com.webtrucking.dao.StatisticTruckingDAO;

@Service
public class StatisticServices {
	
	static Logger log = LogManager.getLogger(StatisticServices.class);
	
	@Autowired
	StatisticTruckingDAO statisticTruckingDAO;
	
	@Autowired
	StatisticShipmentDAO statisticShipmentDAO;
	
	@Transactional(rollbackFor = Exception.class)
	synchronized
	public void updateStatistic() {
		/*
		 * delete first
		 */
		statisticTruckingDAO.deleteAll();

	}
}

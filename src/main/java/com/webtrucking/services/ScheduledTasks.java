package com.webtrucking.services;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ScheduledTasks {

	static Logger log = Logger.getLogger(ScheduledTasks.class);
	@Autowired
	StatisticServices statisticServices;

    @Scheduled(fixedRate = 10000)
    public void updateStatistic() {
    	//delete from db
    	//statisticServices.updateStatistic();
    }
}

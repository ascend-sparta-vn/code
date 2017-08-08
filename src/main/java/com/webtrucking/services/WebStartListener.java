package com.webtrucking.services;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.webtrucking.util.CacheUtil;

@Component
public class WebStartListener implements ServletContextListener {
	static Logger log = Logger.getLogger(WebStartListener.class);
	
	@Override
    public void contextInitialized(ServletContextEvent event) {
        log.info("STARTING...");
        log.info("Cache init");
		CacheUtil cache = new CacheUtil();
		cache.init();
		log.info("FINISH...");
    }
    
	// Omitted for brevity
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}
}

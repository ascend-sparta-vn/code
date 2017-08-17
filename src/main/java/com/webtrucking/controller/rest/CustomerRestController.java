package com.webtrucking.controller.rest;

import com.webtrucking.dao.UserDAO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest_user")
public class CustomerRestController {
	static Logger log = Logger.getLogger(CustomerRestController.class);
	
	
	@Autowired
	private UserDAO userDAO;
	
}

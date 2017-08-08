package com.webtrucking.controller.rest;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.webtrucking.dao.AccountDAO;
import com.webtrucking.entity.Account;
import com.webtrucking.json.entity.UserInfo;

@RestController
@RequestMapping("/rest_user")
public class CustomerRestController {
	static Logger log = Logger.getLogger(CustomerRestController.class);
	
	
	@Autowired
	private AccountDAO accountDAO;
	
}

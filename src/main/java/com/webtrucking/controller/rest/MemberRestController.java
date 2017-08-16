package com.webtrucking.controller.rest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.webtrucking.dao.UserDAO;
import com.webtrucking.entity.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/member_rest")
public class MemberRestController {
	static Logger log = Logger.getLogger(MemberRestController.class);
	
	@Autowired
	private UserDAO userDAO;

	@RequestMapping("/check-account-exist")
	@ResponseBody
	public int checkAccountExist(@RequestParam(value="userName") String userName) throws JsonProcessingException {
		log.info("[Start] getMemberById");
		List<User> accounts = new ArrayList<User>();
		try {
			System.out.println(userName);
			accounts = userDAO.findAccountByUsername(userName);
		} catch (Exception e) {
			log.error("Error when load accounts:" + e.getMessage());
		}
		return accounts.size();
	}
}

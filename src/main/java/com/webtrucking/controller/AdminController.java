package com.webtrucking.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.webtrucking.dao.userDAO;
import com.webtrucking.entity.User;
import com.webtrucking.json.entity.UserInfo;
import com.webtrucking.services.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by sonph on 09/12/16.
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {
	static Logger log = Logger.getLogger(AdminController.class);
	
	@Autowired
	private userDAO userDAO;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/manage-user", method = RequestMethod.GET)
	public String manageUser(Model model) {
		return "admin.manage.user";
	}
	
	@RequestMapping("/getDanhSachUser")
	@ResponseBody
	public List<UserInfo> getDanhSachUser() throws JsonProcessingException {
		log.info("[Start] getDanhSachUser");
		List<User> listAccount = new ArrayList<User>();
		listAccount = (List<User>) userDAO.findAll();
		
		List<UserInfo> listUser = new ArrayList<UserInfo>();
		for(User account : listAccount) {
			UserInfo user = new UserInfo();
			listUser.add(user);
		}
		
		return listUser;
	}
	
	@RequestMapping(value = "/view-user/{key}", method = RequestMethod.GET)
	public String viewUser(Model model, @PathVariable("key") int accountId) {
		try {
			User account = userDAO.findOne(accountId);
			if(account != null) {
//				AccountDetail accountDetail = account.getAccountDetail();
//				model.addAttribute("account", account);
//				model.addAttribute("accountDetail", accountDetail);
//				model.addAttribute("viewMode", true);
						
				return "account.profile";
			}
			
		} catch (Exception e) {
			log.error("", e);
		}
		return "500";
	}

	public User getCurrentAccount() {
		try {
			UserDetails userDetail = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			List<User> accounts = userDAO.findAccountByUsername(userDetail.getUsername());
			User account = accounts.get(0);
			return account;
		} catch (Exception e) {
			log.error("", e);
		}
		return null;
	}
	
	@RequestMapping(value = "/manage-message", method = RequestMethod.GET)
	public String manageMessage(Model model) {
		return "admin.manage.message";
	}

}

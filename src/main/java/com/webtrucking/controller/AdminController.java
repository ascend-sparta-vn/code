package com.webtrucking.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.webtrucking.dao.AccountDAO;
import com.webtrucking.dao.MessageDAO;
import com.webtrucking.entity.Account;
import com.webtrucking.entity.AccountDetail;
import com.webtrucking.entity.Message;
import com.webtrucking.json.entity.AjaxResponseBody;
import com.webtrucking.json.entity.UserAjaxEntity;
import com.webtrucking.json.entity.UserInfo;
import com.webtrucking.services.AccountService;
import com.webtrucking.util.Common;
import com.webtrucking.util.IConstant;

/**
 * Created by sonph on 09/12/16.
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {
	static Logger log = LogManager.getLogger(AdminController.class);
	
	@Autowired
	private AccountDAO accountDAO;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private MessageDAO messageDAO;
	
	@RequestMapping(value = "/manage-user", method = RequestMethod.GET)
	public String manageUser(Model model) {
		return "admin.manage.user";
	}
	
	@RequestMapping("/getDanhSachUser")
	@ResponseBody
	public List<UserInfo> getDanhSachUser() throws JsonProcessingException {
		log.info("[Start] getDanhSachUser");
		List<Account> listAccount = new ArrayList<Account>();
		listAccount = (List<Account>) accountDAO.findAll();
		
		List<UserInfo> listUser = new ArrayList<UserInfo>();
		for(Account account : listAccount) {
			UserInfo user = new UserInfo(account);
			listUser.add(user);
		}
		
		return listUser;
	}
	
	@RequestMapping(value = "/view-user/{key}", method = RequestMethod.GET)
	public String viewUser(Model model, @PathVariable("key") int accountId) {
		try {
			Account account = accountDAO.findOne(accountId);
			if(account != null) {
				AccountDetail accountDetail = account.getAccountDetail();
				model.addAttribute("account", account);
				model.addAttribute("accountDetail", accountDetail);
				model.addAttribute("viewMode", true);
						
				return "account.profile";
			}
			
		} catch (Exception e) {
			log.error("", e);
		}
		return "500";
	}
	
	@RequestMapping("/addUser")
	@ResponseBody
	public AjaxResponseBody addUser(@RequestBody UserAjaxEntity requestData) {
		log.info("[Start] adding new user");
		AjaxResponseBody reponseBody = new AjaxResponseBody();
		Account currentAccount = getCurrentAccount();
		if(accountService.checkPermission(currentAccount.getId())){
			
			if( !Common.isValidEmailAddress(requestData.getUsername())) {
				reponseBody.setCode(IConstant.RESP_CODE.FAIL);
				reponseBody.setMsg(getText("email.error"));
				return reponseBody;
    		}
			
			if( StringUtils.isEmpty(requestData.getPassword())) {
				reponseBody.setCode(IConstant.RESP_CODE.FAIL);
				reponseBody.setMsg(getText("password.error"));
				return reponseBody;
    		} else {
    			if(requestData.getPassword().length() < 6) {
    				reponseBody.setCode(IConstant.RESP_CODE.FAIL);
    				reponseBody.setMsg(getText("add.user.fail.password_length"));
    				return reponseBody;
    			}
    		}
			
			List<Account> accounts = accountDAO.findAccountByUsername(requestData.getUsername());
	    	if(accounts!=null && accounts.size() > 0){
	    		reponseBody.setCode(IConstant.RESP_CODE.FAIL);
				reponseBody.setMsg(getText("add.user.fail.userExisted"));
				return reponseBody;
	    	}
			
			boolean result = accountService.addUser(requestData);
			if(result) {
				reponseBody.setCode(IConstant.RESP_CODE.SUCCESS);
				reponseBody.setMsg(getText("add.user.success"));
			} else {
				reponseBody.setCode(IConstant.RESP_CODE.FAIL);
				reponseBody.setMsg(getText("add.user.fail"));
			}
		} else {
			reponseBody.setCode(IConstant.RESP_CODE.FAIL);
			reponseBody.setMsg(getText("403.error"));
		}
		log.info("[End] adding new user");
		return reponseBody;
	}
	
	@RequestMapping("/editUser")
	@ResponseBody
	public AjaxResponseBody editUser(@RequestBody UserAjaxEntity requestData) {
		log.info("[Start] editing user");
		AjaxResponseBody reponseBody = new AjaxResponseBody();
		Account currentAccount = getCurrentAccount();
		if (accountService.checkPermission(currentAccount.getId())) {
			
			if(StringUtils.isNotEmpty(requestData.getPassword())){
    			if(requestData.getPassword().length() < 6) {
    				reponseBody.setCode(IConstant.RESP_CODE.SUCCESS);
    				reponseBody.setMsg(getText("update.user.fail.password_length"));
    				return reponseBody;
    			}
    		}
			
			boolean result = accountService.editUser(requestData);
			if(result){
				reponseBody.setCode(IConstant.RESP_CODE.SUCCESS);
				reponseBody.setMsg(getText("update.user.success"));
			} else {
				reponseBody.setCode(IConstant.RESP_CODE.FAIL);
				reponseBody.setMsg(getText("update.user.fail"));
			}
		} else {
			reponseBody.setCode(IConstant.RESP_CODE.FAIL);
			reponseBody.setMsg(getText("403.error"));
		}
		log.info("[End] editing user");
		return reponseBody;
	}
	
	@RequestMapping("/deleteUser")
	@ResponseBody
	public AjaxResponseBody deleteUser(@RequestBody Integer userId) {
		log.info("[Start] deleteUser ");
		AjaxResponseBody reponseBody = new AjaxResponseBody();
		Account currentAccount = getCurrentAccount();
		try {
			if (accountService.checkPermission(currentAccount.getId())) {
				if(accountService.deleteUser(userId)) {
					reponseBody.setCode(IConstant.RESP_CODE.SUCCESS);
					reponseBody.setMsg(getText("delete.user.success"));
				} else {
					reponseBody.setCode(IConstant.RESP_CODE.FAIL);
					reponseBody.setMsg(getText("delete.user.fail"));
				}
			} else {
				reponseBody.setCode(IConstant.RESP_CODE.FAIL);
				reponseBody.setMsg(getText("403.error"));
			}
		
		} catch (Exception e) {
			log.error("", e);
		}
		log.info("[End] deleteUser ");
		return reponseBody;
	}
	
	public Account getCurrentAccount() {
		try {
			UserDetails userDetail = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			List<Account> accounts = accountDAO.findAccountByUsername(userDetail.getUsername());
			Account account = accounts.get(0);
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
	
	
	@RequestMapping("/getListMessages")
	@ResponseBody
	public List<Message> getListMessages() throws JsonProcessingException {
		log.info("[Start] getListMessages");
		List<Message> listMessages = (List<Message>) messageDAO.findAll();
		log.info("[End] getListMessages");
		return listMessages;
	}
	
	@RequestMapping("/deleteMessage")
	@ResponseBody
	public AjaxResponseBody deleteMessage(@RequestBody Integer messageId) {
		log.info("[Start] deleteMessage ");
		AjaxResponseBody reponseBody = new AjaxResponseBody();
		Account currentAccount = getCurrentAccount();
		try {
			if (accountService.checkPermission(currentAccount.getId())) {
				messageDAO.delete(messageId);
				reponseBody.setCode(IConstant.RESP_CODE.SUCCESS);
				reponseBody.setMsg(getText("message.delete.success"));
			} else {
				reponseBody.setCode(IConstant.RESP_CODE.FAIL);
				reponseBody.setMsg(getText("403.error"));
			}
		
		} catch (Exception e) {
			log.error("", e);
			reponseBody.setCode(IConstant.RESP_CODE.FAIL);
			reponseBody.setMsg(getText("message.delete.fail"));
		}
		log.info("[End] deleteMessage ");
		return reponseBody;
	}
	
}

package com.webtrucking.controller.rest;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.webtrucking.dao.AccountDAO;
import com.webtrucking.dao.AccountDetailDAO;
import com.webtrucking.dao.OwnerTruckDAO;
import com.webtrucking.entity.Account;
import com.webtrucking.entity.AccountDetail;
import com.webtrucking.entity.OwnerTruck;
import com.webtrucking.json.entity.SearchMemberRequest;

@RestController
@RequestMapping("/member_rest")
public class MemberRestController {
	static Logger log = Logger.getLogger(MemberRestController.class);
	
	
	@Autowired
	private OwnerTruckDAO ownerDAO;
	
	@Autowired
	private AccountDAO accountDAO;
	
	@Autowired
	private AccountDetailDAO accountDetailDAO;
	
	
	@RequestMapping("/searchListCommodity")
	@ResponseBody
	public List<OwnerTruck> searchListCommodity(@RequestBody SearchMemberRequest requestData) throws JsonProcessingException {
		log.info("[Start] searchListCommodity");
//		Map<String, Object> model = new HashMap<String, Object>();
		List<OwnerTruck> list  = new ArrayList<OwnerTruck>();
		String name = requestData.getOwnerName();
		String phone = requestData.getOwnerPhoneNumber();
		String status = requestData.getOwnerStatus();
		if(name == null)
			name = "";
		if(phone == null)
			phone = "";
		if(status == null)
			status = "-1";
		
		log.info("name = " + name + ", phone = " + phone + ", status = " + status);
		log.info("searching...");
		list = ownerDAO.searchListCommodity(name, status, phone);
//		model.put("listOwnerTruck", list);
		log.info("[End] searchListCommodity");
		return list;
	}
	
	@RequestMapping("/getMemberById")
	public AccountDetail getMemberById(@RequestParam(value="accountId") Integer accountId) throws JsonProcessingException {
		log.info("[Start] getMemberById");
		if(accountId == null)
			return new AccountDetail();
		AccountDetail acc = null;
		log.info("accountId=" + accountId);
		log.info("searching...");
		
		acc = accountDetailDAO.findOne(accountId);
		
		log.info("[End] getMemberById");
		return acc;
	}
	
	@RequestMapping("/check-account-exist")
	@ResponseBody
	public int checkAccountExist(@RequestParam(value="userName") String userName) throws JsonProcessingException {
		log.info("[Start] getMemberById");
		List<Account> accounts = new ArrayList<Account>();
		try {
			System.out.println(userName);
			accounts = accountDAO.findAccountByUsername(userName);
		} catch (Exception e) {
			log.error("Error when load accounts:" + e.getMessage());
		}
		return accounts.size();
	}
}

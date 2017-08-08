package com.webtrucking.controller;

import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.webtrucking.dao.AccountDAO;
import com.webtrucking.dao.ShipmentDAO;
import com.webtrucking.dao.TruckDAO;
import com.webtrucking.dao.UserRoleDAO;
import com.webtrucking.entity.Account;

public class BaseController {

	static Logger log = Logger.getLogger(BaseController.class);
	
	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private AccountDAO accountDAO;
	
	@Autowired
	private UserRoleDAO userRoleDAO;
	
	@Autowired
	private TruckDAO truckDAO;
	
	@Autowired
	private ShipmentDAO shipmentDAO;
	
	/*
	 * to get message from language file properties like struts2
	 */
	public String getText(String text) {
		 // obtain locale from LocaleContextHolder
		// add parametrized message from controller
		Locale currentLocale = LocaleContextHolder.getLocale();
		String message = messageSource.getMessage(text,
	            new Object [] {"test"}, "default", currentLocale);
	        return message;
	}
	
	public Account getCurrentAccount() {
		try {
			UserDetails userDetail = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			List<Account> accounts = accountDAO.findAccountByUsername(userDetail.getUsername());
			Account account = null;
			if(accounts != null && accounts.size() > 0){
				account = accounts.get(0);
			}
			return account;
		} catch (Exception e) {
			log.error("", e);
		}
		return null;
	}
	
	public Integer getNextAutoIncreamentTrucking(){
		Integer nextId = -1;
		List<Object[]> nextRecord = truckDAO.getNextAutoIncreamentTrucking();
		if(nextRecord != null && nextRecord.size() > 0){
			Object obj = nextRecord.get(0)[10];
			if(obj != null)
				nextId = Integer.parseInt(obj.toString());
		}
		return nextId;
		
	}
	
	public Integer getNextAutoIncreamentShipment(){
		Integer nextId = -1;
		List<Object[]> nextRecord = shipmentDAO.getNextAutoIncreamentShipment();
		if(nextRecord != null && nextRecord.size() > 0){
			Object obj = nextRecord.get(0)[10];
			if(obj != null)
				nextId = Integer.parseInt(obj.toString());
		}
		return nextId;
	}
	
	public Pageable createPageRequest(Integer page, Integer size, String sortedField) {
		return new PageRequest(page, size, Sort.Direction.DESC, sortedField);
	}
	
}

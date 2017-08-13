package com.webtrucking.controller;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webtrucking.entity.Account;
import com.webtrucking.util.CacheUtil;

/**
 * Created by sonph on 16/09/16.
 */
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController{
	static Logger log = LogManager.getLogger(OrderController.class);
	@RequestMapping("/trucking/")
	public String listSending(Map<String, Object> model) {
		// check login
		Account account = getCurrentAccount();
		Integer currAccountId = -1;
		if(account != null)
			currAccountId = account.getId();
		model.put("currAccountId", currAccountId);
		model.put("listProvince", CacheUtil.listProvinceCache.get("listProvince"));
		return "order-trucking";
	}
	
	@RequestMapping("/shipment/")
	public String listReceiving(Map<String, Object> model) {	
		// check login
		Account account = getCurrentAccount();
		Integer currAccountId = -1;
		if(account != null)
			currAccountId = account.getId();
		model.put("currAccountId", currAccountId);
		model.put("listProvince", CacheUtil.listProvinceCache.get("listProvince"));
		return "order-shipment";
	}
	
	@RequestMapping("/shipment/detail")
	public String shipmentDetail(Map<String, Object> model) {
		// check login
		Account account = getCurrentAccount();
		Integer currAccountId = -1;
		if(account != null)
			currAccountId = account.getId();
		model.put("currAccountId", currAccountId);
		model.put("listProvince", CacheUtil.listProvinceCache.get("listProvince"));
		return "order-shipment-detail";
	}
	
	@RequestMapping("/shipment/post")
	public String shipmentPost(Map<String, Object> model) {	
		// check login
		Account account = getCurrentAccount();
		Integer currAccountId = -1;
		if(account != null)
			currAccountId = account.getId();
		model.put("currAccountId", currAccountId);
		model.put("listProvince", CacheUtil.listProvinceCache.get("listProvince"));
		return "order-shipment-post";
	}
	
	@RequestMapping("/trucking/detail")
	public String truckingDetail(Map<String, Object> model) {	
		// check login
		Account account = getCurrentAccount();
		Integer currAccountId = -1;
		if(account != null)
			currAccountId = account.getId();
		model.put("currAccountId", currAccountId);
		model.put("listProvince", CacheUtil.listProvinceCache.get("listProvince"));
		return "order-trucking-detail";
	}
	
	@RequestMapping("/trucking/post")
	public String truckingPost(Map<String, Object> model) {	
		// check login
		Account account = getCurrentAccount();
		Integer currAccountId = -1;
		if(account != null)
			currAccountId = account.getId();
		model.put("currAccountId", currAccountId);
		model.put("listProvince", CacheUtil.listProvinceCache.get("listProvince"));
		return "order-trucking-post";
	}
	
}

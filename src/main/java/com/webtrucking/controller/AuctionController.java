package com.webtrucking.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * Created by sonph on 16/09/16.
 */
@Controller
@RequestMapping("/auction")
public class AuctionController {
	static Logger log = Logger.getLogger(AuctionController.class);

	@RequestMapping("/list")
	public String listAuction(Map<String, Object> model) {
		return "auction.list";
	}
	
	@RequestMapping("/detail")
	public String detail(Map<String, Object> model) {	
		return "auction.detail";
	}
}

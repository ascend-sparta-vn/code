package com.webtrucking.controller;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by sonph on 16/09/16.
 */
@Controller
@RequestMapping("/member")
public class MemberController {
	static Logger log = LogManager.getLogger(MemberController.class);
	@RequestMapping("/list-commodity")
	public String listTrucking(Map<String, Object> model) {	
		return "member.list";
	}
	
	@RequestMapping("/detail")
	public String detail(Map<String, Object> model) {	
		return "member.detail";
	}
}

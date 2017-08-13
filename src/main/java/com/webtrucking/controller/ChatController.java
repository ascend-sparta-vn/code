package com.webtrucking.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * Created by sonph on 16/09/16.
 */
@Controller
@RequestMapping("/chat")
public class ChatController {
	static Logger log = LogManager.getLogger(ChatController.class);
	@RequestMapping("/list")
	public String listTrucking(Map<String, Object> model) {	
		return "chat.list";
	}
	
	@RequestMapping("/detail")
	public String detail(Map<String, Object> model) {	
		return "chat.detail";
	}
}

package com.webtrucking.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.webtrucking.dao.MessageDAO;
import com.webtrucking.entity.LocationTrackingObject;
import com.webtrucking.entity.Message;
import com.webtrucking.json.entity.MessageInfo;
import com.webtrucking.services.LocationServices;
//import com.webtrucking.services.EmailService;
import com.webtrucking.util.IConstant;

/**
 * Created by sonph on 16/09/16.
 */
@Controller
public class MainController {
	static Logger log = LogManager.getLogger(MainController.class);
	
	@Autowired
	LocationServices ls;
	
	@Autowired
	private MessageDAO messageDAO;
	
	@RequestMapping(value = "/homepage", method = RequestMethod.GET)
	public String homepage(ModelMap model) {
		//29B09678;29B60651;29B06316;29B15993;29B02520;29B14874;19N2885
//		LocationTrackingObject object = ls.getCurrentLocation("29B096378");
//		if(object != null) {
//			System.out.println(object.getLat
//					() + ", " + object.getLng());
//		}
		return "homepage";
	}
	
	@RequestMapping(value = "/add-device", method = RequestMethod.GET)
	public String addDevice(ModelMap model) {
		return "add-device";
	}
	
	@RequestMapping(value = "/edit-device", method = RequestMethod.GET)
	public String editDevice(ModelMap model) {
		return "edit-device";
	}
	
	@RequestMapping(value = "/copy-device", method = RequestMethod.GET)
	public String copyDevice(ModelMap model) {
		return "copy-device";
	}
	
	@RequestMapping(value = "/list-device", method = RequestMethod.GET)
	public String listDevice(ModelMap model) {
		return "homepage";
	}
	
	@RequestMapping(value = "/list-user", method = RequestMethod.GET)
	public String listUser(ModelMap model) {
		return "list-user";
	}
	
	@RequestMapping(value = "/change-language", method = RequestMethod.GET)
	public String changeLanguage(ModelMap model, @RequestParam String lang, HttpServletRequest request) {
		if(lang.equals("en")) {
			request.getSession().setAttribute("language", IConstant.LANGUAGE.ENGLISH);
		} else {
			request.getSession().setAttribute("language", IConstant.LANGUAGE.VIETNAM);
		}
		String referrer = request.getHeader("referer");
		return "redirect:"+referrer;
	}
	
	@RequestMapping(value = "/contact-us", method = RequestMethod.GET)
	public String contactUs(ModelMap model) {
		return "contact-us";
	}
	
	@RequestMapping(value = "/sendMessage", method = RequestMethod.POST)
	public String sendMessage(Model model, HttpServletRequest request, @ModelAttribute MessageInfo messageInfo) throws JsonProcessingException {
		log.info("Start sendMessage");
		try {
			log.info("name = " + messageInfo.getName());
			log.info("email=" + messageInfo.getEmail());
			Message message = new Message();
			message.setEmail(messageInfo.getEmail());
			message.setMessage(messageInfo.getMessage());
			message.setName(messageInfo.getName());
			message.setCreateDate(new Date());
			
			messageDAO.save(message);
			
			model.addAttribute("result", "success");
			model.addAttribute("resultMessage", "Gửi tin nhắn thành công");
			
		} catch (Exception e) {
			log.error("", e);
			model.addAttribute("result", "error");
			model.addAttribute("resultMessage", "Gửi tin nhắn thất bại");
		}
		log.info("end sendMessage");
		return "contact-us";
	}
	
	@RequestMapping(value = "/about-us", method = RequestMethod.GET)
	public String aboutUs(ModelMap model) {
		return "about-us";
	}
	
	@RequestMapping(value = "/legacy", method = RequestMethod.GET)
	public String legacy(ModelMap model) {
		return "legacy";
	}
	
}


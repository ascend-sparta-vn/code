package com.webtrucking.controller;

import com.webtrucking.util.Common;
import com.webtrucking.util.IConstant;
import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

//import com.webtrucking.services.EmailService;

/**
 * Created by sonph on 16/09/16.
 */
@Controller
public class MainController {
	static Logger log = Logger.getLogger(MainController.class);
	
	@RequestMapping(value = "/homepage", method = RequestMethod.GET)
	public String homepage(HttpServletRequest request, ModelMap model, Authentication authen) {
		//29B09678;29B60651;29B06316;29B15993;29B02520;29B14874;19N2885
//		LocationTrackingObject object = ls.getCurrentLocation("29B096378");
//		if(object != null) {
//			System.out.println(object.getLat
//					() + ", " + object.getLng());
//		}

		return Common.getReturnPage(authen);
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
	
	@RequestMapping(value = "/about-us", method = RequestMethod.GET)
	public String aboutUs(ModelMap model) {
		return "about-us";
	}
	
	@RequestMapping(value = "/legacy", method = RequestMethod.GET)
	public String legacy(ModelMap model) {
		return "legacy";
	}
	
}


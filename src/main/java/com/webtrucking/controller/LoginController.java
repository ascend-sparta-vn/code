package com.webtrucking.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webtrucking.util.CacheUtil;
import com.webtrucking.util.Common;
import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webtrucking.util.IConstant;

/**
 * Created by thangtv on 16/09/16.
 */
@Controller
public class LoginController extends BaseController {
	static Logger log = Logger.getLogger(LoginController.class);
	@RequestMapping("/")
	public String defaultUrl(Map<String, Object> model, Authentication authen) {
//		try {
//			boolean isValid = validLogin();
//			if(isValid) return "homepage";
//			else return "login";
//		} catch (Exception e) {
//			log.error("", e);
//			return "login";
//		}

		return Common.getReturnPage(authen);
	}

	@RequestMapping("/login")
	public String login(Map<String, Object> model) {
		try {
			boolean isValid = validLogin();
			if(isValid) return "homepage";
			else return "account.login";
		} catch (Exception e) {
			log.error("", e);
			return "account.login";
		}
	}

	@RequestMapping(value="/logout")
	public String logoutPage (Model model, HttpServletRequest request, HttpServletResponse response) {

		CacheUtil.listProductAdd = new HashMap<>();

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		model.addAttribute("msg", getText("logout.success"));
		return "account.login";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
	}

	private boolean validLogin() {
		// This function does a check to ascertain the validity of the logged in user
		// You may also consider evaluating userDetails.getAuthorities()
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal.equals(IConstant.LOGIN_STATUS.ANONYMOUS_USER)) {
			return false;
		} else {
			UserDetails userDetails = (UserDetails) principal;
			return userDetails.isAccountNonExpired() &&
					userDetails.isAccountNonLocked() &&
					userDetails.isCredentialsNonExpired() &&
					userDetails.isEnabled();
		}
	}
}
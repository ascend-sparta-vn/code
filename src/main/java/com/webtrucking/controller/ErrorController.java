package com.webtrucking.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.boot.autoconfigure.web.ErrorViewResolver;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController implements ErrorViewResolver {

	@RequestMapping("/403")
	public String load403(Map<String, Object> model) {
		return "403";
	}

	@RequestMapping("/404")
	public String load404(Map<String, Object> model) {
		return "404";
	}
	
	@RequestMapping("/500")
	public String load500(Map<String, Object> model) {
		return "500";
	}

	@Override
	public ModelAndView resolveErrorView(HttpServletRequest request,
			HttpStatus status, Map<String, Object> model) {

		ModelMap map = new ModelMap();
		if (status.equals(HttpStatus.NOT_FOUND)) {
			return new ModelAndView("404", map);
		} else if (status.equals(HttpStatus.FORBIDDEN)) {
			return new ModelAndView("403", map);
		} else {
			return new ModelAndView("500", map);
		}

	}

}

package com.webtrucking.controller;

import com.webtrucking.util.Common;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/listview")
public class IndexController {


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(Model model, HttpServletRequest request) {        
    	
    	String capcha = request.getParameter("defaultReal");
		Common.rpHash(capcha).equals(request.getParameter("defaultRealHash"));
		boolean isValid = Common.rpHash(capcha).equals(request.getParameter("defaultRealHash")) ? true : false;
    	
    	
        return "listview";
    }
}

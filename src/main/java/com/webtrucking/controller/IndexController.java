package com.webtrucking.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webtrucking.dao.TruckInfoDetailDAO;
import com.webtrucking.util.Common;

@Controller
@RequestMapping("/listview")
public class IndexController {

	@Autowired 
    private TruckInfoDetailDAO truckInfoDetailDAO;
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Locale locale, Model model) {        
        model.addAttribute("products", truckInfoDetailDAO.findAll());
        return "listview";
    } 
    
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(Model model, HttpServletRequest request) {        
    	
    	String capcha = request.getParameter("defaultReal");
		Common.rpHash(capcha).equals(request.getParameter("defaultRealHash"));
		boolean isValid = Common.rpHash(capcha).equals(request.getParameter("defaultRealHash")) ? true : false;
    	
    	
        return "listview";
    }
}

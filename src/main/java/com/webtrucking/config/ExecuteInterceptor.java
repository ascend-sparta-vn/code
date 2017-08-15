package com.webtrucking.config;

import com.webtrucking.json.entity.LeftFilterEntity;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Service
public class ExecuteInterceptor extends HandlerInterceptorAdapter{

	static Logger log = Logger.getLogger(ExecuteInterceptor.class);
	
	//before the actual handler will be executed
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	    throws Exception {
		
		//do something here
		//log.info("preHandle...");
		//test commit

		return true;
	}

	//after the handler is executed
	public void postHandle(
		HttpServletRequest request, HttpServletResponse response,
		Object handler, ModelAndView modelAndView)
		throws Exception {
		//log.info("postHandle...");
		if(modelAndView != null) {
			//gen left menu
			List<LeftFilterEntity> listGoods = new ArrayList<LeftFilterEntity>();
			modelAndView.addObject("listGoods", listGoods);
			
			
		}
	}
}

package com.webtrucking.controller;

import com.webtrucking.dao.ShipmentDAO;
import com.webtrucking.entity.Shipment;
import com.webtrucking.entity.User;
import com.webtrucking.util.CacheUtil;
import com.webtrucking.util.DateUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

/**
 * Created by sonph on 01/12/16.
 */
@Controller
@RequestMapping("/shipment")
public class ShipmentController extends BaseController{
	@Autowired
	private ShipmentDAO shipmentDAO;
	
	static Logger log = Logger.getLogger(ShipmentController.class);
	private static SimpleDateFormat sdf = new SimpleDateFormat(DateUtils.ddMMyyyy_SLASH);

	@RequestMapping("/listTrucking")
	public String listTrucking(Map<String, Object> model) {
		model.put("listProvince", CacheUtil.listProvinceCache.get("listProvince"));
		return "shipment.list1";
	}
	
	@RequestMapping("/listTrucking1")
	public String listTrucking1(Map<String, Object> model, 
			@RequestParam(required = false) Integer page, 
			@RequestParam(required = false) Integer size) {	
		model.put("listProvince", CacheUtil.listProvinceCache.get("listProvince"));
		if(page != null) {
			model.put("currentPage", page);
		} else {
			model.put("currentPage", 1);
		}
		if(size != null) {
			model.put("size", size);
		} else {
			model.put("size", 10);
		}
		return "shipment.list";
	}

	@RequestMapping("/list")
	public String list(Model model,
								@RequestParam(required = false) Integer page,
								@RequestParam(required = false) Integer size) {
		// get current userId login
		User user = getCurrentAccount();
		String username = user.getUsername();

		if("transporter".equals(username) || "admin".equals(username)) {
			List<Shipment> shipments = shipmentDAO.getShipmentByOwnerId(user.getId());
			model.addAttribute("shipments", shipments);
		} else {
			return "403";
		}

		return "shipment.list";
	}

	@RequestMapping("/post")
	public String postTrucking(Map<String, Object> model) {
		// check login
		return "shipment.post";
	}

}

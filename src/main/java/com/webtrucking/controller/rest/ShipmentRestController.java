package com.webtrucking.controller.rest;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.webtrucking.controller.BaseController;
import com.webtrucking.dao.AccountDAO;
import com.webtrucking.dao.OrdersDAO;
import com.webtrucking.dao.ShipmentDAO;
import com.webtrucking.entity.Account;
import com.webtrucking.entity.OrdersTrucking;
import com.webtrucking.entity.Shipment;
import com.webtrucking.json.entity.AjaxResponseBody;
import com.webtrucking.json.entity.SearchShipmentRequest;
import com.webtrucking.services.EmailService;
import com.webtrucking.util.DateUtils;
import com.webtrucking.util.IConstant;

@RestController
@RequestMapping("/rest_shipment")
public class ShipmentRestController extends BaseController{
	static Logger log = LogManager.getLogger(ShipmentRestController.class);
	private static SimpleDateFormat sdf = new SimpleDateFormat(DateUtils.ddMMyyyy_SLASH);
	
	@Autowired
	private ShipmentDAO shipmentDAO;
	
	@Autowired
	private OrdersDAO orderDAO;
	
	@Autowired
	private AccountDAO accountDAO;
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	private Environment env;
	
	@RequestMapping("/getListShipment")
	@ResponseBody
	public Map<String, Object> getListShipment(@RequestBody SearchShipmentRequest requestData) throws JsonProcessingException {
		log.info("[Start] getListShipment");
		Map<String, Object> model = new HashMap<String, Object>();
		List<Shipment> list  = new ArrayList<Shipment>();
		Integer provinceTo = requestData.getToProvince();
		Integer provinceFrom = requestData.getFromProvince();
		Integer districtTo = requestData.getToDistrict();
		Integer districtFrom = requestData.getFromDistrict();
		int goodsType = requestData.getGoodsTypeId();
		String fromDate = requestData.getStartDate();
		String postDate = requestData.getPostDate();
		Integer pageSize = requestData.getPageSize();
		Integer currentPage = requestData.getCurrentPage();
		if (currentPage == null) currentPage = 1;
		if (pageSize == null) pageSize = 10;
		Integer start = (currentPage -1) * pageSize;
		Integer end = currentPage * pageSize;
		Integer total = shipmentDAO.countResult(provinceTo, provinceFrom, districtTo
				, districtFrom, goodsType, fromDate, postDate);
		if(total != null) {
			model.put("total", total);
		} else {
			model.put("total", 0);
		}
		
		log.info("provinceTo = " + provinceTo + ", provinceFrom = " + provinceFrom + ""
				+ ", districtTo = " + districtTo + ", districtFrom = " + districtFrom + ""
						+ ", goodsType=" + goodsType + 
						", fromDate=" + fromDate + ", postDate=" + postDate);
		log.info("searching...");
		
		list = shipmentDAO.searchShipment(provinceTo, provinceFrom, districtTo
				, districtFrom, goodsType, fromDate, postDate, start, end);
		model.put("listShipments", list);
		
		log.info("[End] getListShipment");
		return model;
	}
	
	@RequestMapping("/getShipmentById")
	@ResponseBody
	public Map<String, Object> getShipmentById(@RequestParam(value="shipId") Integer shipId) throws JsonProcessingException {
		log.info("[Start] getShipmentById");
		Map<String, Object> model = new HashMap<String, Object>();
		if(shipId == null){
			model.put("shipment", null);
			model.put("prevShipment", null);
			model.put("nextShipment", null);
			return model;
		}
		Shipment shipment = null;
		log.info("shipId=" + shipId);
		shipment = shipmentDAO.findOne(shipId);
		List<Object[]> prevNextShipmentId = shipmentDAO.getPrevNextShipmentId(shipId);
		Integer prevId = null;
		Integer nextId = null;
		if(prevNextShipmentId != null && prevNextShipmentId.size() > 0){
			prevId = (Integer) prevNextShipmentId.get(0)[0];
			nextId = (Integer) prevNextShipmentId.get(0)[1];
		}
		
		model.put("shipment", shipment);
		model.put("prevShipment", prevId);
		model.put("nextShipment", nextId);
		
		log.info("[End] getShipmentById");
		return model;
	}
	
	@RequestMapping("/getShipmentByOrderId")
	@ResponseBody
	public Shipment getShipmentByOrderId(@RequestParam(value="orderId") Integer orderId) throws JsonProcessingException {
		log.info("[Start] getShipmentByOrderId");
		if(orderId == null)
			return new Shipment();
		log.info("orderId=" + orderId);
		OrdersTrucking order = orderDAO.findOne(orderId);
		Shipment shipment = null;
		if(order != null){
			log.info("searching...");
			shipment = shipmentDAO.findOne(order.getEventId());
		}
		log.info("[End] getShipmentByOrderId");
		return shipment;
	}
	
	@RequestMapping("/addShipmentPost")
	@ResponseBody
	public AjaxResponseBody addShipmentPost(@RequestBody SearchShipmentRequest requestData){
		AjaxResponseBody response = new AjaxResponseBody();
		try {
			// get loggedd User
			Account account = getCurrentAccount();
			// save shipment info detail
			Shipment detail = new Shipment();
			detail.setName(requestData.getName());
			Integer nextId = getNextAutoIncreamentShipment();
			detail.setCode(IConstant.EMAIL_PREFIX.SHIPMENT + (IConstant.CFG_VALUE.TRUCK_CODE + nextId));
			detail.setFromDistrict(requestData.getFromDistrict());
			detail.setToDistrict(requestData.getToDistrict());
			detail.setGoodsTypeId(requestData.getGoodsTypeId());
			detail.setPrice(requestData.getPrice());
			detail.setDescription(requestData.getDescription());
			detail.setOwnerId(account.getId());
			detail.setDealTypeId(requestData.getDealType());
			detail.setStatus(IConstant.STATUS.SHIPMENT_UNACTIVE);
			
			String startDate = requestData.getStartDate();
			if(startDate != null && !startDate.isEmpty()){
				startDate = requestData.getStartDate();
				detail.setStartDate(sdf.parse(startDate));
			}
			
//			String postDate = requestData.getPostDate();
//			if(postDate != null && !postDate.isEmpty()){
//				detail.setPostDate(sdf.parse(postDate));
//			}
			detail.setPostDate(new Date());
			// approve date
			String expireDate = requestData.getExpiredDate();
			if(expireDate != null && !expireDate.isEmpty()){
				detail.setExpiredDate(sdf.parse(expireDate));
				detail.setFinishDate(sdf.parse(expireDate));
			}
			detail.setAgency(requestData.getAgency());
			// tracking_trip
			detail.setCreatedDate(new Date());
			detail.setWeight(requestData.getWeight());
			detail.setFromDetailAddress(requestData.getFromDetailAddress());
			detail.setToDetailAddress(requestData.getToDetailAddress());
			detail.setDistance(requestData.getDistance());
			detail.setWeightUnit(requestData.getWeightUnit());
			detail.setPriceUnit(requestData.getPriceUnit());
			
			shipmentDAO.save(detail);
			// send email
			String urlOrderDetail = env.getProperty("url.shipment.detail") + detail.getId();
			emailService.createShipmentPostNotifyEmail(urlOrderDetail, detail);
			response.setCode(IConstant.RESP_CODE.SUCCESS);
			response.setMsg(getText("shipment.add.success"));
			return response;
		} catch (Exception e) {
			response.setCode(IConstant.RESP_CODE.FAIL);
			response.setMsg(getText("shipment.add.fail"));
		}
		
		return response;
	}
	
	@RequestMapping("/getGoods")
	@ResponseBody
	@SuppressWarnings("unchecked")
	public List<Shipment> getGoods() throws JsonProcessingException {
		log.info("[Start] getGoods");
		List<Shipment> list  = new ArrayList<Shipment>();
		try {
			Account account = getCurrentAccount();
			//check role
			Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>)
					SecurityContextHolder.getContext().getAuthentication().getAuthorities();
			Iterator iterator = authorities.iterator();
			boolean isAdmin = false;
			while (iterator.hasNext()) {
				SimpleGrantedAuthority authority = (SimpleGrantedAuthority)  iterator.next();
				if(authority.getAuthority().equals(IConstant.ROLE.ROLE_ADMIN)) {
					isAdmin = true;
				} 
			}
			if(isAdmin) {
				list = (List<Shipment>) shipmentDAO.findAll();
			} else {
				list = shipmentDAO.getGoodsByOwner(account.getId());
			}
			
		} catch (Exception e) {
			log.error("Can not get goods by account", e);
		}
		
		log.info("[End] getListShipment");
		return list;
	}
}

package com.webtrucking.controller.rest;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.webtrucking.controller.BaseController;
import com.webtrucking.dao.AccountDAO;
import com.webtrucking.dao.OrdersShipmentDAO;
import com.webtrucking.dao.OrdersTruckingDAO;
import com.webtrucking.dao.ShipmentDAO;
import com.webtrucking.dao.TruckDAO;
import com.webtrucking.dao.TruckInfoDetailDAO;
import com.webtrucking.dao.UserRoleDAO;
import com.webtrucking.entity.Account;
import com.webtrucking.entity.OrdersShipment;
import com.webtrucking.entity.OrdersTrucking;
import com.webtrucking.entity.Shipment;
import com.webtrucking.entity.TruckInfoDetail;
import com.webtrucking.entity.UserRole;
import com.webtrucking.json.entity.AjaxResponseBody;
import com.webtrucking.json.entity.OrderRequest;
import com.webtrucking.json.entity.SearchOrderingRequest;
import com.webtrucking.services.EmailService;
import com.webtrucking.util.DateUtils;
import com.webtrucking.util.IConstant;

@RestController
@RequestMapping("/rest_order")
public class OrderRestController extends BaseController{
	static Logger log = Logger.getLogger(OrderRestController.class);
	private static SimpleDateFormat sdf = new SimpleDateFormat(DateUtils.ddMMyyyy_SLASH);
	
	@Autowired
	private TruckDAO truckDAO;
	
	@Autowired
	private AccountDAO accountDAO;
	
	@Autowired
	private OrdersTruckingDAO ordersTruckingDAO;
	
	@Autowired
	private OrdersShipmentDAO ordersShipmentDAO;
	
	@Autowired
	private ShipmentDAO shipmentDAO;
	
	@Autowired
	private TruckInfoDetailDAO truckInfoDAO;
	
	@Autowired
	private UserRoleDAO userRoleDAO;
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	private Environment env;
	
	@RequestMapping("/getListOrderShipment")
	@ResponseBody
	public List<OrdersShipment> getListOrderShipment(@RequestBody SearchOrderingRequest requestData) throws JsonProcessingException {
		log.info("[Start] getListOrderShipment");
		List<OrdersShipment> list  = new ArrayList<OrdersShipment>();
		Integer provinceTo = requestData.getToProvince();
		Integer provinceFrom = requestData.getFromProvince();
		int orderType = requestData.getOrderType();
		int goodsType = requestData.getGoodsTypeId();
		String fromDate = requestData.getStartDate();
		String postDate = requestData.getPostDate();
		Account account = getCurrentAccount();
		log.info("provinceTo = " + provinceTo + ", provinceFrom = " + provinceFrom + ""
						+ ", orderType = " + orderType + "goodsType=" + goodsType + 
						", fromDate=" + fromDate + ", postDate=" + postDate);
		log.info("searching...");
		list = ordersShipmentDAO.searchShipmentOrders(provinceTo, provinceFrom, goodsType, fromDate, postDate, orderType, account.getId());
		log.info("[End] getListOrderShipment");
		return list;
	}
	
	@RequestMapping("/getListOrderTrucking")
	@ResponseBody
	public List<OrdersTrucking> getListOrderTrucking(@RequestBody SearchOrderingRequest requestData) throws JsonProcessingException {
		log.info("[Start] getListOrderTrucking");
		List<OrdersTrucking> list  = new ArrayList<OrdersTrucking>();
		Integer provinceTo = requestData.getToProvince();
		Integer provinceFrom = requestData.getFromProvince();
		int truckType = requestData.getTruckType();
		int orderType = requestData.getOrderType();
		String fromDate = requestData.getStartDate();
		String postDate = requestData.getPostDate();
		Account account = getCurrentAccount();
		if(account == null){
			return list;
		}
		log.info("provinceTo = " + provinceTo + ", provinceFrom = " + provinceFrom + ""
				+ ",truckType=" + truckType + 
				", fromDate=" + fromDate + ", postDate=" + postDate);
		log.info("searching...");
		list = ordersTruckingDAO.searchTruckingOrders(provinceTo, provinceFrom, truckType, fromDate, postDate, orderType, account.getId());
		log.info("[End] getListOrderTrucking");
		return list;
	}
	
	
	@RequestMapping("/getTruckingById")
	public TruckInfoDetail getTruckingById(@RequestParam(value="truckId") Integer truckId) throws JsonProcessingException {
		log.info("[Start] detail");
		if(truckId == null)
			return new TruckInfoDetail();
		TruckInfoDetail truck = null;
		log.info("truckId=" + truckId);
		log.info("searching...");
		
//		truck = truckInfoDetailDAO.findOne(truckId);
		
		log.info("[End] detail");
		return truck;
	}
	
	@RequestMapping("/addShipmentOrder")
	@ResponseBody
	public AjaxResponseBody addShipmentOrder(@RequestBody OrderRequest req){
		AjaxResponseBody response = new AjaxResponseBody();
		try {
			log.info("[START] addShipmentOrder");
			// get loggedd User
			Account account = getCurrentAccount();
			OrdersShipment order = new OrdersShipment();
			order.setOwnerId(account.getId());
			Integer _eventId = req.getEventId();
			if(_eventId != null){
				Shipment shipment = shipmentDAO.findOne(_eventId);
				if(shipment != null){
					order.setPartnerId(req.getPartnerId());
					order.setEventId(_eventId);
					order.setOrderType(req.getOrderType());
					order.setQuantity(req.getQuantity());
					order.setUnit(req.getUnit());
					order.setExpectedPrice(req.getExpectedPrice());
					order.setVatFee(req.getVatFee());
					order.setPorterFee(req.getPorterFee());
					order.setShiftFee(req.getShiftFee());
					order.setCreatedDate(new Date());
//					order.setTransactionType(req.getTransactionType());
					order.setDescription(req.getDescription());
					
					ordersShipmentDAO.save(order);
					response.setCode(IConstant.RESP_CODE.SUCCESS);
					response.setMsg(getText("order.add.success"));
					// send email to sender
					String urlOrderDetail = env.getProperty("url.order.shipment.detail") + order.getId();
					emailService.createOrderShipmentNotifyEmail(urlOrderDetail, order, account.getUsername());
					// send email to owner
					Account owner = accountDAO.findOne(shipment.getOwnerId());
					emailService.createOwnerOrderShipmentNotifyEmail(urlOrderDetail, order, owner.getUsername());
					
					return response;
				}else{
					// shipment is not exist
					response.setCode(IConstant.RESP_CODE.FAIL);
					response.setMsg(getText("shipment.exist.not"));
					return response;
				}
			}else{
				response.setCode(IConstant.RESP_CODE.FAIL);
				response.setMsg(getText("shipment.exist.not"));
				return response;
			}
		} catch (Exception e) {
			response.setCode(IConstant.RESP_CODE.FAIL);
			log.error("[EXCEPTION] addShipmentOrder");
		}
		log.info("[END] addShipmentOrder");
		return response;
	}
	
	@RequestMapping("/addTruckingOrder")
	@ResponseBody
	public AjaxResponseBody addTruckingOrder(@RequestBody OrderRequest req){
		AjaxResponseBody response = new AjaxResponseBody();
		try {
			log.info("[START] addTruckingOrder");
			// get loggedd User
			Account account = getCurrentAccount();
			OrdersTrucking order = new OrdersTrucking();
			order.setOwnerId(account.getId());
			Integer _eventId = req.getEventId();
			if(_eventId != null){
				TruckInfoDetail truckInfo = truckInfoDAO.findOne(_eventId);
				if(truckInfo != null){
					order.setPartnerId(truckInfo.getTruck().getOwnerTruckId());
					order.setEventId(_eventId);
					order.setOrderType(req.getOrderType());
					order.setQuantity(req.getQuantity());
					order.setUnit(req.getUnit());
					order.setExpectedPrice(req.getExpectedPrice());
					order.setVatFee(req.getVatFee());
					order.setPorterFee(req.getPorterFee());
					order.setShiftFee(req.getShiftFee());
					order.setDescription(req.getDescription());
//					order.setTransactionType(req.getTransactionType());
					order.setCreatedDate(new Date());
					order.setTruckInfo(truckInfo);
					
					ordersTruckingDAO.save(order);
					response.setCode(IConstant.RESP_CODE.SUCCESS);
					response.setMsg(getText("order.add.success"));
					// send email
					String urlOrderDetail = env.getProperty("url.order.trucking.detail") + order.getId();
					emailService.createOrderTruckingNotifyEmail(urlOrderDetail, order, account.getUsername());
					// send email to owner
					Account owner = accountDAO.findOne(truckInfo.getTruck().getOwnerTruckId());
					emailService.createOwnerOrderTruckingNotifyEmail(urlOrderDetail, order, owner.getUsername());
					
					return response;
				}else{
					// shipment is not exist
					response.setCode(IConstant.RESP_CODE.FAIL);
					response.setMsg(getText("trucking.exist.not"));
					return response;
				}
			}else{
				response.setCode(IConstant.RESP_CODE.FAIL);
				response.setMsg(getText("trucking.exist.not"));
				return response;
			}
			
		} catch (Exception e) {
			response.setCode(IConstant.RESP_CODE.FAIL);
			response.setMsg(getText("system.error"));
			log.error("[EXCEPTION] addTruckingOrder", e);
		}
		log.info("[END] addTruckingOrder");
		return response;
	}
	
	@RequestMapping("/getOrderTruckingDetailByOrderId")
	@ResponseBody
	public Map<String, Object> getOrderTruckingDetailByOrderId(@RequestParam(value="orderId") Integer orderId) throws JsonProcessingException {
		log.info("[Start] getOrderTruckingDetailByOrderId");
		if(orderId == null)
			return null;
		log.info("orderId=" + orderId);
		Map<String, Object> map = new HashMap<String, Object>();
		
		OrdersTrucking order = ordersTruckingDAO.findOne(orderId);
		map.put("order", order);
		TruckInfoDetail truckInfo = null;
		if(order != null){
			truckInfo = truckInfoDAO.findOne(order.getEventId());
			map.put("truckInfo", truckInfo);
		}
		log.info("[End] getOrderTruckingDetailByOrderId");
		return map;
	}
	
	@RequestMapping("/getOrderShipmentDetailByOrderId")
	@ResponseBody
	public Map<String, Object> getOrderShipmentDetailByOrderId(@RequestParam(value="orderId") Integer orderId) throws JsonProcessingException {
		log.info("[Start] getOrderShipmentDetailByOrderId");
		if(orderId == null)
			return null;
		log.info("orderId=" + orderId);
		Map<String, Object> map = new HashMap<String, Object>();
		
		OrdersShipment order = ordersShipmentDAO.findOne(orderId);
		map.put("order", order);
		Shipment shipment = null;
		if(order != null){
			shipment = shipmentDAO.findOne(order.getEventId());
			map.put("shipment", shipment);
		}
		log.info("[End] getOrderShipmentDetailByOrderId");
		return map;
	}
	
	@RequestMapping("/deleteOrderTrucking")
	@ResponseBody
	public AjaxResponseBody deleteOrderTrucking(@RequestBody Integer orderId) {
		log.info("[Start] deleteOrderTrucking ");
		AjaxResponseBody reponseBody = new AjaxResponseBody();
		OrdersTrucking order = ordersTruckingDAO.findOne(orderId);
		try {
			if(order == null){
				// order is not exist
				reponseBody.setCode(IConstant.RESP_CODE.FAIL);
				reponseBody.setMsg(getText("order.exits.not"));
			}
			// check permission
			if(checkPermissionOrderTrucking(order)){
				// to delete
				ordersTruckingDAO.delete(orderId);
				reponseBody.setCode(IConstant.RESP_CODE.SUCCESS);
				reponseBody.setMsg(getText("delete.success"));
			}else{
				// account do not have permission
				reponseBody.setCode(IConstant.RESP_CODE.FAIL);
				reponseBody.setMsg(getText("403.error"));
			}
		
		} catch (Exception e) {
			log.error("", e);
			reponseBody.setCode(IConstant.RESP_CODE.FAIL);
			reponseBody.setMsg(getText("delete.fail"));
		}
		log.info("[End] deleteOrderTrucking ");
		return reponseBody;
	}
	
	@RequestMapping("/deleteOrderShipment")
	@ResponseBody
	public AjaxResponseBody deleteOrderShipment(@RequestBody Integer orderId) {
		log.info("[Start] deleteOrderShipment ");
		AjaxResponseBody reponseBody = new AjaxResponseBody();
		OrdersShipment order = ordersShipmentDAO.findOne(orderId);
		try {
			if(order == null){
				// order is not exist
				reponseBody.setCode(IConstant.RESP_CODE.FAIL);
				reponseBody.setMsg(getText("order.exits.not"));
			}
			// check permission
			if(checkPermissionOrderShipment(order)){
				// to delete
				ordersShipmentDAO.delete(orderId);
				reponseBody.setCode(IConstant.RESP_CODE.SUCCESS);
				reponseBody.setMsg(getText("delete.success"));
			}else{
				// account do not have permission
				reponseBody.setCode(IConstant.RESP_CODE.FAIL);
				reponseBody.setMsg(getText("403.error"));
			}
			
		} catch (Exception e) {
			log.error("", e);
			reponseBody.setCode(IConstant.RESP_CODE.FAIL);
			reponseBody.setMsg(getText("delete.fail"));
		}
		log.info("[End] deleteOrderShipment ");
		return reponseBody;
	}
	
	public boolean checkPermissionOrderShipment(OrdersShipment order) {
		boolean isValid = false;
		try {
			Account account = getCurrentAccount();
			
			if(account == null) return false;
			// check is role owner
			if(order.getOwnerId().intValue() == account.getId()){
				return true;
			}
			// check is role admin
			UserRole role = userRoleDAO.findByUser(account);
    		if(role!=null && IConstant.ROLE.ROLE_ADMIN.equalsIgnoreCase(role.getRole())){
    			return true;
    		}
		} catch (Exception e) {
			log.error("", e);
		}
		return isValid;
	}
	
	public boolean checkPermissionOrderTrucking(OrdersTrucking order) {
		boolean isValid = false;
		try {
			Account account = getCurrentAccount();
			
			if(account == null) return false;
			// check is role owner
			if(order.getOwnerId().intValue() == account.getId()){
				return true;
			}
			// check is role admin
			UserRole role = userRoleDAO.findByUser(account);
			if(role!=null && IConstant.ROLE.ROLE_ADMIN.equalsIgnoreCase(role.getRole())){
				return true;
			}
		} catch (Exception e) {
			log.error("", e);
		}
		return isValid;
	}
}

package com.webtrucking.controller.rest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.webtrucking.controller.BaseController;
import com.webtrucking.dao.OrdersShipmentDAO;
import com.webtrucking.dao.ShipmentDAO;
import com.webtrucking.dao.userDAO;
import com.webtrucking.entity.OrdersShipment;
import com.webtrucking.entity.Shipment;
import com.webtrucking.entity.User;
import com.webtrucking.json.entity.AjaxResponseBody;
import com.webtrucking.json.entity.OrderRequest;
import com.webtrucking.json.entity.SearchOrderingRequest;
import com.webtrucking.services.EmailService;
import com.webtrucking.util.DateUtils;
import com.webtrucking.util.IConstant;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/rest_product")
public class ProductRestController extends BaseController{
	static Logger log = Logger.getLogger(ProductRestController.class);
	private static SimpleDateFormat sdf = new SimpleDateFormat(DateUtils.ddMMyyyy_SLASH);
	
	@Autowired
	private userDAO userDAO;
	
	@Autowired
	private OrdersShipmentDAO ordersShipmentDAO;
	
	@Autowired
	private ShipmentDAO shipmentDAO;
	
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
		User account = getCurrentAccount();
		log.info("provinceTo = " + provinceTo + ", provinceFrom = " + provinceFrom + ""
						+ ", orderType = " + orderType + "goodsType=" + goodsType + 
						", fromDate=" + fromDate + ", postDate=" + postDate);
		log.info("searching...");
		list = ordersShipmentDAO.searchShipmentOrders(provinceTo, provinceFrom, goodsType, fromDate, postDate, orderType, account.getId());
		log.info("[End] getListOrderShipment");
		return list;
	}
	

	@RequestMapping("/addShipmentOrder")
	@ResponseBody
	public AjaxResponseBody addShipmentOrder(@RequestBody OrderRequest req){
		AjaxResponseBody response = new AjaxResponseBody();
		try {
			log.info("[START] addShipmentOrder");
			// get loggedd User
			User account = getCurrentAccount();
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
//			if(checkPermissionOrderShipment(order)){
//				// to delete
//				ordersShipmentDAO.delete(orderId);
//				reponseBody.setCode(IConstant.RESP_CODE.SUCCESS);
//				reponseBody.setMsg(getText("delete.success"));
//			}else{
//				// account do not have permission
//				reponseBody.setCode(IConstant.RESP_CODE.FAIL);
//				reponseBody.setMsg(getText("403.error"));
//			}
			
		} catch (Exception e) {
			log.error("", e);
			reponseBody.setCode(IConstant.RESP_CODE.FAIL);
			reponseBody.setMsg(getText("delete.fail"));
		}
		log.info("[End] deleteOrderShipment ");
		return reponseBody;
	}
	
}

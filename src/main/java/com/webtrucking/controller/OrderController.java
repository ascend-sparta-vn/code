package com.webtrucking.controller;

import com.webtrucking.dao.*;
import com.webtrucking.entity.*;
import com.webtrucking.json.entity.AjaxResponseBody;
import com.webtrucking.json.entity.SearchShipmentRequest;
import com.webtrucking.util.CacheUtil;
import com.webtrucking.util.DateUtils;
import com.webtrucking.util.IConstant;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by sonph on 16/09/16.
 */
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController{
	@Autowired
	private ShipmentDAO shipmentDAO;

	@Autowired
	OrdersDAO ordersDAO;

	@Autowired
	DeliveryDAO deliveryDAO;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private PaymenetHistoryDAO paymentHistoryDAO;

	@Autowired
	private WalletDAO walletDAO;

	static Logger log = Logger.getLogger(OrderController.class);
	private static SimpleDateFormat sdf = new SimpleDateFormat(DateUtils.ddMMyyyy_SLASH);

	@RequestMapping("/list")
	public String listOrder(Model model,
								@RequestParam(required = false) Integer page,
								@RequestParam(required = false) Integer size) {
		User currentUser = getCurrentAccount();
		List<Order> listOrder = new ArrayList<>();
		if(currentUser.getUserType() == 1) {
			listOrder = ordersDAO.findAllByOrderByCreatedTimestamp();
		} else if(currentUser.getUserType() == 2) {
			listOrder = ordersDAO.findByUserIdOrderByCreatedTimestamp(currentUser.getId());
		}
		model.addAttribute("userType", currentUser.getUserType());
		model.addAttribute("listOrder", listOrder);
		model.addAttribute("listDeliver", userDAO.findAllByUserType(4));
		return "order.list";
	}

	@RequestMapping(value = "/deliverorder", method = RequestMethod.POST)
	@ResponseBody
	public Order deliverOrder(@RequestParam(name = "order_id") Integer orderId,
											   @RequestParam(name = "user_id") Integer userId) {
		Order order = ordersDAO.findOne(orderId);
		if(userId == -1) {
			order.setStatus(1);
			deliveryDAO.deleteByOrderId(orderId);
		} else {
			DeliveryOrder deliveryOrder = new DeliveryOrder(orderId, userId);
			deliveryDAO.save(deliveryOrder);
			order.setStatus(2);
		}
		ordersDAO.save(order);
		return order;
	}

	@RequestMapping("/detail/{orderId}")
	public String detail(Model model, @PathVariable(value = "orderId") Integer orderId) {
		Order order = ordersDAO.findOne(orderId);
		model.addAttribute("order", order);

		PaymentHistory payment = new PaymentHistory();
		List<PaymentHistory> listPayment = paymentHistoryDAO.findByOrderId(orderId);
		if (!listPayment.isEmpty()) {
			payment = listPayment.get(0);
			Wallet wallet = walletDAO.findOne(payment.getWalletId());
			model.addAttribute("wallet", wallet);
		}
		return "order.detail";
	}

	@RequestMapping("/post")
	public String postTrucking(Map<String, Object> model) {
		// check login
		return "shipment.post";
	}

	@RequestMapping("/detail")
	public String detail(Map<String, Object> model) {
		// check login
		User account = getCurrentAccount();
		model.put("currAccountId", (account == null) ? -1 : account.getId());
		model.put("listProvince", CacheUtil.listProvinceCache.get("listProvince"));
		return "shipment.detail";
	}

	@RequestMapping(value = "/manage-goods", method = RequestMethod.GET)
	public String manageGoods(Model model) {
		// check login
		User account = getCurrentAccount();
		if(account == null){
			return "403";
		}
		model.addAttribute("listProvince",
				CacheUtil.listProvinceCache.get("listProvince"));
		return "manage.goods";
	}

	@RequestMapping(value = "/edit-goods/{id}", method = RequestMethod.GET)
	@SuppressWarnings("unchecked")
	public String editGoods(Model model, @PathVariable("id") int id) {
		User account = getCurrentAccount();
		Shipment goods = shipmentDAO.findOne(id);
		model.addAttribute("goods", goods);
		Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>)
				SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		Iterator iterator = authorities.iterator();
		boolean isAdmin = false;
		int approve = IConstant.MODE.NO_APPROVE;
		int edit = IConstant.MODE.NO_EDIT;
		while (iterator.hasNext()) {
			SimpleGrantedAuthority authority = (SimpleGrantedAuthority)  iterator.next();
			if(authority.getAuthority().equals(IConstant.ROLE.ROLE_ADMIN)) {
				isAdmin = true;
			}
		}
		if(!goods.getOwnerId().equals(account.getId()) && !isAdmin) {
			//redirect to exception
		}

		if(isAdmin) {
			approve = IConstant.MODE.APPROVE;
		}

		if(goods.getOwnerId().equals(account.getId())) {
			edit = IConstant.MODE.EDIT;
		}

		model.addAttribute("approve", approve);
		model.addAttribute("edit", edit);

		return "edit.goods";
	}

	@RequestMapping("/update-goods")
	@ResponseBody
	public AjaxResponseBody updateGoods(@RequestBody SearchShipmentRequest requestData) {
		log.info("[Begin] updateGoods");
		AjaxResponseBody response = new AjaxResponseBody();
		try {
			Shipment goods = shipmentDAO.findOne(requestData.getId());
			goods.setAgency(requestData.getAgency());
			goods.setCode(requestData.getCode());
			goods.setName(requestData.getName());
			goods.setDealTypeId(requestData.getDealType());
			goods.setGoodsTypeId(requestData.getGoodsTypeId());
			goods.setDistance(requestData.getDistance());
			goods.setStartDate(sdf.parse(requestData.getStartDate()));
			goods.setExpiredDate(sdf.parse(requestData.getExpiredDate()));
			goods.setFromDetailAddress(requestData.getFromDetailAddress());
			goods.setToDetailAddress(requestData.getToDetailAddress());
			goods.setPrice(requestData.getPrice());
			goods.setPriceUnit(requestData.getPriceUnit());
			goods.setWeight(requestData.getWeight());
			goods.setWeightUnit(requestData.getWeightUnit());

			shipmentDAO.save(goods);
			response.setMsg("Update successfull");
			response.setCode(IConstant.RESP_CODE.SUCCESS);
		} catch (Exception e) {
			log.info("[Exception] updateGoods" + e.getMessage());
			response.setMsg("Update fail");
			response.setCode(IConstant.RESP_CODE.FAIL);
		}
		return response;
	}

	@RequestMapping(value = "/approve-goods/{id}/{status}", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResponseBody approveGoods(Model model, @PathVariable("id") int id,
										 @PathVariable("status") int status) {
		AjaxResponseBody response = new AjaxResponseBody();
		try {
			Shipment goods = shipmentDAO.findOne(id);
			goods.setStatus(status);
			shipmentDAO.save(goods);

			if(status == IConstant.MODE.APPROVE) {
				response.setMsg(getText("approve.sucess"));
			} else {
				response.setMsg(getText("cancel.success"));
			}

			response.setCode(IConstant.RESP_CODE.SUCCESS);
		} catch (Exception e) {
			if(status == IConstant.MODE.APPROVE) {
				response.setMsg(getText("approve.fail"));
			} else {
				response.setMsg(getText("cancel.fail"));
			}
			response.setCode(IConstant.RESP_CODE.FAIL);
		}

		return response;
	}


	@RequestMapping(value = "/delete-goods/{id}", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResponseBody deleteGoods(Model model, @PathVariable("id") int id) {
		AjaxResponseBody response = new AjaxResponseBody();
		try {
			shipmentDAO.delete(id);
			response.setMsg(getText("delete.success"));
			response.setCode(IConstant.RESP_CODE.SUCCESS);
		} catch (Exception e) {
			response.setMsg(getText("delete.fail"));
			response.setCode(IConstant.RESP_CODE.FAIL);
		}

		return response;
	}

}

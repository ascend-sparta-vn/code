package com.webtrucking.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webtrucking.dao.GoodsTypeDAO;
import com.webtrucking.dao.TruckDAO;
import com.webtrucking.dao.TruckInfoDetailDAO;
import com.webtrucking.dao.TruckTypeDAO;
import com.webtrucking.entity.Account;
import com.webtrucking.entity.GoodsType;
import com.webtrucking.entity.Truck;
import com.webtrucking.entity.TruckInfoDetail;
import com.webtrucking.entity.TruckType;
import com.webtrucking.json.entity.AjaxResponseBody;
import com.webtrucking.json.entity.LeftFilterEntity;
import com.webtrucking.json.entity.SearchTruckingRequest;
import com.webtrucking.util.CacheUtil;
import com.webtrucking.util.DateUtils;
import com.webtrucking.util.IConstant;

/**
 * Created by sonph on 16/09/16.
 */
@Controller
@RequestMapping("/trucking")
public class TruckingController extends BaseController{
	@Autowired
	private TruckInfoDetailDAO truckInfoDetailDAO;
	
	@Autowired
	private TruckDAO truckDAO;
	
	@Autowired
	private GoodsTypeDAO goodTypesDAO;
	
	@Autowired
	private TruckTypeDAO truckTypeDAO;
	
	private static SimpleDateFormat sdf = new SimpleDateFormat(DateUtils.ddmmYY_NO_SLASH);
	static Logger log = Logger.getLogger(TruckingController.class);
	@RequestMapping("/list-trucking1")
	public String listTrucking(Map<String, Object> model) {	
		model.put("listProvince", CacheUtil.listProvinceCache.get("listProvince"));
		return "list-trucking";
	}
	
	
	@RequestMapping("/list-trucking")
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
		
		
		
		
		return "list-trucking1";
	}
	
	
	
	@RequestMapping("/searchTrucking")
	public String searchTrucking(Map<String, Object> model) {
		// check login
		return "list-trucking";
	}
	
	@RequestMapping("/post")
	public String postTrucking(Map<String, Object> model) {	
//		// check login
		return "trucking.post";
	}
	
	@RequestMapping("/detail")
	public String detail(Map<String, Object> model) {	
		// check login
		Account account = getCurrentAccount();
		model.put("currAccountId", (account == null) ? -1 : account.getId());
		model.put("listProvince", CacheUtil.listProvinceCache.get("listProvince"));
		return "trucking.detail";
	}
	
	@RequestMapping("/manage-trucking")
	public String manageTrucking(Map<String, Object> model) {	
		// check login
		Account account = getCurrentAccount();
		if(account == null){
			return "403";
		}
		
		model.put("listProvince", CacheUtil.listProvinceCache.get("listProvince"));
		return "manage.goods.trucking";
	}
	
	/**@author ThanhNV
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit-goods-trucking/{id}", method = RequestMethod.GET)
	@SuppressWarnings("unchecked")
	public String editGoodsTrucking(Model model, @PathVariable("id") int id) {
		Account account = getCurrentAccount();
		TruckInfoDetail trucking = truckInfoDetailDAO.findOne(id);
		model.addAttribute("trucking", trucking);
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
		if(!trucking.getTruck().getOwnerTruckId().equals(account.getId()) && !isAdmin) {
			//redirect to exception
		}
		
		if(isAdmin) {
			approve = IConstant.MODE.APPROVE;
		}
		
		if(trucking.getTruck().getOwnerTruckId().equals(account.getId())) {
			edit = IConstant.MODE.EDIT;
		}
		
		//set trucks of owner
		List<Truck> trucks = truckDAO.getListTruckByOwner(trucking.getTruck().getOwnerTruckId());
		
		model.addAttribute("trucks", trucks);
		model.addAttribute("approve", approve);
		model.addAttribute("edit", edit);
		
		return "edit.goods.trucking";
	}
	
	@RequestMapping("/update-goods-trucking")
	@ResponseBody
	public AjaxResponseBody updateGoodsTrucking( @RequestBody SearchTruckingRequest truckInfo) {
		log.info("[Begin] updateGoods");
		AjaxResponseBody response = new AjaxResponseBody();
		try {
			TruckInfoDetail truckInfoDetail = truckInfoDetailDAO.findOne(truckInfo.getId());
			
			truckInfoDetail.setAgency(truckInfo.getAgency());
			truckInfoDetail.setDescription(truckInfo.getDescription());
			truckInfoDetail.setFromDistrict(truckInfo.getFromDistrict());
			truckInfoDetail.setToDistrict(truckInfo.getToDistrict());
			truckInfoDetail.setExpiredDate(sdf.parse(truckInfo.getExpiredDate()));
			truckInfoDetail.setDistance(truckInfo.getDistance());
			truckInfoDetail.setWeightUnit(truckInfo.getWeightUnit());
			truckInfoDetail.setWeightString(truckInfo.getWeightString());
			truckInfoDetail.setFromDetailAddress(truckInfo.getFromDetailAddress());
			truckInfoDetail.setToDetailAddress(truckInfo.getToDetailAddress());
			truckInfoDetail.setTruckId(truckInfo.getTruckId());
			truckInfoDetail.setStartDate(sdf.parse(truckInfo.getStartDate()));
			truckInfoDetail.setGoodsTypeId(truckInfo.getGoodsTypeId());
			truckInfoDetail.setPrice(truckInfo.getPrice());
			truckInfoDetail.setPriceUnit(truckInfo.getPriceUnit());
			
			truckInfoDetailDAO.save(truckInfoDetail);
			response.setMsg("Update successfull");
			response.setCode(IConstant.RESP_CODE.SUCCESS);
		} catch (Exception e) {
			log.info("[Exception] updateGoods" + e.getMessage());
			response.setMsg("Update fail");
			response.setCode(IConstant.RESP_CODE.FAIL);
		}
		return response;
	}
	
	
	@RequestMapping(value = "/approve-goods-trucking/{id}/{status}", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResponseBody approveGoodsTrucking(Model model, @PathVariable("id") int id,
			@PathVariable("status") int status) {
		AjaxResponseBody response = new AjaxResponseBody();
		try {
			TruckInfoDetail truck = truckInfoDetailDAO.findOne(id);
			truck.setStatus(status);
			truckInfoDetailDAO.save(truck);
			
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
	
	
	@RequestMapping(value = "/delete-goods-trucking/{id}", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResponseBody deleteGoods(Model model, @PathVariable("id") int id) {
		AjaxResponseBody response = new AjaxResponseBody();
		try {
			truckInfoDetailDAO.delete(id);
			response.setMsg(getText("delete.success"));
			response.setCode(IConstant.RESP_CODE.SUCCESS);
		} catch (Exception e) {
			response.setMsg(getText("delete.fail"));
			response.setCode(IConstant.RESP_CODE.FAIL);
		}
		
		return response;
	}
	
}

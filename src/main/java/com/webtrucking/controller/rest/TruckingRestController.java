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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.webtrucking.controller.BaseController;
import com.webtrucking.dao.AccountDAO;
import com.webtrucking.dao.TruckDAO;
import com.webtrucking.dao.TruckInfoDetailDAO;
import com.webtrucking.entity.Account;
import com.webtrucking.entity.LocationTrackingObject;
import com.webtrucking.entity.Truck;
import com.webtrucking.entity.TruckInfoDetail;
import com.webtrucking.json.entity.AddTruck;
import com.webtrucking.json.entity.AjaxResponseBody;
import com.webtrucking.json.entity.SearchTruckingRequest;
import com.webtrucking.services.EmailService;
import com.webtrucking.services.LocationServices;
import com.webtrucking.util.DateUtils;
import com.webtrucking.util.IConstant;

@RestController
@RequestMapping("/rest_trucking")
public class TruckingRestController extends BaseController{
	static Logger log = LogManager.getLogger(TruckingRestController.class);
	private static SimpleDateFormat sdf = new SimpleDateFormat(DateUtils.ddMMyyyy_SLASH);
	
	@Autowired
	private TruckDAO truckDAO;
	
	@Autowired
	private AccountDAO accountDAO;
	
	@Autowired
	private TruckInfoDetailDAO truckInfoDetailDAO;
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	private Environment env;
	
	@Autowired
	private LocationServices locationService;
	
	@RequestMapping("/getListTrucking")
	@ResponseBody
	public Map<String, Object> getListTrucking(@RequestBody SearchTruckingRequest requestData) throws JsonProcessingException {
		log.info("[Start] getListTrucking");
		Map<String, Object> model = new HashMap<String, Object>();
		List<TruckInfoDetail> list  = new ArrayList<TruckInfoDetail>();
		Integer provinceTo = requestData.getToProvince();
		Integer provinceFrom = requestData.getFromProvince();
		Integer districtTo = requestData.getToDistrict();
		Integer districtFrom = requestData.getFromDistrict();
		int truckType = requestData.getTruckType();
		int goodsType = requestData.getGoodsTypeId();
		String fromDate = requestData.getStartDate();
		String postDate = requestData.getPostDate();
		Integer pageSize = requestData.getPageSize();
		Integer currentPage = requestData.getCurrentPage();
		if (currentPage == null) currentPage = 1;
		if (pageSize == null) pageSize = 10;
		
		Integer start = (currentPage -1) * pageSize;
		Integer end = currentPage * pageSize;
		log.info("provinceTo = " + provinceTo + ", provinceFrom = " + provinceFrom + ""
				+ ", districtTo = " + districtTo + ", districtFrom = " + districtFrom + ""
						+ ", truckType = " + truckType + "goodsType=" + goodsType + 
						", fromDate=" + fromDate + ", postDate=" + postDate);
		log.info("searching...");
		
		Integer total = truckInfoDetailDAO.countResult(provinceTo, provinceFrom, districtTo, districtFrom, truckType, goodsType, fromDate, postDate);
		if(total != null) {
			model.put("total", total);
		} else {
			model.put("total", 0);
		}
		
		
		list = truckInfoDetailDAO.searchTruckInfoDetail(provinceTo, provinceFrom, districtTo
				, districtFrom, truckType, goodsType, fromDate, postDate, start, end);
		model.put("listTrucking", list);
		
		log.info("[End] getListTrucking");
		return model;
	}
	
//	@RequestMapping("/getListTrucking1")
//	@ResponseBody
//	public List<TruckInfoDetail> getListTrucking1(@RequestBody SearchTruckingRequest requestData) throws JsonProcessingException {
//		log.info("[Start] getListTrucking");
//		Map<String, Object> model = new HashMap<String, Object>();
//		//List<TruckInfoDetail> list  = new ArrayList<TruckInfoDetail>();
//		Integer provinceTo = requestData.getToProvince();
//		Integer provinceFrom = requestData.getFromProvince();
//		Integer districtTo = requestData.getToDistrict();
//		Integer districtFrom = requestData.getFromDistrict();
//		int truckType = requestData.getTruckType();
//		int goodsType = requestData.getGoodsTypeId();
//		String fromDate = requestData.getStartDate();
//		String postDate = requestData.getPostDate();
//		Integer pageSize = requestData.getPageSize();
//		Integer size = requestData.getPageSize();
//		Integer page = requestData.getCurrentPage();
//		Integer currentPage = requestData.getCurrentPage();
//		log.info("provinceTo = " + provinceTo + ", provinceFrom = " + provinceFrom + ""
//				+ ", districtTo = " + districtTo + ", districtFrom = " + districtFrom + ""
//						+ ", truckType = " + truckType + "goodsType=" + goodsType + 
//						", fromDate=" + fromDate + ", postDate=" + postDate);
//		log.info("searching...");
//		
//		Pageable pageRequest = createPageRequest(page, size, "truck_id");
//		//Page<TruckInfoDetail> totalRecord = truckInfoDetailDAO.findAll(pageRequest);
//		//List<TruckInfoDetail> searchResultPage = truckInfoDetailDAO.searchTruckInfoDetail(provinceTo, provinceFrom, districtTo, districtFrom, truckType, goodsType, fromDate, postDate);
//		//Page<TruckInfoDetail> result = TodoMapper.mapEntityPageIntoDTOPage(searchResultPage, pageRequest);
//		
//		//Pageable pageRequest, Page<TruckInfoDetail> source
//		
//		//Integer total = truckInfoDetailDAO.countResult(provinceTo, provinceFrom, districtTo, districtFrom, truckType, goodsType, fromDate, postDate);
//		//model.put("total", total);
//		
//		
////		list = truckInfoDetailDAO.searchTruckInfoDetail(provinceTo, provinceFrom, districtTo
////				, districtFrom, truckType, goodsType, fromDate, postDate);
////		model.put("listTrucking", list);
//		
//		log.info("[End] getListTrucking");
//		return searchResultPage;
//	} 
	
	
	@RequestMapping("/searchTrucking")
	@ResponseBody
	public List<TruckInfoDetail> searchTrucking(
			  @RequestParam(value="fromProvince") String fromProvince
			, @RequestParam(value="toProvince") String toProvince
			, @RequestParam(value="goodsTypeId") String goodsTypeId
			, @RequestParam(value="fromDate") String fromDate
			) throws JsonProcessingException {
		log.info("[Start] getListTrucking");
		List<TruckInfoDetail> list  = new ArrayList<TruckInfoDetail>();
		log.info("toProvince = " + toProvince + ", fromProvince = " + fromProvince
					+ ", goodsTypeId" + goodsTypeId
					+ ", fromDate=" + fromDate);
		log.info("searching...");
//		list = truckInfoDetailDAO.searchTruckInfoDetail(Integer.parseInt(toProvince), Integer.parseInt(fromProvince), -1
//				, -1, -1, Integer.parseInt(goodsTypeId), fromDate, "");
		
		log.info("[End] getListTrucking");
		return list;
	}
	
	@RequestMapping("/getListTruckingByOwnerId/")
	public List<Truck> getListTruckingByOwnerId(){
		List<Truck> listTruck = new ArrayList<Truck>();
		try {
			Account account = getCurrentAccount();
			if(account == null){
				return listTruck;
			}
			listTruck = truckDAO.getListTruckByOwner(account.getId());
		} catch (Exception e) {
			log.error(e);
		}
		return listTruck;
	}
	
	@RequestMapping("/getTruckingById")
	public Map<String, Object> getTruckingById(@RequestParam(value="truckId") Integer truckId) throws JsonProcessingException {
		log.info("[Start] detail");
		Map<String, Object> model = new HashMap<String, Object>();
		if(truckId == null){
			model.put("trucking", null);
			model.put("prevTrucking", null);
			model.put("nextTrucking", null);
			return model;
		}
		TruckInfoDetail trucking = null;
		log.info("truckId=" + truckId);
		trucking = truckInfoDetailDAO.findOne(truckId);
		List<Object[]> prevNextShipmentId = truckInfoDetailDAO.getPrevNextTruckingId(truckId);
		Integer prevId = null;
		Integer nextId = null;
		if(prevNextShipmentId != null && prevNextShipmentId.size() > 0){
			prevId = (Integer) prevNextShipmentId.get(0)[0];
			nextId = (Integer) prevNextShipmentId.get(0)[1];
		}
		
		model.put("trucking", trucking);
		model.put("prevTrucking", prevId);
		model.put("nextTrucking", nextId);
		
		log.info("[End] detail");
		return model;
	}
	
	@RequestMapping("/getCurrentLocation")
	public Map<String, Object> getCurrentLocation(@RequestParam(value="plateNumber") String plateNumber) throws JsonProcessingException {
		log.info("[Start] getCurrentLocation");
		Map<String, Object> model = new HashMap<String, Object>();
		if(plateNumber == null || plateNumber == ""){
			model.put("location", null);
			return model;
		}
		LocationTrackingObject location = null;
		log.info("plateNumber=" + plateNumber);
		location = locationService.getCurrentLocation(plateNumber);
		
		model.put("location", location);
		
		log.info("[End] getCurrentLocation");
		return model;
	}
	
	@RequestMapping("/addTruckingPost")
	@ResponseBody
	public AjaxResponseBody addTruckingPost(@RequestBody SearchTruckingRequest requestData){
		AjaxResponseBody response = new AjaxResponseBody();
		try {
			// get loggedd User
				TruckInfoDetail detail = new TruckInfoDetail();
				detail.setTruckId(requestData.getTruckId());
				detail.setFromDistrict(requestData.getFromDistrict());
				detail.setToDistrict(requestData.getToDistrict());
				detail.setGoodsTypeId(requestData.getGoodsTypeId());
				detail.setPrice(requestData.getPrice());
				detail.setDescription(requestData.getDescription());
				
				String startDate = requestData.getStartDate();
				if(startDate != null && !startDate.isEmpty()){
					detail.setStartDate(sdf.parse(startDate));
				}
				
				String postDate = requestData.getPostDate();
				if(postDate != null && !postDate.isEmpty()){
					detail.setPostDate(sdf.parse(postDate));
				}
				// approve date
				
				String expireDate = requestData.getExpiredDate();
				if(expireDate != null && !expireDate.isEmpty()){
					detail.setExpiredDate(sdf.parse(expireDate));
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
				detail.setTitle(requestData.getTitle());
				
				truckInfoDetailDAO.save(detail);
				response.setCode(IConstant.RESP_CODE.SUCCESS);
				response.setMsg(getText("trucking.add.success"));
				// send email to sender
				String urlTruckingDetail = env.getProperty("url.trucking.detail") + detail.getId();
				emailService.createTruckingPostNotifyEmail(urlTruckingDetail, detail);
				
		} catch (Exception e) {
			response.setCode(IConstant.RESP_CODE.FAIL);
			response.setMsg(getText("trucking.add.fail"));
		}
		
		return response;
	}
	
	@RequestMapping("/addNewTrucking")
	@ResponseBody
	public AjaxResponseBody addNewTrucking(@RequestBody AddTruck req){
		AjaxResponseBody response = new AjaxResponseBody();
		try {
			// get loggedd User
			Account account = getCurrentAccount();
			Truck truck = new Truck();
			truck.setOwnerTruckId(account.getId());
			truck.setTruckTypeId(req.getTruckTypeId());
			truck.setPlateNumber(req.getPlateNumber());
			truck.setStatus(req.getStatus());
			truck.setCreatedDate(new Date());
			Integer nextId = getNextAutoIncreamentTrucking();
			truck.setTruckCode(IConstant.EMAIL_PREFIX.TRUCKING + (IConstant.CFG_VALUE.TRUCK_CODE + nextId));
			// check if this truck is duplicate
			// save to db
			truckDAO.save(truck);
			response.setCode(IConstant.RESP_CODE.SUCCESS);
			response.setMsg(getText("trucking.add.success"));
		} catch (Exception e) {
			log.error(e);
			response.setCode(IConstant.RESP_CODE.SUCCESS);
			response.setMsg(getText("trucking.add.fail"));
		}
		return response;
	}
	
	/**
	 * @author ThanhNV
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping("/get-trucking-details")
	@ResponseBody
	@SuppressWarnings("unchecked")
	public List<TruckInfoDetail> getTruckingDetails() throws JsonProcessingException {
		log.info("[Start] getTruckingDetails");
		List<TruckInfoDetail> list  = new ArrayList<TruckInfoDetail>();
		try {
			UserDetails userDetail = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			List<Account> accounts = accountDAO.findAccountByUsername(userDetail.getUsername());
			Account account = accounts.get(0);
			
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
				list = (List<TruckInfoDetail>) truckInfoDetailDAO.findAll();
			} else {
				list = truckInfoDetailDAO.getTruckingDetailsByOwner(account.getId());
			}
			
		} catch (Exception e) {
			log.error("Can not get trucking details by account");
		}
		
		log.info("[End] getTruckingDetails");
		return list;
	}
	
	
	
}

package com.webtrucking.controller.rest;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.webtrucking.dao.DealTypeDAO;
import com.webtrucking.dao.DistrictDAO;
import com.webtrucking.dao.GoodsTypeDAO;
import com.webtrucking.dao.ProvinceDAO;
import com.webtrucking.dao.TruckTypeDAO;
import com.webtrucking.entity.DealType;
import com.webtrucking.entity.District;
import com.webtrucking.entity.GoodsType;
import com.webtrucking.entity.Province;
import com.webtrucking.entity.TruckType;
import com.webtrucking.util.CacheUtil;

@RestController
@RequestMapping("/rest")
public class CommonController {
	static Logger log = LogManager.getLogger(CommonController.class);
	
	@Autowired
	private TruckTypeDAO truckTypeDAO;
	
	@Autowired
	private ProvinceDAO provinceDAO;
	
	@Autowired
	private GoodsTypeDAO goodsTypeDAO;
	
	@Autowired
	private DistrictDAO districtDAO;
	
	@Autowired
	private DealTypeDAO dealTypeDAO;
	
	@RequestMapping("/getListProvince")
	@ResponseBody
	public List<Province> getListProvince() throws JsonProcessingException {
		log.info("[Start] getListProvince");
		List<Province> listProvince = new ArrayList<Province>();
		try {
			List<Province> provinceCache = CacheUtil.listProvinceCache.get("listProvince");
			if(provinceCache == null)
				listProvince = (List<Province>) provinceDAO.findAll();
			else
				listProvince = provinceCache;
			
		} catch (Exception e) {
			log.error("", e);
		}
		log.info("[End] getListProvince");
		return listProvince;
	}
	
	@RequestMapping("/getListDistrictByProvinceId")
	@ResponseBody
	public List<District> getListDistrictByProvinceId(@Param("provinceId") Integer provinceId) throws JsonProcessingException {
		log.info("[Start] getListDistrictByProvinceId");
		List<District> listDistrict = new ArrayList<District>();
		try {
			listDistrict = (List<District>) districtDAO.getListDistrictByProvinceId(provinceId);
		} catch (Exception e) {
			log.error("", e);
		}
		log.info("[End] getListDistrictByProvinceId");
		return listDistrict;
	}
	
	@RequestMapping("/getListTruckType")
	@ResponseBody
	public List<TruckType> getListTruckType() throws JsonProcessingException {
		log.info("[Start] getListTruckType");
		List<TruckType> list = new ArrayList<TruckType>();
		try {
			list = (List<TruckType>) truckTypeDAO.findAll();
		} catch (Exception e) {
			log.error("", e);
		}
		log.info("[End] getListTruckType");
		return list;
	}
	
	@RequestMapping("/getListDealType")
	@ResponseBody
	public List<DealType> getListDealType() throws JsonProcessingException {
		log.info("[Start] getListDealType");
		List<DealType> list = new ArrayList<DealType>();
		try {
			list = (List<DealType>) dealTypeDAO.findAll();
		} catch (Exception e) {
			log.error("", e);
		}
		log.info("[End] getListDealType");
		return list;
	}
	
	@RequestMapping("/getListGoodsType")
	@ResponseBody
	public List<GoodsType> getListGoodsType() throws JsonProcessingException {
		log.info("[Start] getListGoodsType");
		List<GoodsType> list = new ArrayList<GoodsType>();
		try {
			list = (List<GoodsType>) goodsTypeDAO.findAll();
		} catch (Exception e) {
			log.error("", e);
		}
		log.info("[End] getListGoodsType");
		return list;
	}
	
	
}

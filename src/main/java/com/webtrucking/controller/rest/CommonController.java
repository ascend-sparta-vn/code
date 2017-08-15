package com.webtrucking.controller.rest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.webtrucking.dao.DistrictDAO;
import com.webtrucking.dao.ProvinceDAO;
import com.webtrucking.entity.District;
import com.webtrucking.entity.Province;
import com.webtrucking.util.CacheUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/rest")
public class CommonController {
	static Logger log = Logger.getLogger(CommonController.class);
	
	@Autowired
	private ProvinceDAO provinceDAO;
	
	@Autowired
	private DistrictDAO districtDAO;
	
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
	

}

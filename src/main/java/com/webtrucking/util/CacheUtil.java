
package com.webtrucking.util;

import java.util.HashMap;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.webtrucking.dao.DistrictDAO;
import com.webtrucking.dao.ProvinceDAO;
import com.webtrucking.entity.District;
import com.webtrucking.entity.Province;

/**
 *
 * @author Administrator
 */
@RestController
public class CacheUtil {
    public static HashMap<String, List<Province>> listProvinceCache = new HashMap<String, List<Province>>();
    public static HashMap<String, List<District>> listDistrictCache = new HashMap<String, List<District>>();
    
    @Autowired
    private ProvinceDAO provinceDAO;
    
    @Autowired
    private DistrictDAO districtDAO;
    /**
     * @Todo Load database to memory cache
     * 
     * @Author SơnPH
     * @Date 09 July, 2014
     */
    @PostConstruct
	public void init(){
    	/*
    	 * load list province value cache 
    	 */
    	if(provinceDAO != null){
			List<Province> listProvince = (List<Province>) provinceDAO.findAll();
			if(listProvince != null){
				listProvinceCache.clear();
				listProvinceCache.put("listProvince", listProvince);
			}
    	}
    	
    	/*
    	 * load list district value cache 
    	 */
    	if(districtDAO != null){
    		List<District> listDistrict = (List<District>) districtDAO.findAll();
    		if(listDistrict != null){
    			listDistrictCache.clear();
    			listDistrictCache.put("listDistrict", listDistrict);
    		}
    	}
    }
    
}

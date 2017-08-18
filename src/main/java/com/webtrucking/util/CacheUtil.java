
package com.webtrucking.util;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.annotation.PostConstruct;

import com.webtrucking.entity.Product;
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
    public static HashMap<String, List<Integer>> listCheckoutByCustomer = new HashMap<String, List<Integer>>();
    public static HashMap<Integer, Product> listProductAdd = new HashMap<Integer, Product>();

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

    }
    
}

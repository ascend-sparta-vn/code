
package com.webtrucking.util;

import java.util.HashMap;
import java.util.List;

import javax.annotation.PostConstruct;

import com.webtrucking.entity.CheckoutProduct;
import com.webtrucking.entity.Product;
import com.webtrucking.entity.WalletCheckout;
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
    public static HashMap<String, List<CheckoutProduct>> listCheckoutByCustomer = new HashMap<String, List<CheckoutProduct>>();
    public static HashMap<String, WalletCheckout> walletCheckout = new HashMap<String, WalletCheckout>();

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

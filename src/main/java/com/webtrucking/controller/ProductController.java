package com.webtrucking.controller;

import com.webtrucking.dao.ProductDAO;
import com.webtrucking.entity.Product;
import com.webtrucking.util.CacheUtil;
import com.webtrucking.util.Common;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by sonph on 01/12/16.
 */
@Controller
@RequestMapping("/product")
public class ProductController extends BaseController{
	static Logger log = Logger.getLogger(ProductController.class);


	@Autowired
	ProductDAO productDAO;

	@RequestMapping("/list")
	public String list(Model model,
								@RequestParam(required = false) Integer page,
								@RequestParam(required = false) Integer size) {

		List<Product> listProduct = Common.toList(productDAO.findAll());

		model.addAttribute("listProduct", listProduct);
		return "product.list";
	}
	@RequestMapping("/detail/{productId}")
	public String detail(Model model, @PathVariable(value = "productId") Integer productId) {

		Product product = productDAO.findOne(productId);
		model.addAttribute("product", product);
		return "product.detail";
	}

	@RequestMapping(value = "/cart/add/{productId}", method = RequestMethod.GET)
	@ResponseBody
	public Integer addCheckout(@PathVariable(value = "productId") Integer productId) {

		Integer responseCode = 0;
		// get current userId login
		String username = getCurrentUsername();

		// put listProductId to web-app cache
		if(productId != null){
			List<Integer> listProductId = CacheUtil.listCheckoutByCustomer.get(username);
			if(listProductId == null || listProductId.size() < 1){
				listProductId = new ArrayList<>();
			}
			listProductId.add(productId);
			CacheUtil.listCheckoutByCustomer.put(username, listProductId);
			responseCode = 1;
		}
		return responseCode;

	}
	@RequestMapping("/checkout")
	public String checkout(Model model) {
		List<Product> listProductCheckout = new ArrayList<>();
		String username = getCurrentUsername();
		List<Integer> listProductId = CacheUtil.listCheckoutByCustomer.get(username);
		if(listProductId != null){
			for(Integer id : listProductId){
				Product prd = productDAO.findOne(id);
				if(prd != null){
					listProductCheckout.add(prd);
				}
			}
		}
		model.addAttribute("listProduct", listProductCheckout);
		return "product.checkout";
	}
}

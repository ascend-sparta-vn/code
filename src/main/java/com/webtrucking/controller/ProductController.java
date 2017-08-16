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
	public String detail(Model model, @PathVariable(value = "productId") Long productId) {

//		Product product = productDAO.findOne(productId);
//		model.addAttribute("product", product);
		return "product.detail";
	}

	@RequestMapping(value = "/cart/add/{productId}", method = RequestMethod.GET)
	@ResponseBody
	public void addCheckout(@PathVariable(value = "productId") Integer productId) {

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
		}

	}
	@RequestMapping("/checkout/{orderId}")
	public String checkout(Map<String, Object> model, @PathVariable(value = "orderId") Integer orderId) {


		return "product.checkout";
	}
}

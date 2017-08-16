package com.webtrucking.controller;

import com.webtrucking.util.CacheUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * Created by sonph on 01/12/16.
 */
@Controller
@RequestMapping("/product")
public class ProductController extends BaseController{
	static Logger log = Logger.getLogger(ProductController.class);

	@RequestMapping("/list")
	public String list(Map<String, Object> model,
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
		return "product.list";
	}
	@RequestMapping("/detail/{productId}")
	public String detail(Map<String, Object> model, @PathVariable(value = "productId") Integer productId) {
		return "product.detail";
	}

	@RequestMapping("/checkout/{orderId}")
	public String checkout(Map<String, Object> model, @PathVariable(value = "orderId") Integer orderId) {
		return "product.checkout";
	}
}

package com.webtrucking.controller;

import com.webtrucking.dao.ProductDAO;
import com.webtrucking.dao.WalletDAO;
import com.webtrucking.entity.*;
import com.webtrucking.util.CacheUtil;
import com.webtrucking.util.Common;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by sonph on 01/12/16.
 */
@Controller
@RequestMapping("/product")
public class ProductController extends BaseController{
	static Logger log = Logger.getLogger(ProductController.class);


	@Autowired
	ProductDAO productDAO;

	@Autowired
	WalletDAO walletDAO;

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

	@RequestMapping(value = "/cart/add/{productId}/{quantity}", method = RequestMethod.GET)
	@ResponseBody
	public Integer addCheckout(@PathVariable(value = "productId") Integer productId, @PathVariable(value = "quantity") Integer quantity) {

		Integer responseCode = 0;
		// get current userId login
		String username = getCurrentUsername();

		// put listProductId to web-app cache
		if(productId != null){
			List<CheckoutProduct> listProduct = CacheUtil.listCheckoutByCustomer.get(username);
			if(listProduct == null || listProduct.size() < 1){
				listProduct = new ArrayList<>();
			}
			boolean isExist = false;
			for(CheckoutProduct p : listProduct){
				if(p.getProductId() == productId){
					p.setQuantity(p.getQuantity() + quantity);
					isExist = true;
				}
			}
			if(!isExist)
				listProduct.add(new CheckoutProduct(productId, quantity));
			CacheUtil.listCheckoutByCustomer.put(username, listProduct);
			responseCode = 1;
		}
		return responseCode;

	}
	@RequestMapping(value = "/cart/remove/{productId}", method = RequestMethod.GET)
	@ResponseBody
	public Integer removeProductCheckout(@PathVariable(value = "productId") Integer productId) {

		Integer responseCode = 0;
		// get current userId login
		String username = getCurrentUsername();

		// put listProductId to web-app cache
		if(productId != null){
			List<CheckoutProduct> listProductCheckout = CacheUtil.listCheckoutByCustomer.get(username);
			if(listProductCheckout != null && listProductCheckout.size() > 0){
				for(CheckoutProduct cp : listProductCheckout){
					if(cp.getProductId() == productId){
						listProductCheckout.remove(cp);
						CacheUtil.listCheckoutByCustomer.put(username, listProductCheckout);
						break;
					}
				}
			}
			responseCode = 1;
		}
		return responseCode;

	}
	@RequestMapping("/checkout")
	public String checkout(Model model) {
		List<Product> listProduct = new ArrayList<>();
		String username = getCurrentUsername();
		List<CheckoutProduct> listProductCheckout = CacheUtil.listCheckoutByCustomer.get(username);
		if(listProductCheckout != null && listProductCheckout.size() > 0){
			for(CheckoutProduct p : listProductCheckout){
				Product prd = productDAO.findOne(p.getProductId());
				if(prd != null){
					prd.setQuantity(p.getQuantity());
					listProduct.add(prd);
				}
			}
		}
		model.addAttribute("listProduct", listProduct);
		return "product.checkout";
	}

	@RequestMapping(value = "/cache/invoice", method = RequestMethod.POST)
	@ResponseBody
	public String cacheInvoice(@RequestBody WalletCheckout walletCheckout, Model model) {

		if(walletCheckout != null){
			log.info(walletCheckout);
		}

		// put to cache
		String username = getCurrentUsername();
		CacheUtil.walletCheckout.put(username, walletCheckout);

		return "1";
	}
	@RequestMapping(value = "/invoice")
	public String invoice(Model model) {
		List<Product> listProduct = new ArrayList<>();
		// get wallet checkout from cache
		User user = getCurrentAccount();
		if(user == null) return "";

		WalletCheckout checkout = CacheUtil.walletCheckout.get(user.getUsername());
		List<CheckoutProduct> listProductCheckout = CacheUtil.listCheckoutByCustomer.get(user.getUsername());
		if(listProductCheckout != null && listProductCheckout.size() > 0){
			for(CheckoutProduct p : listProductCheckout){
				Product prd = productDAO.findOne(p.getProductId());
				if(prd != null){
					prd.setQuantity(p.getQuantity());
					listProduct.add(prd);
				}
			}
		}

		Wallet wallet = null;
		List<Wallet> wallets = walletDAO.findByUserId(user.getId());
		if(wallets != null & wallets.size() > 0){
			wallet = wallets.get(0);
		}

		model.addAttribute("currentUser", user);
		model.addAttribute("wallet", wallet);
		model.addAttribute("listProduct", listProduct);
		model.addAttribute("walletCheckout", checkout);

		return "product.invoice";
	}
}

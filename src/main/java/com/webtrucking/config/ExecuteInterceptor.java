package com.webtrucking.config;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.webtrucking.dao.GoodsTypeDAO;
import com.webtrucking.dao.ShipmentDAO;
import com.webtrucking.dao.TruckDAO;
import com.webtrucking.dao.TruckInfoDetailDAO;
import com.webtrucking.dao.TruckTypeDAO;
import com.webtrucking.entity.GoodsType;
import com.webtrucking.entity.TruckType;
import com.webtrucking.json.entity.LeftFilterEntity;

@Service
public class ExecuteInterceptor extends HandlerInterceptorAdapter{

	static Logger log = Logger.getLogger(ExecuteInterceptor.class);
	
	@Autowired
	private TruckInfoDetailDAO truckInfoDetailDAO;

	@Autowired
	private ShipmentDAO shipmentDAO;
	
	@Autowired
	private TruckDAO truckDAO;
	
	@Autowired
	private GoodsTypeDAO goodTypesDAO;
	
	@Autowired
	private TruckTypeDAO truckTypeDAO;

	//before the actual handler will be executed
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	    throws Exception {
		
		//do something here
		//log.info("preHandle...");
		//test commit

		return true;
	}

	//after the handler is executed
	public void postHandle(
		HttpServletRequest request, HttpServletResponse response,
		Object handler, ModelAndView modelAndView)
		throws Exception {
		//log.info("postHandle...");
		if(modelAndView != null) {
			//gen left menu
			List<LeftFilterEntity> listGoods = new ArrayList<LeftFilterEntity>();
			List<GoodsType> allTypes = (List<GoodsType>) goodTypesDAO.findAll();
			for(GoodsType goodsType : allTypes) {
				LeftFilterEntity a = new LeftFilterEntity();
				a.setId(goodsType.getId());
				a.setFilter(goodsType.getName());
				a.setQuantity(shipmentDAO.countByGoodsTypeId(goodsType.getId()));
				listGoods.add(a);
			}
			modelAndView.addObject("listGoods", listGoods);
			
			
			List<LeftFilterEntity> listTruckTypes = new ArrayList<LeftFilterEntity>();
			List<TruckType> truckTypeAll = (List<TruckType>) truckTypeDAO.findAll();
			for(TruckType truckType : truckTypeAll) {
				LeftFilterEntity a = new LeftFilterEntity();
				a.setId(truckType.getId());
				a.setFilter(truckType.getName());
				a.setQuantity(truckInfoDetailDAO.countByTruckTypeId(truckType.getId()));
				listTruckTypes.add(a);
			}
			modelAndView.addObject("listTruckTypes", listTruckTypes);
		}
	}
}

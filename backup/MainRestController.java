package com.webtrucking.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.webtrucking.dao.AccountDAO;
import com.webtrucking.dao.CuaDAO;
import com.webtrucking.dao.PhuKienDAO;
import com.webtrucking.dao.ThanhPhanDAO;
import com.webtrucking.dto.PhuKienDTO;
import com.webtrucking.entity.Account;
import com.webtrucking.entity.Cua;
import com.webtrucking.entity.PhuKien;
import com.webtrucking.entity.ThanhPhanPhuKien;
import com.webtrucking.form.DanhSachPhuKienForm;
import com.webtrucking.form.SearchCuaForm;
import com.webtrucking.json.entity.AddCuaAjaxEntity;
import com.webtrucking.json.entity.AjaxResponseBody;
import com.webtrucking.json.entity.UserInfo;
import com.webtrucking.services.CuaService;
import com.webtrucking.services.MainProcess;
import com.webtrucking.util.ListUtil;

@RestController
@RequestMapping("/rest")
public class MainRestController {
	static Logger log = Logger.getLogger(MainRestController.class);
	@Autowired
	PhuKienDAO phuKienDAO;

	@Autowired
	CuaDAO cuaDAO;

	@Autowired
	ThanhPhanDAO thanhPhanDAO;
	
	private MainProcess mainProcess;
	
	@Autowired
	private CuaService cuaService;
	
	@Autowired
	private AccountDAO accountDAO;
	
	public void init(){
		mainProcess = new MainProcess(phuKienDAO, cuaDAO, thanhPhanDAO);
	}

	@RequestMapping("/getDanhSachPhuKien")
	public DanhSachPhuKienForm getDanhSachPhuKien(	@RequestParam(value = "idCua") int idCua, 
													@RequestParam(value = "chieuRong") String chieuRong, 
													@RequestParam(value = "chieuDai") String chieuDai,
													@RequestParam(value = "tayNam") String tayNam
												    ) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		
		if(StringUtils.isEmpty(chieuDai)) { chieuDai = "0"; }
		if(StringUtils.isEmpty(chieuRong)) { chieuRong = "0";}
		int chieuRong_ = Integer.parseInt(chieuRong);
		int chieuDai_ = Integer.parseInt(chieuDai);
		init();
		
		DanhSachPhuKienForm form = mainProcess.getDanhSachPhuKienDTO(idCua, chieuRong_, chieuDai_, tayNam);
		return form;
	}

	@RequestMapping("/getDanhSachCua")
	public List<Cua> getDanhSachCua(@RequestBody SearchCuaForm form) throws JsonProcessingException {
		log.info("[Start] getDanhSachCua");
		List<Cua> cuaList = new ArrayList<Cua>();
		cuaList = (List<Cua>) ListUtil.makeCollection(cuaDAO.searchCua(form.getHeProfile(),form.getKieuCua(),
				form.getLoaiCua(), Integer.parseInt(form.getSoCanh()), form.getHeMo(), 
				form.getBanle(), form.getHesoAnToan()));
		log.info("[End] getDanhSachCua");
		return cuaList;
	}

	@RequestMapping("/addCua")
	public AjaxResponseBody addCua(@RequestBody AddCuaAjaxEntity requestData) {
		log.info("[Start] getDanhSachPhuKienDTO");
		AjaxResponseBody reponseBody = new AjaxResponseBody();
		try {
			String mode = requestData.getMode();
			int idCua = requestData.getIdCua();
			Cua cua = requestData.getCua();
			List<PhuKien> listPk = requestData.getListPk();
			cuaService.addCua(cua, listPk, mode, idCua);
			
			reponseBody.setCode("SUCCESS");
			reponseBody.setMsg("save successfully");
		} catch (Exception e) {
			log.error("", e);
			reponseBody.setCode("ERROR");
			reponseBody.setMsg("save fail");
		}
		
		log.info("[End] getDanhSachPhuKienDTO");
		return reponseBody;
	}
	
	@RequestMapping("/deleteCua")
	public AjaxResponseBody deleteCua(@RequestParam(value = "idCua") int idCua) {
		log.info("[Start] deleteCua");
		AjaxResponseBody reponseBody = new AjaxResponseBody();
		try {
			cuaService.deleteCua(idCua);
			reponseBody.setCode("SUCCESS");
			reponseBody.setMsg("save successfully");
		} catch (Exception e) {
			log.error("", e);
			reponseBody.setCode("ERROR");
			reponseBody.setMsg("save fail");
		}
		
		log.info("[End] deleteCua");
		return reponseBody;
	}
	
	

	@RequestMapping(value = "/getCuaById", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getCuaById(@RequestParam(value = "idCua") int idCua) {
		log.info("[Start] getCuaById");
		Map<String, Object> model = new HashMap<String, Object>();
		List<PhuKienDTO> listPhuKienDTO = new ArrayList<PhuKienDTO>();
		DanhSachPhuKienForm form = new DanhSachPhuKienForm();
		Cua cua = null;
		init();
		try {
			if(idCua != 0) {
				cua = cuaDAO.findOne(new Long(idCua));
				List<PhuKien> listPK = phuKienDAO.getAllPhuKienByIdCua(idCua);
				form = mainProcess.getDanhSachPhuKien(listPK);
			}
		} catch (Exception e) {
			log.error("", e);
		}
		
		log.info("[End] getCuaById");
		
		model.put("cua", cua);
		model.put("danhSachPhuKien", form);
		return model;
	}
	
	@RequestMapping("/getDanhSachUser")
	@ResponseBody
	public List<UserInfo> getDanhSachUser() throws JsonProcessingException {
		log.info("[Start] getDanhSachUser");
		List<Account> listAccount = new ArrayList<Account>();
		listAccount = (List<Account>) accountDAO.findAll();
		
		List<UserInfo> listUser = new ArrayList<UserInfo>();
		for(Account account : listAccount) {
			UserInfo user = new UserInfo(account);
			listUser.add(user);
		}
		
		return listUser;
	}
	
}

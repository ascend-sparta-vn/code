package com.webtrucking.controller;

import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.repository.query.Param;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.webtrucking.dao.AccountDAO;
import com.webtrucking.dao.AccountDetailDAO;
import com.webtrucking.dao.ProvinceDAO;
import com.webtrucking.dao.UserRoleDAO;
import com.webtrucking.entity.Account;
import com.webtrucking.entity.AccountDetail;
import com.webtrucking.entity.Province;
import com.webtrucking.entity.UserRole;
import com.webtrucking.json.entity.AccountInfo;
import com.webtrucking.json.entity.AjaxResponseBody;
import com.webtrucking.json.entity.ChangePassRequest;
import com.webtrucking.json.entity.MessageInfo;
import com.webtrucking.services.AccountService;
import com.webtrucking.services.EmailService;
import com.webtrucking.util.Common;
import com.webtrucking.util.IConstant;
import com.webtrucking.util.VerifyUtils;

/**
 * Created by thanhnv on 16/09/16.
 */
@Controller
@RequestMapping("/account")
@Transactional
@PropertySource("classpath:application.properties")
public class AccountController extends BaseController {
	static Logger log = Logger.getLogger(AccountController.class);
	@Autowired
	private Environment env;

	@Autowired
	private ProvinceDAO provinceDAO;

	@Autowired
	private AccountDAO accountDAO;
	
	@Autowired
	private UserRoleDAO userRoleDAO;

	@Autowired
	private AccountDetailDAO accountDetailDAO;
	
	@Autowired
	private MessageSource messageSource;
	
	@Autowired
    private EmailService emailService;
	
	@Autowired
	private AccountService accountService;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		List<Province> provinces = (List<Province>) provinceDAO.findAll();
		model.addAttribute("provinces", provinces);
		model.addAttribute("site_key", env.getProperty("site.verify.site_key"));
		return "register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(Model model, HttpServletRequest request,
			@ModelAttribute AccountInfo accountInfo) throws AddressException, MessagingException {
		
//		String capcha = request.getParameter("defaultReal");
//		Common.rpHash(capcha).equals(request.getParameter("defaultRealHash"));
//		boolean isValid = Common.rpHash(capcha).equals(request.getParameter("defaultRealHash")) ? true : false;
		
		String capcha = request.getParameter("defaultReal");
		boolean valid = Common.rpHash(capcha).equals(request.getParameter("defaultRealHash")) ? true : false;
		
        if (!valid) {
        	model.addAttribute("result", "error");
			model.addAttribute("resultMessage", getText("capcha.invalid"));
			List<Province> provinces = (List<Province>) provinceDAO.findAll();
			model.addAttribute("provinces", provinces);
        	return "register";
        }
        
		Account account = getAccount(accountInfo);
		AccountDetail accountDetail = getAccountDetail(accountInfo, null);
		accountDetailDAO.save(accountDetail);
		account.setAccountDetailId(accountDetail.getId());
		UserRole userRole = new UserRole();
		userRole.setRole(IConstant.ROLE.ROLE_CLIENT);
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();
		
		String key = md5.encodePassword(accountInfo.getEmail() + account.getPassword(), "");
		account.setKeyActive(key);
		accountDAO.save(account);
		userRole.setUser(account);
		userRoleDAO.save(userRole);
		
		// send email
		try {
			
			String urlActive = env.getProperty("url.active") + key; 
			emailService.createAccountNotifyMail(urlActive, account.getUsername());
		} catch (Exception e) {
			log.error("Can not send email active, please check configuration!");
		}

		return "redirect:/account/register-finish";
	}
	
	@RequestMapping(value = "/register-finish", method = RequestMethod.GET)
	public String registerFinish(Model model) {
		return "register.finish";
	}
	
	@RequestMapping(value = "/update-account", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResponseBody updateAccount(@RequestBody AccountInfo accountInfo) throws JsonProcessingException {
		AjaxResponseBody response = new AjaxResponseBody();
		try {
			UserDetails userDetail = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			List<Account> accounts = accountDAO.findAccountByUsername(userDetail.getUsername());
			Account account = accounts.get(0);
			AccountDetail accountDetail = accountDetailDAO.findOne(account.getAccountDetailId());
			
			accountDetail = getAccountDetail(accountInfo, accountDetail);
			accountDetailDAO.save(accountDetail);
			response.setCode(IConstant.RESP_CODE.SUCCESS);
			response.setMsg(getText("update.user.success"));
			
		} catch (Exception e) {
			response.setCode(IConstant.RESP_CODE.FAIL);
			response.setMsg(getText("update.user.fail"));
			log.error("", e);
		}
		return response;
	}
	
	@RequestMapping(value = "/account-profile", method = RequestMethod.GET)
	public String viewAccountProfile(Model model) {
		List<Province> provinces = (List<Province>) provinceDAO.findAll();
		model.addAttribute("provinces", provinces);
		System.out.println(SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		if(!SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString().equals("anonymousUser")) {
			UserDetails userDetail = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			List<Account> accounts = accountDAO.findAccountByUsername(userDetail.getUsername());
			Account account = accounts.get(0);
			model.addAttribute("account", account);
			if(account.getAccountDetailId() != null) {
				AccountDetail accountDetail = accountDetailDAO.findOne(account.getAccountDetailId());
				model.addAttribute("accountDetail", accountDetail);
			}
					
			return "account.profile";
		} else {
			return "account.login";
		}
		
	}
	
	
	@RequestMapping(value = "/change-password", method = RequestMethod.GET)
	public String login(Model model) {
		return "account.changePassword";
	}
	
	@RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
	public String forgotPass(Model model) {
		return "account.forgotPassword";
	}
	
	@RequestMapping(value = "/active/{key}", method = RequestMethod.GET)
	public String activeAccount(Model model, @PathVariable("key") String key) {
		try {
			List<Account> accounts = accountDAO.findAccountByKeyActive(key);
			if(accounts != null && accounts.size() > 0) {
				Account account = accounts.get(0);
				account.setStatus(IConstant.ACCOUNT.ACTIVE);
				accountDAO.save(account);
			} else {
				return "403";
			}
			
		} catch (Exception e) {
			log.error("Can not active account!");
		}
		return "account.active";
	}

	public Account getAccount(AccountInfo accountInfo) {
		Account account = new Account();
		account.setUsername(accountInfo.getEmail());
		account.setStatus(IConstant.ACCOUNT.INACTIVE);
		
		//md5 encoder
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();
		String password = md5.encodePassword(accountInfo.getPassword(), "");
		account.setPassword(password);
		account.setType(account.getType());
		account.setCreatedDate(new Date());

		return account;
	}

	public AccountDetail getAccountDetail(AccountInfo accountInfo, AccountDetail account) {
		if(account == null) {
			account = new AccountDetail();
			account.setEmail(accountInfo.getEmail());
		}
		
		account.setAccountBankNumber(accountInfo.getAccountBankNumber());
		account.setAccountBankName(accountInfo.getAccountBankName());
		account.setAddress(accountInfo.getAddress());
		account.setCompanyAdress(accountInfo.getCompanyAddress());
		account.setFirstName(accountInfo.getFirstname());
		account.setLastName(accountInfo.getLastName());
		account.setCompanyBussinessLicense(accountInfo.getBussinessLicense());
		account.setProvinceId(accountInfo.getProvince());
		account.setPhoneNumber(accountInfo.getMobileNumber());
		account.setCompanyDirectorName(accountInfo.getDirectorName());
		account.setGender(accountInfo.getMemberSex() + "");
		account.setCompanyIso(accountInfo.getCompanyIso() + "");
		account.setCompanyPhoneNumber(accountInfo.getCompanyRole());
		if(!accountInfo.getStartYear().trim().isEmpty()) {
			account.setCompanyStartYear(Integer.parseInt(accountInfo.getStartYear()));
		}
		
		account.setCompanyPhoneNumber(accountInfo.getCompanyPhoneNumber());
		account.setCompanyName(accountInfo.getCompanyName());
		if(!accountInfo.getTotalEmployee().trim().isEmpty()) {
			account.setCompanyEmployeeTotal(Integer.parseInt(accountInfo.getTotalEmployee()));
		}
		
		account.setBankName(accountInfo.getBankingName());
		account.setCompanyTaxCode(accountInfo.getTaxCode());
		account.setCompanyPhoneNumber(accountInfo.getCompanyPhoneNumber());
		account.setCompanyBussinessLicense(accountInfo.getCompanyIso() + "");
		account.setCompanyRole(accountInfo.getCompanyRole());
		account.setCompanyFax(accountInfo.getCompanyFax());
		account.setGoodsTrading(accountInfo.getGoodType());
		account.setTransportRequirementMonthly(accountInfo.getWeighPerMonth());
		account.setCompetenceIntro(accountInfo.getCompetenceIntro());
		account.setCreatedDate(new Date());

		return account;
	}
	
	@RequestMapping(value = "/change-pass", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResponseBody changePass(@RequestBody ChangePassRequest request) throws JsonProcessingException {
		AjaxResponseBody response = new AjaxResponseBody();
		try {
			
			//check old password
			Account account = getCurrentAccount();
			Md5PasswordEncoder md5 = new Md5PasswordEncoder();
			String password = md5.encodePassword(request.getPassword(), "");
			if(!account.getPassword().equals(password)) {
				response.setCode(IConstant.RESP_CODE.FAIL);
				response.setMsg(getText("changePass.fail.oldPassNotEqual"));
			} else {
				String newPass = md5.encodePassword(request.getNewPassword(), "");
				account.setPassword(newPass);
				accountDAO.save(account);
				response.setCode(IConstant.RESP_CODE.SUCCESS);
				response.setMsg(getText("changePass.success"));
				emailService.changePassNotification(account.getUsername());
			}
			
		} catch (Exception e) {
			response.setCode(IConstant.RESP_CODE.FAIL);
			response.setMsg(getText("changePass.fail"));
			log.error("", e);
		}
		return response;
	}
	
	@RequestMapping(value = "/forgotPass", method = RequestMethod.POST)
	public String forgotPassForm(Model model, HttpServletRequest request, @ModelAttribute MessageInfo messageInfo) throws JsonProcessingException {
		log.info("Start forgotPassForm");
		try {
			log.info("email=" + messageInfo.getEmail());
			boolean isValid = true;
			
			String capcha = request.getParameter("defaultReal");
			boolean valid = Common.rpHash(capcha).equals(request.getParameter("defaultRealHash")) ? true : false;
			if (!valid) {
	        	model.addAttribute("result", "error");
				model.addAttribute("resultMessage", "Chuỗi bảo vệ không trùng khớp");
				isValid = false;
	        }
			
			//verify EMAIL
			if(isValid) {
				if(!Common.isValidEmailAddress(messageInfo.getEmail())){
		        	model.addAttribute("result", "error");
					model.addAttribute("resultMessage", "Email không hợp lệ");
		        } else {
		        	List<Account> accounts = accountDAO.findAccountByUsername(messageInfo.getEmail());
		        	if(accounts == null || accounts.size() == 0) {
		        		model.addAttribute("result", "error");
						model.addAttribute("resultMessage", "Không tìm thấy email trên hệ thống, quý khách vui lòng kiểm tra lại tài khoản mail");
		        	} else {
		        		
		        		Account account = accounts.get(0);
		        		boolean result = accountService.forgotPassword(account);
		        		if(result) {
		        			model.addAttribute("result", "success");
		        			model.addAttribute("resultMessage", "Gửi yêu cầu thành công, vui lòng kiểm tra email để lấy lại mật khẩu");
		        		} else {
		        			model.addAttribute("result", "error");
		        			model.addAttribute("resultMessage", "Gửi yêu cầu thất bại, vui lòng liên hệ quản trị viên");
		        		}
		        	}
		        }
			}
			
		} catch (Exception e) {
			log.error("", e);
			model.addAttribute("result", "error");
			model.addAttribute("resultMessage", "Gửi tin nhắn thất bại");
		}
		
		log.info("end forgotPassForm");
		return "account.forgotPassword";
	}
	
	@RequestMapping(value = "/resetPass", method = RequestMethod.GET)
	public String resetPass(Model model, @Param("email") String email, @Param("resetKey") String resetKey) {
		log.info("[Start] resetPass");
		try {
			log.info("email = " + email);
			log.info("resetKey = " + resetKey);
			boolean result = accountService.resetPass(email, resetKey);
			if (result) {
				model.addAttribute("result", "success");
				model.addAttribute("resultMessage", getText("resetPass.success"));
			} else {
				model.addAttribute("result", "error");
				model.addAttribute("resultMessage", getText("resetPass.fail"));
			}
		} catch (Exception e) {
			log.error("", e);
		}
		
		log.info("[End] resetPass");
		return "account.resetPass.finish";
	}

}

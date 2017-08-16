package com.webtrucking.controller;

import com.webtrucking.client.TmnWalletClient;
import com.webtrucking.dao.ProvinceDAO;
import com.webtrucking.dao.UserDAO;
import com.webtrucking.entity.Province;
import com.webtrucking.json.entity.AccountInfo;
import com.webtrucking.services.EmailService;
import com.webtrucking.services.UserService;
import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by thanhnv on 16/09/16.
 */
@Controller
@RequestMapping("/test")
@Transactional
@PropertySource("classpath:application.properties")
public class TestController extends BaseController {
	static org.apache.logging.log4j.Logger log = LogManager.getLogger(TestController.class);
	@Autowired
	private Environment env;

	@Autowired
	private ProvinceDAO provinceDAO;

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private MessageSource messageSource;
	
	@Autowired
    private EmailService emailService;
	
	@Autowired
	private UserService userService;

	@Autowired
	private TmnWalletClient tmnWalletClient;

	@RequestMapping(value = "/api/{api_name}", method = RequestMethod.GET)
	public String register(@PathVariable("api_name") String apiName) {
		if (apiName == null || apiName.equals("1"))
			log.info("GetOTP: {}",tmnWalletClient.getOtp("976686535").toString());
			log.info("GetUserProfile: {}",tmnWalletClient.getUserProfiles("futoken","ios","2.0").toString());

			return "register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(Model model, HttpServletRequest request,
			@ModelAttribute AccountInfo accountInfo) throws AddressException, MessagingException {
		
//		Account_bk account = getAccount(accountInfo);
//		AccountDetail accountDetail = getAccountDetail(accountInfo, null);
//		accountDetailDAO.save(accountDetail);
//		account.setAccountDetailId(accountDetail.getId());
//		UserRole userRole = new UserRole();
//		userRole.setRole(IConstant.ROLE.ROLE_CLIENT);
//		Md5PasswordEncoder md5 = new Md5PasswordEncoder();
//
//		String key = md5.encodePassword(accountInfo.getEmail() + account.getPassword(), "");
//		account.setKeyActive(key);
//		UserDAO.save(account);
//		userRole.setUser(account);
//		userRoleDAO.save(userRole);
		
		// send email
		try {
			
//			String urlActive = env.getProperty("url.active") + key;
//			emailService.createAccountNotifyMail(urlActive, account.getUsername());
		} catch (Exception e) {
			log.error("Can not send email active, please check configuration!");
		}

		return "redirect:/account/register-finish";
	}
	
	@RequestMapping(value = "/register-finish", method = RequestMethod.GET)
	public String registerFinish(Model model) {
		return "register.finish";
	}
	
	@RequestMapping(value = "/account-profile", method = RequestMethod.GET)
	public String viewAccountProfile(Model model) {
		List<Province> provinces = (List<Province>) provinceDAO.findAll();
		model.addAttribute("provinces", provinces);
		System.out.println(SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		if(!SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString().equals("anonymousUser")) {
			UserDetails userDetail = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//			List<Account_bk> accounts = UserDAO.findAccountByUsername(userDetail.getUsername());
//			Account_bk account = accounts.get(0);
//			model.addAttribute("account", account);
//			if(account.getAccountDetailId() != null) {
//				AccountDetail accountDetail = accountDetailDAO.findOne(account.getAccountDetailId());
//				model.addAttribute("accountDetail", accountDetail);
//			}
					
			return "account.profile";
		} else {
			return "account.login";
		}
		
	}
	


}

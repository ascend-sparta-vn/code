package com.webtrucking.controller;

import com.google.gson.Gson;
import com.webtrucking.client.CommonUtil;
import com.webtrucking.client.TmnWalletClient;
import com.webtrucking.dao.ProvinceDAO;
import com.webtrucking.dao.UserDAO;
import com.webtrucking.entity.ApiConfiguration;
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

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import java.io.StringReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

	@RequestMapping(value = "/getotp/{mobno}", method = RequestMethod.GET)
	public String getotp(@PathVariable String mobno) {
		Map otp = tmnWalletClient.getOtp(mobno);
		log.info("GetOTP: {}",otp);
		log.info("Confirm: {}",tmnWalletClient.confirmOtp("123456",otp.get("otp_reference").toString(),mobno).toString());


		return "register";
	}

	@RequestMapping(value = "/buildinput", method = RequestMethod.GET)
	public String getotp() {
		tmnWalletClient.init();
		buildAllMapInput();
		return "register";
	}

	@RequestMapping(value = "/getuserprofile/{token}/{deviceos}/{appversion}", method = RequestMethod.GET)
	public String getProfile(@PathVariable String token, @PathVariable String deviceos, @PathVariable String appversion) {
		log.info("GetUserProfile: {}",tmnWalletClient.getUserProfiles(token,deviceos,appversion).toString());
		String input = "{ \"thai_id\": \"3231744035655\", \"first_name\": \"Ascend\", \"last_name\": \"Hackathon\", \"postal_code\": \"10400\", \"mobile_number\": \"0050000001\", \"device_os\": \"android\", \"password\": \"Welcome1234\", \"email\": \"ascender@gmail.com\", \"address\": \"89 AIA Dindang, Bangkok\", \"occupation\": \"แม่บ้าน\" }\n";
		Map inputMap = CommonUtil.mapFromJsonString(input);
		log.info("GetUserProfile: {}",tmnWalletClient.createProfile("futoken",inputMap));

		return "register";
	}

	@RequestMapping(value = "/createprofile", method = RequestMethod.GET)
	public String createProfile() {
		String input = "{ \"thai_id\": \"3231744035655\", \"first_name\": \"Ascend\", \"last_name\": \"Hackathon\", \"postal_code\": \"10400\", \"mobile_number\": \"0050000001\", \"device_os\": \"android\", \"password\": \"Welcome1234\", \"email\": \"ascender@gmail.com\", \"address\": \"89 AIA Dindang, Bangkok\", \"occupation\": \"แม่บ้าน\" }\n";
		Map inputMap = CommonUtil.mapFromJsonString(input);
		log.info("GetUserProfile: {}",tmnWalletClient.createProfile("futoken",inputMap));

		return "register";
	}

	@RequestMapping(value = "/api/confirmOtp", method = RequestMethod.GET)
	public String confirmOtp() {
		String input = "{ \"thai_id\": \"3231744035655\", \"first_name\": \"Ascend\", \"last_name\": \"Hackathon\", \"postal_code\": \"10400\", \"mobile_number\": \"0050000001\", \"device_os\": \"android\", \"password\": \"Welcome1234\", \"email\": \"ascender@gmail.com\", \"address\": \"89 AIA Dindang, Bangkok\", \"occupation\": \"แม่บ้าน\" }\n";
		Map inputMap = CommonUtil.mapFromJsonString(input);
		log.info("GetUserProfile: {}",tmnWalletClient.confirmOtp("futoken","otpref","976686535"));

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

	public String mapToJsonString(Map inputMap) {
		Gson gson = new Gson();
		String json = gson.toJson(inputMap);
		System.out.println(json);
		return json;
	}

	public static Map<String, Object> mapFromJsonString(String jsonObjectStr) {

		JsonReader jsonReader = Json.createReader(new StringReader(jsonObjectStr));
		JsonObject jsonResult = jsonReader.readObject();
		jsonReader.close();
		Set<String> iterator = jsonResult.keySet();
		Map<String, Object> response = new HashMap<>();
		for (String key: iterator) {
			response.put(key, jsonResult.get(key));
		}
		return response;
	}

	private static JsonObject jsonFromString(String jsonObjectStr) {

		JsonReader jsonReader = Json.createReader(new StringReader(jsonObjectStr));
		JsonObject object = jsonReader.readObject();
		jsonReader.close();

		return object;
	}

	public void buildMapInput(String result) {
		JsonObject dataJson = jsonFromString(String.valueOf(result.toString()));
		Set<String> iterator = dataJson.keySet();
		Map<String, Object> response = new HashMap<>();
		System.out.println("Map<String, Object> requestMap = new HashMap<>();");
		for (String key: iterator) {
			response.put(key, dataJson.get(key));
			System.out.println("requestMap.put(\""+key+"\","+ dataJson.get(key)+")");
		}
	}

	public void buildAllMapInput() {
		Map<Integer, ApiConfiguration> a = tmnWalletClient.getApiConfigurations();
		String request;
		String name;
		for (ApiConfiguration apiConfig: a.values()
			 ) {
			request = apiConfig.getRequest();
			name = apiConfig.getName();
			if (request != null && !request.isEmpty()) {
				log.info("------- Build input for api name: {} -----", name);
				buildMapInput(request);
			}
		}
	}



}

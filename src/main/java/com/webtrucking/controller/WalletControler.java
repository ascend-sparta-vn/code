package com.webtrucking.controller;

import com.webtrucking.client.TmnWalletClient;
import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
@RequestMapping("/wallet")
@Transactional
@PropertySource("classpath:application.properties")
public class WalletControler extends BaseController {
	static org.apache.logging.log4j.Logger log = LogManager.getLogger(WalletControler.class);

	@Autowired
	private TmnWalletClient tmnWalletClient;

    @RequestMapping(value = "/get_otp/{mobile_number}", method = RequestMethod.GET)
    public String register(@PathVariable String mobileNumber) {
        log.info("Mobile number {}", mobileNumber);
        log.info("GetOTP: {}", tmnWalletClient.getOtp(mobileNumber).toString());
        //log.info("GetUserProfile: {}",tmnWalletClient.getUserProfiles("futoken","ios","2.0").toString());

        return "register";
    }

	@RequestMapping(value = "/create_wallet", method = RequestMethod.POST)
	public String register(@RequestBody Map<String, Object> requests) {
		log.info("Mobile number {}", requests);
		//log.info("GetOTP: {}", tmnWalletClient.getOtp(mobileNumber).toString());
		//log.info("GetUserProfile: {}",tmnWalletClient.getUserProfiles("futoken","ios","2.0").toString());

		return "register";
	}

}

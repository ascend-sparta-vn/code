package com.webtrucking.services;

import com.webtrucking.dao.ForgotPasswordDAO;
import com.webtrucking.dao.userDAO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.core.env.Environment;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

@Service
public class UserService implements ApplicationListener<AuthenticationSuccessEvent>{
	static Logger log = Logger.getLogger(UserService.class);
	@Autowired
	userDAO userDAO;
	
	@Autowired
	private ForgotPasswordDAO forgotPasswordDAO;
	
	@Autowired
    private EmailService emailService;
	
	@Autowired
	private Environment env;
	
    public void onApplicationEvent(AuthenticationSuccessEvent event) {
       String userName = ((UserDetails) event.getAuthentication().getPrincipal()).getUsername();
//       List<Account_bk> listAccount = userDAO.findAccountByUsername(userName);
//       if(listAccount != null && listAccount.size() > 0 ) {
//    	   Account_bk account = listAccount.get(0);
//    	   account.setLastSignInDate(new Date());
//           userDAO.save(account);
//       }
       
    }

}

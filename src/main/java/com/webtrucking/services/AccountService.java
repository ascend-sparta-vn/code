package com.webtrucking.services;

import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.core.env.Environment;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webtrucking.dao.AccountDAO;
import com.webtrucking.dao.AccountDetailDAO;
import com.webtrucking.dao.ForgotPasswordDAO;
import com.webtrucking.dao.UserRoleDAO;
import com.webtrucking.entity.Account;
import com.webtrucking.entity.ForgotPassword;
import com.webtrucking.entity.UserRole;
import com.webtrucking.json.entity.UserAjaxEntity;
import com.webtrucking.util.Common;
import com.webtrucking.util.IConstant;

@Service
public class AccountService implements ApplicationListener<AuthenticationSuccessEvent>{
	static Logger log = LogManager.getLogger(AccountService.class);
	@Autowired
	AccountDAO accountDAO;
	
	@Autowired
	AccountDetailDAO accountDetailDAO;
	
	@Autowired
	UserRoleDAO userRoleDAO;
	
	@Autowired
	private ForgotPasswordDAO forgotPasswordDAO;
	
	@Autowired
    private EmailService emailService;
	
	@Autowired
	private Environment env;
	
    public void onApplicationEvent(AuthenticationSuccessEvent event) {
       String userName = ((UserDetails) event.getAuthentication().getPrincipal()).getUsername();
       List<Account> listAccount = accountDAO.findAccountByUsername(userName);
       if(listAccount != null && listAccount.size() > 0 ) {
    	   Account account = listAccount.get(0);
    	   account.setLastSignInDate(new Date());
           accountDAO.save(account);
       }
       
    }
    
    @Transactional(rollbackFor = Exception.class)
    public boolean addUser(UserAjaxEntity requestData){
    	
		Md5PasswordEncoder encoder= new Md5PasswordEncoder();
		String password= encoder.encodePassword(requestData.getPassword(), null);
		Account account = new Account();
		account.setUsername(requestData.getUsername());
		account.setPassword(password);
		if(requestData.isEnabled()){
			account.setStatus(IConstant.ACCOUNT.ACTIVE);
		} else {
			account.setStatus(IConstant.ACCOUNT.INACTIVE);
		}
		
		account.setCreatedDate(new Date());
		accountDAO.save(account);
		
		UserRole role = new UserRole();
		role.setUser(account);
		role.setRole(requestData.getRoleModal());
		userRoleDAO.save(role);
    	
    	return true;
    }
    
    @Transactional(rollbackFor = Exception.class)
    public boolean editUser(UserAjaxEntity requestData){
    	
    	Account account = accountDAO.findOne(requestData.getUserId());
    	if(account!=null){
    		Md5PasswordEncoder encoder= new Md5PasswordEncoder();
    		// if password != empty -> update password
    		if(StringUtils.isNotEmpty(requestData.getPassword())){
    			String password= encoder.encodePassword(requestData.getPassword(), null);
    			account.setPassword(password);
    		} 
    		
    		if(requestData.isEnabled()){
    			account.setStatus(IConstant.ACCOUNT.ACTIVE);
    		} else {
    			account.setStatus(IConstant.ACCOUNT.INACTIVE);
    		}
    		
    		UserRole role = userRoleDAO.findByUser(account);
    		role.setRole(requestData.getRoleModal());
    		userRoleDAO.save(role);
    		
    		return true;
    	} else {
    		return false;
    	}
    }
    
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteUser(Integer userId){
    		Account account = accountDAO.findOne(userId); 
    		if(account!=null){
    			UserRole role = userRoleDAO.findByUser(account);
        		if(role!=null){
        			userRoleDAO.delete(role);
        		}
        		accountDAO.delete(userId);
        		if(account.getAccountDetail() != null) {
        			accountDetailDAO.delete(account.getAccountDetail());
        		}
        		
        		return true;
    		}
    		return false;
    }
    
    public boolean checkPermission(Integer userId){
    	try{
    		Account account = accountDAO.findOne(userId); 
    		if(account!=null){
    			UserRole role = userRoleDAO.findByUser(account);
        		if(role!=null && IConstant.ROLE.ROLE_ADMIN.equalsIgnoreCase(role.getRole())){
        			return true;
        		}
    		}
    		return false;
    	}catch(Exception ex){
    		log.error("EXCEPTION IN DELETING USER: "+ userId, ex);
    		return false;
    	}
    }

    @Transactional(rollbackFor = Exception.class)
	public boolean forgotPassword(Account account) throws MessagingException {
		//step 1: genlink
		forgotPasswordDAO.deleteByEmail(account.getUsername());
		ForgotPassword forgotPass = new ForgotPassword();
		forgotPass.setAccountId(account.getId());
		forgotPass.setCreatedDate(new Date());
		forgotPass.setEmail(account.getUsername());
		forgotPass.setResetKey(Common.getMd5(new Date().toString()));
		forgotPasswordDAO.save(forgotPass);
		
		//step 2: send mail
		String linkResetPass = env.getProperty("url.account.reset.pass");
		String link = linkResetPass + "email="+account.getUsername()+"&resetKey="+forgotPass.getResetKey();
		emailService.sendForgotPassNotify(account.getUsername(), link);
		return true;
	}

    @Transactional(rollbackFor = Exception.class)
	public boolean resetPass(String email, String resetKey) throws MessagingException {
    	List<Account> listAccount = accountDAO.findAccountByUsernameAndStatus(email, IConstant.ACCOUNT.ACTIVE);
    	if(listAccount == null || listAccount.size() == 0) {
    		log.info("account not existed");
    	} else {
    		Account account = listAccount.get(0);
    		
    		List<ForgotPassword> forgotPasses = forgotPasswordDAO.findByEmail(email);
			if (forgotPasses == null || forgotPasses.size() == 0) {
				log.info("email not existed in forgot_password table");
				return false;
    		} else {
    			ForgotPassword fg = forgotPasses.get(0);
    			if(!fg.getResetKey().equals(resetKey)){
    				return false;
    			} else {
    				//get new password
    	    		String newPassword = RandomStringUtils.randomAlphanumeric(8).toUpperCase();
    	    		String password = Common.getMd5(newPassword);
    	    		account.setPassword(password);
    	    		accountDAO.save(account);
    	    		
    	    		forgotPasswordDAO.delete(fg);
    	    		//send mail
    	    		emailService.sendResetPass(email, newPassword);
    	    		log.info("reset password successfully!");
    			}
    		}
    	}
    	
		return true;
	}
}

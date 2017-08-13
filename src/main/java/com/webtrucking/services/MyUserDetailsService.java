package com.webtrucking.services;


import com.webtrucking.dao.userDAO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service("userDetailsService")
public class MyUserDetailsService implements UserDetailsService {
	static Logger log = Logger.getLogger(MyUserDetailsService.class);
	//get user from the database, via Hibernate
	@Autowired
	private userDAO userDAO;

	@Transactional(readOnly=true)
	@Override
	public UserDetails loadUserByUsername(final String username)
		throws UsernameNotFoundException {
		
//		Account_bk account = new Account_bk();
//		try {
//			List<Account_bk> listAccount = userDAO.findAccountByUsernameAndStatus(username, IConstant.ACCOUNT.ACTIVE);
//		       if(listAccount != null && listAccount.size() > 0 ) {
//		    	   account = listAccount.get(0);
//		       }
//
//			List<GrantedAuthority> authorities = buildUserAuthority(account.getUserRole());
//
//			UserDetails userDetail = buildUserForAuthentication(account, authorities);
//
//			return userDetail;
//		} catch (Exception e) {
//			//log.error("", e);
//		}
		return null;
	}

	// Converts com.mkyong.users.model.User user to
	// org.springframework.security.core.userdetails.User
	private User buildUserForAuthentication(com.webtrucking.entity.User user,
											List<GrantedAuthority> authorities) {
		return new User(user.getUsername(), user.getPassword(),
			true, true, true, true, authorities);
	}

}
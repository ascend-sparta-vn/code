package com.webtrucking.services;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webtrucking.dao.AccountDAO;
import com.webtrucking.entity.Account;
import com.webtrucking.entity.UserRole;
import com.webtrucking.util.IConstant;


@Service("userDetailsService")
public class MyUserDetailsService implements UserDetailsService {
	static Logger log = LogManager.getLogger(MyUserDetailsService.class);
	//get user from the database, via Hibernate
	@Autowired
	private AccountDAO accountDAO;

	@Transactional(readOnly=true)
	@Override
	public UserDetails loadUserByUsername(final String username)
		throws UsernameNotFoundException {
		
		Account account = new Account();
		try {
			List<Account> listAccount = accountDAO.findAccountByUsernameAndStatus(username, IConstant.ACCOUNT.ACTIVE);
		       if(listAccount != null && listAccount.size() > 0 ) {
		    	   account = listAccount.get(0);
		       }
			
			List<GrantedAuthority> authorities = buildUserAuthority(account.getUserRole());

			UserDetails userDetail = buildUserForAuthentication(account, authorities);
			 
			return userDetail;
		} catch (Exception e) {
			//log.error("", e);
		}
		return null;
	}

	// Converts com.mkyong.users.model.User user to
	// org.springframework.security.core.userdetails.User
	private User buildUserForAuthentication(com.webtrucking.entity.Account user,
		List<GrantedAuthority> authorities) {
		return new User(user.getUsername(), user.getPassword(),
			true, true, true, true, authorities);
	}

	private List<GrantedAuthority> buildUserAuthority(Set<UserRole> userRoles) {

		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

		// Build user's authorities
		for (UserRole userRole : userRoles) {
			setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
		}

		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);

		return Result;
	}

}
package com.webtrucking.entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class SecurityUser extends User {

    private User account;

	public User getAccount() {
		return account;
	}


	public void setAccount(User account) {
		this.account = account;
	}


	public SecurityUser(String username, String password, boolean enabled,
			boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities)
			throws IllegalArgumentException {
		/*super(username, password,authorities enabled, accountNonExpired,
				credentialsNonExpired, accountNonLocked );*/
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonExpired, authorities);

	}
}

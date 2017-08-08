package com.webtrucking.entity;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class SecurityUser extends User {

    private Account account;

	public Account getAccount() {
		return account;
	}


	public void setAccount(Account account) {
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

package com.webtrucking.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.webtrucking.services.MyUserDetailsService;

@Configuration
// @EnableWebSecurity = @EnableWebMVCSecurity + Extra features
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	MyUserDetailsService myUserDetailsService;
	
	@Bean
    public Md5PasswordEncoder passwordEncoder() throws Exception {
        return new Md5PasswordEncoder();
    }

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth)
			throws Exception {

		// Các User trong Database
		auth.userDetailsService(myUserDetailsService)
			.passwordEncoder(passwordEncoder());
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();

		http.authorizeRequests().antMatchers("/homepage").permitAll();
		http.authorizeRequests().antMatchers("/rest/*").permitAll();
		http.authorizeRequests().antMatchers("/admin/*").access("hasRole('ROLE_ADMIN')");
		http.authorizeRequests().antMatchers("/admin/view-user/*").access("hasRole('ROLE_ADMIN')");
		/*trucking manager*/
		http.authorizeRequests().antMatchers("/rest_trucking/*").permitAll();
		http.authorizeRequests().antMatchers("/trucking/post").access("hasAnyRole('ROLE_ADMIN', 'ROLE_CLIENT')");
//		http.authorizeRequests().antMatchers("/trucking/detail").access("hasAnyRole('ROLE_ADMIN', 'ROLE_CLIENT')");
		//http.authorizeRequests().antMatchers("/account/*").access("hasAnyRole('ROLE_ADMIN', 'ROLE_CLIENT')");
		/*shipment manager*/
		http.authorizeRequests().antMatchers("/rest_shipment/*").permitAll();
		http.authorizeRequests().antMatchers("/shipment/post").access("hasAnyRole('ROLE_ADMIN', 'ROLE_CLIENT')");
//		http.authorizeRequests().antMatchers("/shipment/detail").access("hasAnyRole('ROLE_ADMIN', 'ROLE_CLIENT')");
		http.authorizeRequests().antMatchers("/shipment/manage-goods").access("hasAnyRole('ROLE_ADMIN', 'ROLE_CLIENT')");
		/*order manager*/
		http.authorizeRequests().antMatchers("/order/shipment/*").access("hasAnyRole('ROLE_ADMIN', 'ROLE_CLIENT')");
		http.authorizeRequests().antMatchers("/order/trucking/*").access("hasAnyRole('ROLE_ADMIN', 'ROLE_CLIENT')");
		
		http.authorizeRequests().antMatchers("/account/change-password").access("hasAnyRole('ROLE_ADMIN', 'ROLE_CLIENT')");
		http.authorizeRequests().antMatchers("/account/register").permitAll();

		
		// Khi ngư�?i dùng đã login, với vai trò XX.
		// Nhưng truy cập vào trang yêu cầu vai trò YY,
		// Ngoại lệ AccessDeniedException sẽ ném ra.
		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
		
		//http.authorizeRequests().and().exceptionHandling().accessDeniedHandler(accessDeniedHandler)

		// Cấu hình cho Login Form.
		http.authorizeRequests()
				.and()
				.formLogin()
				// Submit URL của trang login
				.loginProcessingUrl("/j_spring_security_check") // Submit URL
				.loginPage("/login")//
				.defaultSuccessUrl("/homepage")//
				.failureUrl("/login?error=true")//
				.usernameParameter("userName")//
				.passwordParameter("password")
				.permitAll()

				// Cấu hình cho Logout Page.
				// (Sau khi logout, chuyển tới trang home)
				.and()
				.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/login")
				.deleteCookies("remember-me")
				.permitAll()
				.and()
				.rememberMe();

	}
	
}

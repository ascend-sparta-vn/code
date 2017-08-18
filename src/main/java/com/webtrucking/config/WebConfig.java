package com.webtrucking.config;

import java.util.Locale;

import javax.servlet.http.HttpSessionListener;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@EnableWebMvc
@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {
	@Bean
	public UrlBasedViewResolver tilesViewResolver() {

		UrlBasedViewResolver tilesViewResolver = new UrlBasedViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		return tilesViewResolver;
	}

	@Bean
	public TilesConfigurer tilesConfigurer() {

		TilesConfigurer tconf = new TilesConfigurer();
		tconf.setDefinitions(new String[] { 
					"/WEB-INF/tiles/tiles.xml", 
					"/WEB-INF/tiles/titles-defs-error.xml",
				});
		return tconf;

	}
	
	 @Override
     public void addResourceHandlers(ResourceHandlerRegistry registry) {
             registry.addResourceHandler("/resources/**")
                     .addResourceLocations("/resources/");
     }
	 
	 @Override
	 public void addViewControllers(ViewControllerRegistry registry) {
	    registry.addViewController("/login").setViewName("login");
	    registry.addViewController("/").setViewName("homepage");
	 }
	 
	 //Configuration for language
	 @Bean
	 public LocaleResolver localeResolver() {
		 SessionLocaleResolver resolver = new SessionLocaleResolver();
		 resolver.setDefaultLocale(new Locale("en"));
		 return resolver;
	 }
	 
	 @Override
	 public void addInterceptors(InterceptorRegistry registry) {
		LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
		interceptor.setParamName("lang");
		registry.addInterceptor(interceptor);
		registry.addInterceptor(initInterceptor()).addPathPatterns("/**");
	 }
	 
	 @Bean
	 public ExecuteInterceptor initInterceptor() {
	     return new ExecuteInterceptor();
	 }
	 
	 @Bean
	 public ResourceBundleMessageSource messageSource() {
		 ResourceBundleMessageSource rb = new ResourceBundleMessageSource();
		 rb.setBasenames(new String[] {"app-label/app-label" ,"message/message"});
		 rb.setDefaultEncoding("UTF-8");
		 return rb;
	 }
	 
	 @Bean
	 public HttpSessionListener httpSessionListener(){
	    return new SessionCounterListener();
	 }
}
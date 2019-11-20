package com.poly;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.interceptor.FilterInterceptor;

@Configuration
public class FilterConfig implements WebMvcConfigurer {
	@Autowired
	FilterInterceptor filter;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(filter)
		.addPathPatterns("/home/**")
		.excludePathPatterns("/admin/**", "/journalist/**" , "/client/**");

//		registry.addInterceptor(auth)
//			.addPathPatterns("/admin/**")
//			.excludePathPatterns("/admin/master/login");
	}
}

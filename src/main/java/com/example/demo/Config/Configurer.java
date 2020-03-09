package com.example.demo.Config;

import com.example.demo.Interceptor.LoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class Configurer implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(myInterceptor()).addPathPatterns("/**")
                .excludePathPatterns("/Admin/Login").excludePathPatterns("/Admin/Index").excludePathPatterns("/Blog/**").excludePathPatterns("/Comment/**");//将自己的拦截器注册到spring中并添加拦截的路径
    }
    @Bean
    LoginInterceptor myInterceptor(){
        return new LoginInterceptor();//提供自己的拦截器的bean
    }
}

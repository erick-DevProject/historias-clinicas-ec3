package com.historias.clinicas.config;

import com.historias.clinicas.security.AuthInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class WebConfig implements WebMvcConfigurer {

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(new AuthInterceptor());
  }

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry reg) {
    reg.addResourceHandler("/css/**")
       .addResourceLocations("classpath:/static/css/");
    reg.addResourceHandler("/js/**")
       .addResourceLocations("classpath:/static/js/");
    reg.addResourceHandler("/images/**")
       .addResourceLocations("classpath:/static/images/");
  }
}

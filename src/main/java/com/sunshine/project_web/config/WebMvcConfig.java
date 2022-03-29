package com.sunshine.project_web.config;

import com.sunshine.project_web.paging.PagingAnnotation;
import com.sunshine.project_web.paging.PagingParamResolver;
import com.sunshine.project_web.ultils.FileUntils;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {


    //Đăng ký Annotation
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
        resolvers.add(new PagingParamResolver());
    }

    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/Product/T3H/**")
                .addResourceLocations("file:/" + FileUntils.PATH_IMG_Product);
        registry.addResourceHandler("/User/T3H/**")
                .addResourceLocations("file:/" + FileUntils.PATH_IMG_User);
        registry.addResourceHandler("/Category/T3H/**")
                .addResourceLocations("file:/" + FileUntils.PATH_IMG_Category);
    }
}

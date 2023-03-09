package com.java1234.config;

//import com.java1234.interceptor.SysInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//Web项目配置类

@Configuration
public class WebAppConfigurer implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("*")
                .allowCredentials(true)
                .allowedMethods("GET", "HEAD", "POST", "PUT",
                        "DELETE","OPTIONS")
                .maxAge(3600);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/image/swiper/**").addResourceLocations("file:F:\\work\\大三下\\Demo\\images\\swiperImgs\\");
        registry.addResourceHandler("/image/bigType/**").addResourceLocations("file:F:\\work\\大三下\\Demo\\images\\bigTypeImgs\\");
        registry.addResourceHandler("/image/product/**").addResourceLocations("file:F:\\work\\大三下\\Demo\\images\\productImgs\\");
        registry.addResourceHandler("/image/productSwiperImgs/**").addResourceLocations("file:F:\\work\\大三下\\Demo\\images\\productSwiperImgs\\");
        registry.addResourceHandler("/image/productIntroImgs/**").addResourceLocations("file:F:\\work\\大三下\\Demo\\images\\productIntroImgs\\");
        registry.addResourceHandler("/image/productParaImgs/**").addResourceLocations("file:F:\\work\\大三下\\Demo\\images\\productParaImgs\\");

    }

//    @Bean
//    public SysInterceptor sysInterceptor(){
//        return new SysInterceptor();
//    }
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        String[] patterns=new String[]
//                {"/adminLogin","/product/**","/bigType/**","/user/wxlogin","/weixinpay/**"};
//        registry.addInterceptor(sysInterceptor())
//                .addPathPatterns("/**")
//                .excludePathPatterns(patterns);
//    }

}

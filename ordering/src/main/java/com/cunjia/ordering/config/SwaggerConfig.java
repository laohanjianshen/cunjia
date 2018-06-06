package com.cunjia.ordering.config;

import com.google.common.collect.Lists;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ApiKey;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration//扔给Spring管理
@EnableSwagger2//启用swagger2
public class SwaggerConfig {
   //url:localhost:8080/swagger-ui.html



    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())//创建API的基本信息，这些信息会展示在页面上
                .securitySchemes(Lists.newArrayList(apiKey()))//使用账号密码登陆
               /* .securityContexts(Lists.newArrayList(securityContext()))*/
                .select()//返回一个ApiSelectorBuilder实例用来控制哪些接口暴露给Swagger来展现
                .apis(RequestHandlerSelectors.basePackage("com.cunjia.ordering"))//自动扫描com.cunjia.ordering下所有Controller定义的API
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        Contact contact = new Contact("黄一帆", "https://swagger.io", "546989498@qq.com");
        return new ApiInfoBuilder()
                .title("标题")//标题
                .description("测试")//描述
                .termsOfServiceUrl("https://github.com/timebusker/spring-boot/tree/master/spring-boot-12-Swagger2/")
//                .contact(contact)//作者信息
//                .version("2.0.0")//版本号
                .build();
    }

    private ApiKey apiKey() {
        return new ApiKey("Authorization", "Authorization", "header");
    }
}

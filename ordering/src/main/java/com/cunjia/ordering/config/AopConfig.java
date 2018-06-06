package com.cunjia.ordering.config;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Aspect   //定义一个切面
@Component//丢给Spring
@Slf4j
public class AopConfig {
    // 定义切点Pointcut
    @Pointcut("execution(* com.cunjia.ordering.controller.*Controller.*(..))")
    public void excudeService() {
    }
    @Before("excudeService()")//方法执行前执行
    public void doAround(JoinPoint joinPoint) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        log.info("请求URL : " + request.getRequestURL().toString());
        //System.out.println( request.getHeader("Authorization"));
    }
}

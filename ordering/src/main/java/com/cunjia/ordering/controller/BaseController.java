package com.cunjia.ordering.controller;

import com.cunjia.ordering.base.exception.DescribeException;
import com.cunjia.ordering.base.exception.ExceptionEnum;
import com.cunjia.ordering.base.exception.ExceptionHandle;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.utils.TokenManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Controller基类
 */
public class BaseController {

    protected static Logger logger = LoggerFactory.getLogger(UserController.class);
    @Autowired
    private ExceptionHandle exceptionHandle;

    /**
     * token认证方法
     *
     * @param token
     * @return
     */
    protected ShiroToken validateToken(ShiroToken token) {
        System.out.println("解析前的token信息："+token);
        String tokenStr = token.getUserToken();
        boolean isValidateToken = TokenManager.isVlidateToken(tokenStr);
        System.out.println("token验证结果：" + isValidateToken);
        if (!isValidateToken) {
            throw new DescribeException(ExceptionEnum.TOKEN_INVALID);
        }
        System.out.println("解析后的token信息："+TokenManager.parseTokenInfo(tokenStr));
        ShiroToken tempToken = TokenManager.parseTokenInfo(tokenStr);
        token.setUserId(tempToken.getUserId());
        token.setShopId(tempToken.getShopId());
        return token;
    }
}

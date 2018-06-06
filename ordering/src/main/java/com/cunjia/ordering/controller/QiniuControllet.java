package com.cunjia.ordering.controller;

import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.base.exception.ResultUtil;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.qiniu.util.Auth;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/qiniu")
@PropertySource(value = "classpath:application.properties")
public class QiniuControllet extends BaseController{
    //设置需要操作的账号的AK和SK
    @Value("${qiniu.access.key}")
    private String accessKey;
    @Value("${qiniu.secret.key}")
    private String secretKey;
    @Value("${qiniu.bucket}")
    private String bucketname;

    /**
     * 获取七牛云token  hyf
     * @return 生成的token
     */
    @GetMapping("/getQiniuToken")
    public Result getQiniuToken(@Validated ShiroToken token) {
        validateToken(token);
        Auth auth = Auth.create(accessKey, secretKey);
        return ResultUtil.success(auth.uploadToken(bucketname));
    }
}

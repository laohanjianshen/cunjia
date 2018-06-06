package com.cunjia.ordering.controller;

import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.base.exception.ResultUtil;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.service.ShopsService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/shop")
public class ShopController extends BaseController {

    @Resource
    private ShopsService shopsService;

    /**
     * 获取商铺基本信息
     *
     * @return 商铺基本信息json
     * @author 甘雨
     */
    @ResponseBody
    @PostMapping(value = "/getShopInfo")
    public Result getShopInfo(@Validated ShiroToken token) {
        validateToken(token);
        return ResultUtil.success(shopsService.getShopInfo(token.getShopId()));
    }
}

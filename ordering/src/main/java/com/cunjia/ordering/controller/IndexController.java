package com.cunjia.ordering.controller;

import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.base.exception.ResultUtil;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.service.BannerService;
import com.cunjia.ordering.service.BoxLunchService;
import com.cunjia.ordering.service.ShopsService;
import com.cunjia.ordering.utils.DateUtil;
import com.cunjia.ordering.vo.BoxLunchVO;
import com.cunjia.ordering.vo.ShopsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 首页
 */
@RestController
@RequestMapping("index")
public class IndexController extends BaseController {
    @Autowired
    BannerService bannerService;

    @Resource
    private ShopsService shopsService;

    @Resource
    private BoxLunchService boxLunchService;

    /**
     * 获取轮播图以及广告图片 hyf
     *
     * @return json
     */
    @GetMapping("listBanner")
    public Result listBanner(@Validated ShiroToken token) {
        validateToken(token);
        return ResultUtil.success(bannerService.listBanner());
    }

    @ResponseBody
    @GetMapping("/getIndexBoxLunch")
    public Result getIndexBoxLunch(@Validated ShiroToken token,
                                   @RequestParam("offset") Integer offset, @RequestParam("limit") Integer limit) {
        validateToken(token);

        HashMap<String, Object> resultMap = new HashMap<>();

        Long currentTimestamp = DateUtil.getCurrentTimestamp();
        Long tomorrowTimestampOfZero = DateUtil.getTomorrowTimestampOfZero();
        Long todayTimestampOfZero = DateUtil.getCurrentTimestampOfZero();

        ShopsVO timestamp = shopsService.getShopTimestamp(token.getShopId());
        ShopsVO shopTimestamp = CommonGoods.getShopTimestamp(timestamp, todayTimestampOfZero);

        HashMap<String, Object> paramResult = new HashMap<>();
        paramResult.put("offset", offset);
        paramResult.put("limit", limit);

        if (currentTimestamp < shopTimestamp.getShopBuyDeadline()) {
            paramResult.put("timestamp", todayTimestampOfZero);
        } else {
            shopTimestamp = CommonGoods.getShopTimestamp(timestamp, tomorrowTimestampOfZero);
            paramResult.put("timestamp", tomorrowTimestampOfZero);
        }

        resultMap.put("shopTimestamp", shopTimestamp);

        List<BoxLunchVO> indexBoxLunchList = boxLunchService.getIndexBoxLunchList(paramResult);
        resultMap.put("indexBoxLunchList", indexBoxLunchList);

        return ResultUtil.success(resultMap);
    }
}

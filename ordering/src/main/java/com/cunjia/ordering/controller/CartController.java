package com.cunjia.ordering.controller;

import com.alibaba.fastjson.JSONArray;
import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.base.exception.ResultUtil;
import com.cunjia.ordering.dto.CartPersonalDTO;
import com.cunjia.ordering.dto.CartSelfDTO;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.service.CartsService;
import com.cunjia.ordering.vo.CartSelfVO;
import com.cunjia.ordering.vo.CartVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 购物车
 *
 * @auther xpc 252645816@qq.com
 * @date 2018/4/23 15:38
 */

@Slf4j
@RestController
@RequestMapping("/cart")
public class CartController extends BaseController {
    @Resource
    private CartsService cartsService;

    /**
     * 个人点餐 查看购物车
     *
     * @param token
     * @return CartVO
     */
    @GetMapping("/view/personal")
    @Cacheable(key = "1001", cacheNames = "cartPersonal")
    public Result<CartVO> viewCart4Personal(@Validated ShiroToken token) {
        validateToken(token);
        List<CartVO> cartVOList = cartsService.viewCart4Personal(token.getUserId());
        return ResultUtil.success(cartVOList);
    }

    /**
     * 自助点餐 查看购物车
     *
     * @param token
     * @return
     */
    @GetMapping("/view/self")
//    @Cacheable(key = "1002", cacheNames = "cartSelf")
    public Result<CartSelfVO> viewCart4Self(@Validated ShiroToken token) {
        validateToken(token);
        CartSelfVO cartSelfVO = cartsService.viewCart4Self(token.getUserId());
        return ResultUtil.success(cartSelfVO);
    }

    /**
     * 个人点餐 添加商品至购物车
     *
     * @param cartPersonalDTO (boxLunchId,boxLunchNumber,boxLunchDate,boxLunchType,condimentId:如果非sku传0,sku商品传1,skuId:是sku商品的话传skuId,不是则传null,condiment有的话传condimentId,没有的话就不传)
     * @return null
     */
    @PostMapping("/add/personal")
    @CacheEvict(key = "1001", cacheNames = "cartPersonal")
    public Result add2Cart4Personal(CartPersonalDTO cartPersonalDTO, @Validated ShiroToken token) {
        validateToken(token);
        cartPersonalDTO.setUserId(token.getUserId());
        System.out.println("我要添加的商品"+cartPersonalDTO);
        cartsService.add2Cart4Personal(cartPersonalDTO);
        return ResultUtil.success();
    }

    /**
     * 自助点餐 添加指定组合食物的盒饭至购物车
     *
     * @param cartSelfDTOList(foodIdList,foodNumberList,boxLunchDateList)
     * @param token
     * @return
     */
    @PostMapping("/add/self")
//    @Cacheable(key = "1002", cacheNames = "cartSelf")
    public Result add2CartSelf(@RequestParam String cartSelfDTOList, @RequestParam long boxLunchDate, @Validated ShiroToken token) {
        validateToken(token);
        System.out.println("前端传来的cartSelfDTOList:" + cartSelfDTOList);
        List<CartSelfDTO> cartSelfDTOS = JSONArray.parseArray(cartSelfDTOList, CartSelfDTO.class);
        Integer selfId = cartsService.add2Cart4Self(token.getUserId(), cartSelfDTOS, boxLunchDate);
        return ResultUtil.success(selfId);
    }

    /**
     * 个人点餐 减购
     *
     * @param cartPersonalDTO (boxLunchId,skuId,boxLunchType,boxLunchDate,boxLunchNumber)
     * @param token
     * @return
     */
    @PostMapping("/decrease/personal")
    @CacheEvict(key = "1001", cacheNames = "cartPersonal")
    public Result decreaseCart4Personal(CartPersonalDTO cartPersonalDTO, @Validated ShiroToken token) {
        validateToken(token);
        cartPersonalDTO.setUserId(token.getUserId());
        cartsService.decreaseCart4Personal(cartPersonalDTO);
        return ResultUtil.success();
    }

    /**
     * 个人点餐 清空当前用户的购物车
     *
     * @param token
     * @return
     */
    @GetMapping("/clear/personal")
    @CacheEvict(key = "1001", cacheNames = "cartPersonal")
    public Result clearCart4Person(@Validated ShiroToken token) {
        validateToken(token);
        cartsService.clearCart4Personal(token.getUserId());
        return ResultUtil.success();
    }

    /**
     * 自助点餐 清空当前用户的购物车
     *
     * @param token
     * @return
     */
    @GetMapping("/clear/self")
//    @CacheEvict(key = "1002", cacheNames = "cartSelf")
    public Result clearCart4Self(@Validated ShiroToken token) {
        validateToken(token);
        cartsService.clearCart4Self(token.getUserId());
        return ResultUtil.success();
    }
    //热部署
    @GetMapping("/test/hot")
    public String test(){
        return "啊hh";
    }
}

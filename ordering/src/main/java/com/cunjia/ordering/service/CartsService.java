package com.cunjia.ordering.service;

import com.cunjia.ordering.dto.CartPersonalDTO;
import com.cunjia.ordering.dto.CartSelfDTO;
import com.cunjia.ordering.vo.CartSelfVO;
import com.cunjia.ordering.vo.CartVO;

import java.util.List;

/**
 * 购物车
 *
 * @auther xpc 252645816@qq.com
 * @date 2018/4/23 21:11
 */
public interface CartsService {
    //个人点餐 查看购物车列表
    List<CartVO> viewCart4Personal(Integer userId);

    //自助点餐 查看购物车列表
    CartSelfVO viewCart4Self(Integer userId);

    //个人点餐 添加购物车
    void add2Cart4Personal(CartPersonalDTO cartPersonalDTO);

    //自助点餐 添加购物车
    Integer add2Cart4Self(Integer userId,List<CartSelfDTO> cartSelfDTOList,Long boxLunchDate);

    //个人点餐 删除单件商品指定数量
    void decreaseCart4Personal(CartPersonalDTO cartPersonalDTO);

    //自助点餐 删除单个已经组合完成的盒饭(在1.0版本中功能与清空购物车一致,故未写,留至2.0版本)
    //void decreaseCart4Self(CartSelfDTO cartSelfDTO);

    //个人点餐 清空购物车
    void clearCart4Personal(Integer userId);

    //自助点餐 清空购物车
    void clearCart4Self(Integer userId);

}

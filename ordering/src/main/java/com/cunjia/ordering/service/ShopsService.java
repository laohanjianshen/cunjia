package com.cunjia.ordering.service;

import com.cunjia.ordering.vo.ShopsVO;

public interface ShopsService {

    /*
     * 通过shopId获取商铺信息
     */
    ShopsVO getShopInfo(Integer shopId);

    /*
     * 通过shopId获取商铺的倒计时信息
     */
    ShopsVO getShopTimestamp(Integer shopId);
}

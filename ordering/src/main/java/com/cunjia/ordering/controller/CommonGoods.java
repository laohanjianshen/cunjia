package com.cunjia.ordering.controller;

import com.cunjia.ordering.vo.ShopsVO;

/**
 * BoxLunchController和FoodController通用的方法
 */
class CommonGoods {

    /**
     * 获得当前盒饭所在那一天的优惠倒计时和订单倒计时
     *
     * @param shopTimestamp 从数据库取出的商铺倒计时信息
     * @param timestamp     请求哪一天的零点时间戳
     * @return 商铺倒计时信息
     * @author 甘雨
     */
    static ShopsVO getShopTimestamp(ShopsVO shopTimestamp, Long timestamp) {
        if (timestamp == 0) return null;

        shopTimestamp.setShopBuyDeadline(shopTimestamp.getShopBuyDeadline() + timestamp);
        shopTimestamp.setShopDiscountDeadline(shopTimestamp.getShopDiscountDeadline() + timestamp);

        return shopTimestamp;
    }
}

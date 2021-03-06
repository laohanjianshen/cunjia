package com.cunjia.ordering.domain;

import lombok.Data;

@Data
public class Shops {
    //店铺id
    private Integer shopId;
    //店铺名称
    private String shopName;
    //店铺城市
    private String shopCity;
    //店铺红包规则
    private String redPacketRule;
    //优惠截止时间
    private Long shopDiscountDeadline;
    //优惠描述
    private String shopDiscountDesc;
    //下单截止时间
    private Long shopBuyDeadline;
}
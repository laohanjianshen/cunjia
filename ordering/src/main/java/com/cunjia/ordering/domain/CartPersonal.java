package com.cunjia.ordering.domain;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 个人点餐 购物车
 */
@Data
public class CartPersonal {
    private Integer id;

    private Integer userId;

    private Integer boxLunchId;

    private String boxLunchName;

    private Integer boxLunchNumber;

    private BigDecimal boxLunchSalePrice;

    private Integer boxLunchType;

    private Integer skuId;

    private Long boxLunchDate;

    private String boxLunchImageUrl;

    private Integer condimentId;

    private String condimentName;

    private BigDecimal boxLunchPrice;

    private Long boxLunchDiscountDate;

}
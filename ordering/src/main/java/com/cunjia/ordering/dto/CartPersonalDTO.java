package com.cunjia.ordering.dto;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 个人点餐购物车
 */
@Data
public class CartPersonalDTO {
    //用户id
    private Integer userId;
    //购物车id
    private Integer cartId;
    //盒饭id
    private Integer boxLunchId;
    //盒饭数量
    private Integer boxLunchNumber;
    //盒饭类型
    private Integer boxLunchType;
    //盒饭skuid
    private Integer skuId;
    //盒饭截止时间
    private Long boxLunchDate;
    //盒饭优惠截止时间
    private Long boxLunchDiscountDate;
    //盒饭类目id
    private Integer categoryId;
    //盒饭名称
    private String boxLunchName;
    //盒饭原价
    private BigDecimal boxLunchPrice;
    //盒饭折扣价格
    private BigDecimal boxLunchSalePrice;
    //盒饭描述
    private String boxLunchDesc;
    //盒饭状态
    private Integer boxLunchStatus;
    //盒饭图片url
    private String boxLunchImagesUrl;
    //盒饭skuName
    private String skuName;
    //盒饭sku原价
    private BigDecimal skuPrice;
    //盒饭sku折扣价格
    private BigDecimal skuSalePrice;
    //盒饭绑定的调料id
    private Integer condimentId;
    //盒饭绑定的调料名称
    private String condimentName;

}
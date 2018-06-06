package com.cunjia.ordering.domain;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class BoxLunchSku {
    //盒饭sku id
    private Integer skuId;
    //盒饭id
    private Integer boxLunchId;
    //盒饭sku名称
    private String skuName;
    //盒饭sku原价
    private BigDecimal skuPrice;
    //盒饭sku折扣价
    private BigDecimal skuSalePrice;
    //盒饭sku状态：0、未上架，1、上架中，2、折扣中，3、已售完
    private Integer skuStatus;
}
package com.cunjia.ordering.domain;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 自助点餐
 */
@Data
public class SelfBoxLunch {
    private Integer selfId;

    private Integer userId;
    //1.0版本默认一次只能点一份自助点餐
    private Integer boxLunchNumber = 1;

    private Long boxLunchDate;

    private BigDecimal boxLunchPrice;

    private BigDecimal boxLunchSalePrice;

}
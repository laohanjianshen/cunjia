package com.cunjia.ordering.domain;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 自助点餐
 */
@Data
public class SelfBoxLunchDetail {
    private Integer id;

    private Integer selfId;

    private Integer foodId;

    private String foodName;

    private Integer foodNumber;

    private BigDecimal foodSalePrice;

    private String foodType;

    private String foodImagesUrl;

    private BigDecimal foodPrice;

}
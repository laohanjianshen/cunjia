package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 购物车详情
 * @auther xpc 252645816@qq.com
 * @date 2018/5/15 13:56
 */
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CartInfoVO implements Serializable {

    private static final long serialVersionUID = -7250697030771437213L;
    //盒饭Id
    private Integer boxLunchId;
    //盒饭skuId
    private Integer skuId;
    //个人点餐餐品名称
    private String boxLunchName;
    //个人点餐 优惠价格
    private BigDecimal boxLunchSalePrice;
    //个人点餐 原价
    private BigDecimal boxLunchPrice;
    //个人点餐餐品数量
    private Integer boxLunchNumber;
    //调料名
    private String condimentName;
    //图片url
    private String boxLunchImagesUrl;

}

package com.cunjia.ordering.domain;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
@TableName("orders")
public class Order {
    @TableId
    private Integer orderId;

    private Integer userId;

    private Date orderCreateTime;

    private Integer orderStatus;

    private BigDecimal orderTotalPrice;

    private BigDecimal orderDealPrice;

    private Integer addressId;

    private BigDecimal orderSendPrice;

    private BigDecimal orderSurfacePrice;

    private Integer redPacketId;

    private Integer orderPayType;

    private String orderNumber;

    private Integer orderType;

    public Order() {
    }

    public Order(Integer userId, Integer orderStatus) {
        this.userId = userId;
        this.orderStatus = orderStatus;
    }
}
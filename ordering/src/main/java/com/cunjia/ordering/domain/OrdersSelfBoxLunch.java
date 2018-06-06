package com.cunjia.ordering.domain;

import lombok.Data;

@Data
public class OrdersSelfBoxLunch {
    private Integer id;

    //订单id
    private Integer orderId;

    //盒饭id
    private Integer boxLunchId;

    //盒饭数量
    private Integer boxLunchNumber;

    //订购日期
    private Long boxLunchDate;

}
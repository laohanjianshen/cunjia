package com.cunjia.ordering.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class DateBoxLunchVO {
    //盒饭订购日期
    private Long boxLunchDate;
    private BigDecimal orderSurfacePrice;
    //对应日期盒饭总价
    private BigDecimal boxLunchTotalPrice;
    //盒饭列表
    private List<OrderBoxLunchVO> boxLunchList;
}

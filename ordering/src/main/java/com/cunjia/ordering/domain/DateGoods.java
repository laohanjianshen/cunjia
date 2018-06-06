package com.cunjia.ordering.domain;

import lombok.Data;

@Data
public class DateGoods {

    //自增id
    private Integer id;

    //商品id
    private Integer dateGoodsId;

    //日期时间戳
    private Long dateTimestamp;
}
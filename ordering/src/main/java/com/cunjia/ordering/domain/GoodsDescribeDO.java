package com.cunjia.ordering.domain;

import lombok.Data;

/**
 * 商品描述表
 */
@Data
public class GoodsDescribeDO {
    private Integer goodsDescribeId;//主键
    private String describeName;//描述名称名称
}

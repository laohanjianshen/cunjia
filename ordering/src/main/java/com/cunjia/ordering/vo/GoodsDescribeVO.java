package com.cunjia.ordering.vo;

import lombok.Data;

@Data
public class GoodsDescribeVO {
    private Integer goodsDescribeId;//主键
    private String describeName;//描述名称名称
    private Integer sumNumber;//总数量

    public GoodsDescribeVO(){}
    public GoodsDescribeVO(Integer goodsDescribeId, String describeName, Integer sumNumber){
        this.goodsDescribeId = goodsDescribeId;
        this.describeName = describeName;
        this.sumNumber = sumNumber;
    }
}


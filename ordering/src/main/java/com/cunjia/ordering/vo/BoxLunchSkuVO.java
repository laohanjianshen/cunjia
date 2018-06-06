package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.math.BigDecimal;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class BoxLunchSkuVO {
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

    public BoxLunchSkuVO() {
    }

    /*
     * 单品盒饭中封装的sku数据结构
     */
    public BoxLunchSkuVO(Integer boxLunchId, String skuName, BigDecimal skuPrice, BigDecimal skuSalePrice) {
        this.skuId = 0;
        this.boxLunchId = boxLunchId;
        this.skuName = skuName;
        this.skuPrice = skuPrice;
        this.skuSalePrice = skuSalePrice;
        this.skuStatus = 1;
    }
}
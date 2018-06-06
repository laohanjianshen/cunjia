package com.cunjia.ordering.vo;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @auther xpc 252645816@qq.com
 * @date 2018/4/23 20:52
 */
@Data
public class GoodsSkuVO implements Serializable {

    private static final long serialVersionUID = -5012261104191414239L;
    //    商品skuId
    private Integer skuId;
    //    商品名称
    private String skuName;
    //    商品id
    private Integer goodsId;
    //    商品sku价格
    private BigDecimal skuPrice;
    //    商品sku折扣价格
    private BigDecimal skuSalePrice;
}

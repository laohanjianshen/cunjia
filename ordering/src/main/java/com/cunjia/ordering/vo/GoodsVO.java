package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * @auther xpc 252645816@qq.com
 * @date 2018/4/23 21:01
 */
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class GoodsVO implements Serializable {

    private static final long serialVersionUID = -5636007585847494017L;
    private Integer goodsId;
    //    商品类型id
    private Integer categoryId;
    //    商品名称
    private String goodsName;
    //    商品价格
    private BigDecimal goodsPrice;
    //    商品折扣价
    private BigDecimal goodsSalePrice;
    //    商品标签
    private String goodsLabel;
    //    商品图片url
    private String goodsImagesUrl;
    //    商品sku默认id
    private Integer defaultSkuId;
    // 商品的sku详情
    private List<GoodsSkuVO> goodsSku;
}

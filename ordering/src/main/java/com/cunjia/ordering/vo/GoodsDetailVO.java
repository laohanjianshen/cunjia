package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class GoodsDetailVO implements Serializable {

    private static final long serialVersionUID = 3652607121577099297L;
    private Integer goodsId;
    //    商品类型id
    private Integer categoryId;
    //    商品名称
    private String goodsName;
    //    商品价格
    private BigDecimal goodsPrice;
    //    商品折扣价
    private BigDecimal goodsSalePrice;
    //    商品描述
    private String goodsDesc;
    //    商品标签
    private String goodsLabel;
    //    商品点赞数量
    private Integer goodsLikeNumber;
    //    商品已售数量
    private Integer goodsSoldNumber;
    //    商品图片url
    private String goodsImagesUrl;
    //    商品详情富文本
    private String goodsDetail;
    //    商品好评度
    private Integer goodsEvaluationRate;
    //    商品口味好评度
    private Integer goodsTasteRate;
    //    商品包装好评度
    private Integer goodsSurfaceRate;
    //    商品sku默认id
    private Integer defaultSkuId;
    //    商品的sku详情
    private List<GoodsSkuVO> goodsSku;
}

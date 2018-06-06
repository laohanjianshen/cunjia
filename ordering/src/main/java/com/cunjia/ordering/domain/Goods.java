package com.cunjia.ordering.domain;

import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 商品
 *
 */
@Data
@Entity
@DynamicUpdate
public class Goods {
    //    商品id
    @Id
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
    //    商品创建时间
    private Date goodsCreateTime;
    //    商品信息更新时间
    private Date goodsUpdateTime;
    //    商品状态：0、未上架，1、上架中，2、折扣中，3、已售完
    private Integer goodsStatus;
    //    商品点赞数量
    private Integer goodsLikeNumber;
    //    商品已卖数量
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
    //    商品sku首选id：0，单品
    private Integer defaultSkuId = 0;
    //商品剩余数量
    private Integer goodsRemainNumber;
}

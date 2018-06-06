package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class OrderBoxLunchVO {
    //盒饭id
    private Integer boxLunchId;
    //盒饭类型id
    private Integer categoryId;
    //盒饭类型名称
    private String categoryName;
    //盒饭名称
    private String boxLunchName;
    //盒饭价格
    private BigDecimal boxLunchPrice;
    //盒饭折扣价
    private BigDecimal boxLunchSalePrice;
    //盒饭描述
    private String boxLunchDesc;
    //盒饭状态：0、未上架，1、上架中，2、折扣中，3、已售完
    private Integer boxLunchStatus;
    //盒饭点赞数量
    private Integer boxLunchLikeNumber;
    //订购盒饭日期
    private long boxLunchDate;
    //盒饭已卖数量
    private Integer boxLunchSoldNumber;
    //盒饭图片url
    private String boxLunchImagesUrl;
    //盒饭详情富文本
    private String boxLunchDetail;
    //盒饭好评度
    private Integer boxLunchEvaluationRate;
    //盒饭口味好评度
    private Integer boxLunchTasteRate;
    //盒饭包装好评度
    private Integer boxLunchSurfaceRate;
    //盒饭sku首选id：0，单品
    private Integer defaultSkuId;
    //sku状态
    private Integer skuStatus;
    //skuId
    private String skuId;
    //sku名称
    private String skuName;
    //盒饭类型：0单品，1多品
    private Integer boxLunchType;
    //盒饭库存
    private Integer boxLunchRemainNumber;
    //盒饭包装价格
    private BigDecimal boxLunchSurfacePrice;
    //盒饭配送价格
    private BigDecimal boxLunchSendPrice;
    //盒饭数量
    private Integer boxLunchNumber;
    //是否上月爆款 0 否，1是
    private Integer boxLunchIsFire;
    //盒饭是否有调料包 0 否 1 是
    private Integer boxLunchIsCondiment;
    //调料包id
    private Integer condimentId;
    //调料包名称
    private String condimentName;
    //食物List
    private List<FoodsVO> foodVOList;
}

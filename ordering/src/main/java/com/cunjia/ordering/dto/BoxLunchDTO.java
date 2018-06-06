package com.cunjia.ordering.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 商品DTO
 */
@Data
public class BoxLunchDTO {
    //盒饭id
    private Integer boxLunchId;
    //盒饭类型id
    private Integer categoryId;
    //盒饭名称
    private String boxLunchName;
    //盒饭价格
    private BigDecimal boxLunchPrice;
    //盒饭折扣价
    private BigDecimal boxLunchSalePrice;
    //盒饭描述
    private String boxLunchDesc;
    //盒饭创建时间
    private Date boxLunchCreateTime;
    //盒饭信息更新时间
    private Date boxLunchUpdateTime;
    //盒饭状态：0、未上架，1、上架中，2、折扣中，3、已售完
    private Integer boxLunchStatus;
    //盒饭点赞数量
    private Integer boxLunchLikeNumber;
    //盒饭已卖数量
    private Integer boxLunchSoldNumber;
    //盒饭图片url
    private String boxLunchImagesUrl;
    //盒饭详情图片url
    private String boxLunchDetail;
    //盒饭sku首选id：0，单品
    private int defaultSkuId;
    //盒饭库存
    private Integer boxLunchRemainNumber;
    //盒饭包装价格
    private BigDecimal boxLunchSurfacePrice;
    //是否上月爆款 0 否，1是
    private Integer boxLunchIsFire;
    //盒饭是否有调料包 0 否 1 是
    private Integer boxLunchIsCondiment;

    private List<BoxLunchSkuDTO> boxLunchSkuList;//商品sku

    private List<Integer> condimentList;//调料包

    private List<Integer> foodsList;//商品list

    private List<Integer> idList;//批量删除用到的list
}

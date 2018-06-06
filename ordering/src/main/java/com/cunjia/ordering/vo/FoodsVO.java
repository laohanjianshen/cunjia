package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.math.BigDecimal;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class FoodsVO {
    //食品id
    private Integer foodId;
    //食品类型id
    private Integer categoryId;
    //食品类型名称
    private String categoryName;
    //食品名称
    private String foodName;
    //食品数量
    private Integer foodNumber;
    //食品价格
    private BigDecimal foodPrice;
    //食品折扣价
    private BigDecimal foodSalePrice;
    //食品描述
    private String foodDesc;
    //食品状态：0、未上架，1、上架中，2、折扣中，3、已售完
    private Integer foodStatus;
    //食品点赞数量
    private Integer foodLikeNumber;
    //食品已卖数量
    private Integer foodSoldNumber;
    //食品图片url
    private String foodImagesUrl;
    //食品详情图片
    private String foodDetail;
    //食品库存
    private Integer foodRemainNumber;
    //食品包装价格
    private BigDecimal foodSurfacePrice;

    public FoodsVO() {
    }

    public FoodsVO(Integer categoryId, String categoryName, Integer foodNumber) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.foodNumber = foodNumber;
    }
}
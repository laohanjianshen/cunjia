package com.cunjia.ordering.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 商品DTO
 */
@Data
public class FoodsDTO {
    //食品id
    private Integer foodId;
    //食品类型id
    private Integer categoryId;
    //食品名称
    private String foodName;
    //食品价格
    private BigDecimal foodPrice;
    //食品折扣价
    private BigDecimal foodSalePrice;
    //食品描述
    private String foodDesc;
    //食品信息更新时间
    private Date foodUpdateTime;
    //食品状态：0、未上架，1、上架中，2、折扣中，3、已售完
    private Integer foodStatus;
    //食品图片url
    private String foodImagesUrl;
    //食品详情图片
    private String foodDetail;
    //食品库存
    private Integer foodRemainNumber;
    //食品包装价格
    private BigDecimal foodSurfacePrice;

    private List<Integer> idList;//批量作废商品传入的多个list
}

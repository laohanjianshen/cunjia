package com.cunjia.ordering.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * 自助点餐购物车
 * @auther xpc 252645816@qq.com
 * @date 2018/5/15 9:11
 */
@Data
public class CartSelfDTO {
    //自助点餐购物车id
    private Integer selfId;
    //用户id
    private Integer userId;
    //盒饭数量(默认为1,下一版本需要改)
    private Integer boxLunchNumber=1;
    //盒饭所属日期
    private Long boxLunchDate;
    //盒饭价格
    private BigDecimal boxLunchPrice;
    //食物id
    private Integer foodId;
    //食物名
    private String foodName;
    //食物数量
    private Integer foodNumber;
    //食物原价
    private BigDecimal foodPrice;
    //食物折扣价格
    private BigDecimal foodSalePrice;
    //食物类型(对应VO中的foodType)
    private String categoryName;
    //食物图片
    private String foodImagesUrl;
    //食物类型
    private String type;

}

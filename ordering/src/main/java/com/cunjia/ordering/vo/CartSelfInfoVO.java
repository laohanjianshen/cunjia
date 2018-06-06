package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 自助点餐 详情
 * @auther xpc 252645816@qq.com
 * @date 2018/5/17 13:09
 */
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CartSelfInfoVO implements Serializable {

    private static final long serialVersionUID = -2449676346153418231L;
    //食物名称
    private String foodName;
    //食物原价
    private BigDecimal foodPrice;
    //食物折扣价格
    private BigDecimal foodSalePrice;
    //食物数量
    private Integer foodNumber;
    //食物类型(主菜.辅菜...)
    private String foodType;
    //菜品图片
    private String foodImagesUrl;
}

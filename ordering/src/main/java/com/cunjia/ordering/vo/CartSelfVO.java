package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * 自助点餐
 * @auther xpc 252645816@qq.com
 * @date 2018/5/17 13:01
 */
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CartSelfVO implements Serializable {
    private static final long serialVersionUID = 4381348639849333184L;
    //盒饭所属日期
    private Long boxLunchDate;
    //盒饭原价(因为一次只能点一份自助点餐,所以相当于是前端的价格总计)
    private BigDecimal boxLunchPrice;
    //盒饭折扣价格
    private BigDecimal boxLunchSalePrice;
    //盒饭详情
    private List<CartSelfInfoVO> cartSelfInfoVOList;
}

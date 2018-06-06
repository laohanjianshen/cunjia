package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * 购物车
 * @auther xpc 252645816@qq.com
 * @date 2018/5/15 13:52
 */
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CartVO implements Serializable {
    private static final long serialVersionUID = -4051260640986816087L;
    //个人点餐的原价小计
    private BigDecimal personalTotalPrice;
    //个人点餐的折扣价格小计
    private BigDecimal personalSaleTotalPrice;
    //个人点餐时间
    private Long boxLunchDate;
    //个人点餐详情
    private List<CartInfoVO> cartInfoVOList;
}

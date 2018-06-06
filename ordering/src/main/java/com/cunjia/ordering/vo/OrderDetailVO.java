package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class OrderDetailVO {
    //订单id
    private Integer orderId;
    //用户id
    private Integer userId;
    //用户性别
    private Integer userSex;
    //订单创建时间
    private String orderCreateTime;
    //订单配送时间
    private String orderSendTime;
    //订单状态
    private Integer orderStatus;
    //订单总价
    private BigDecimal orderTotalPrice;
    //订单成交价
    private BigDecimal orderDealPrice;
    //订单配送费
    private BigDecimal orderSendPrice;
    //订单包装费
    private BigDecimal orderSurfacePrice;
    //订单支付类型
    private Integer orderPayType;
    //订单编号
    private String orderNumber;
    //红包金额
    private BigDecimal redPacketPrice;
    //红包id
    private Integer redPacketId;
    //红包名称
    private String redPacketName;
    //红包金额条件
    private BigDecimal redPacketPriceCondition;
    //店铺自助点餐包装费
    private BigDecimal shopSelfSurfacePrice;
    //用户地址id
    private Integer addressId;
    //收件人姓名0、男性；1、女性
    private String addressName;
    //收件人手机号
    private String addressPhone;
    //市名称
    private String cityName;
    //区名称
    private String districtName;
    //大厦
    private String locationBuilding;
    //详细地址
    private String addressDetail;
    private Integer orderType;
    //盒饭列表
    List<BoxLunchVO> boxLunchList;
    //多日期盒饭列表
    List<DateBoxLunchVO> dateBoxLunchList;
}

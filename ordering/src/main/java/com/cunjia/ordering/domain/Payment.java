package com.cunjia.ordering.domain;

import lombok.Data;

/**
 * 支付类
 */
@Data
public class Payment {
    private String appid;// 	微信分配的小程序ID
    private String body;//商品描述
    private String mchId;//微信支付分配的商户号
    private String nonceStr;//随机字符串，长度要求在32位以内。
    private String notifyUrl;//通知地址
    private String outTradeNo;//商户系统内部订单号，要求32个字符内，只能是数字、大小写字母
    private String spbillCreateIp;//终端IP
    private Integer totalFee;//订单总金额，单位为分
    private String tradeType;//交易类型
    private String openid;
    private String sign;//签名
    private String key;

}

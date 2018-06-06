package com.cunjia.ordering.domain;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class ResultXML {
    private String return_code;
    private String return_msg;//
    private String appid;//小程序ID
    private String mch_id;//商户号
    private String device_info;//设备号
    private String nonce_str;//随机字符串
    private String sign;//签名
    private String result_code;//业务结果
    private String prepay_id;//预支付交易会话标识
    private String trade_type;//交易类型
    private String err_code;//错误代码
    private String err_code_des;//错误代码描述
    private String out_trade_no;//商户订单号
    private String transaction_id;//微信订单号
    private String sign_type;//设备类型
    private Integer recipe_id;//处方id
    private Integer total_fee;//订单总金额，单位分
    private Integer id;
    private String bank_type;//付款银行
    private String openid;//用户标识
    private Integer cash_fee;//现金支付金额
    private String time_end;//支付完成时间
    private String is_subscribe;//是否关注微信公众号
    private String fee_type;//货币种类
    private Integer payState;
    private String trade_state;//交易状态
    private String trade_state_desc;//交易状态描述
    private String attach;//附加数据
    private String code_url;//二维码连接
    private BigDecimal money;//金额
    private Integer payType;//支付类型：1.小程序支付，2.微信扫码支付
    private String sub_mch_id;
    private Integer infoPayState;//0订单已关闭，1未支付，2已支付
    private Date lastTime;//时间

}

package com.cunjia.ordering.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 用户红包表
 */
@Data
public class RedPacketUserVO {
    private Integer redPacketId;//自增id
    private Integer userId;//用户id
    private BigDecimal redPacketPrice;//红包金额
    private Date redPacketGetTime;//获取时间
    private Integer redPacketIsExpired;//红包是否过期：0未过期，1已过期
    private Integer redPacketIsUsed;//红包是否使用0未使用，1已使用
    private Integer redPacketType;//红包类型1=评论 2=点赞 3=分享小程序

    public RedPacketUserVO(){}

    public RedPacketUserVO(Integer userId, BigDecimal redPacketPrice, Integer redPacketType){
        this.userId = userId;
        this.redPacketPrice = redPacketPrice;
        this.redPacketType = redPacketType;
    }
    public RedPacketUserVO(Integer userId){
        this.userId = userId;
    }
}

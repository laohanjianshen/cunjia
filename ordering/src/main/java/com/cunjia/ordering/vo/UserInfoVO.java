package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.math.BigDecimal;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class UserInfoVO {

    private String userName;

    private String userNickname;

    private String userPhone;

    private String userAvatarUrl;

    private Integer userSex;

    private Integer userAge;
    //角色名称
    private String roleName;
    //接口权限
    private String permissionUrl;
    //权限名称
    private String permissionName;
    //店铺id
    private String shopId;
    //店铺名称
    private String shopName;
    //店铺自助点餐包装费
    private BigDecimal shopSelfSurfacePrice;
    //店铺城市
    private String shopCity;
    //店铺优惠截止时间
    private long shopDiscountDeadline;
    //店铺购买截止时间
    private long shopBuyDeadline;
    //地址id
    private Integer addressId;
    //收件人姓名
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

}

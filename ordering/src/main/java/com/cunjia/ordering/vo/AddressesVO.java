package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AddressesVO {
    private Integer addressId;//地址ID
    private Integer userId;//用户id
    private String addressName;//收件人姓名
    private Integer addressSex;//收件人性别0、男性；1、女性
    private String addressPhone;//收件人手机号
    private Integer locationId;//位置id
    private Integer addressDefault;//是否为默认地址：0、否；1、是

    private String cityName;//市名称
    private String districtName;//区名称
    private String locationBuilding;//大厦
    private String addressDetail;//详细地址
}

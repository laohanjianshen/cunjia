package com.cunjia.ordering.domain;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.math.BigDecimal;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Addresses {
    private Integer addressId;//地址ID
    private Integer userId;//用户id
    private String addressName;//收件人姓名0、男性；1、女性
    private Integer addressSex;//收件人性别
    private String addressPhone;//收件人手机号
    private Integer locationId;//位置id
    private Integer addressDefault;//是否为默认地址：0、否；1、是

    public Addresses() {}

    public Addresses(Integer userId, Integer addressDefault, Integer addressId) {
        this.userId = userId;
        this.addressDefault = addressDefault;
        this.addressId = addressId;
    }

}

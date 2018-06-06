package com.cunjia.ordering.dto;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 地址模块
 * @auther xpc 252645816@qq.com
 * @date 2018/5/23 9:23
 */
@Data
public class AddressDTO {
    private String cityName;
    private String districtName;
    private String locationBuilding;
    private String addressDetail;
    private BigDecimal locationLongitude;
    private BigDecimal locationLatitude;
    private Integer locationState;
}

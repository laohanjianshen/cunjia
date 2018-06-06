package com.cunjia.ordering.domain;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 位置
 */
@Data
public class LocationsDO {
    private Integer locationId;//位置id
    private String locationBuilding;//大厦
    private String addressDetail;//详细地址
    private BigDecimal locationLongitude;//经度
    private BigDecimal locationLatitude;//纬度
    private Integer districtId;//区id
    private Integer locationState;//地址状态 0:禁用 1:启用
}

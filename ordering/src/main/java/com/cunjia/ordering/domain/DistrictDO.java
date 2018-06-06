package com.cunjia.ordering.domain;

import lombok.Data;

@Data
public class DistrictDO {
    private Integer districtId;//id
    private String districtName;//区名称
    private Integer cityId;//市id
}

package com.cunjia.ordering.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 位置
 */
@Data
public class LocaltionsVO {
    @ApiModelProperty(value = "位置id")
    private Integer locationId;//位置id
    @ApiModelProperty(value = "大厦")
    private String locationBuilding;
    @ApiModelProperty(value = "详细地址")
    private String addressDetail;
    @ApiModelProperty(value = "经度")
    private BigDecimal locationLongitude;
    @ApiModelProperty(value = "纬度")
    private BigDecimal locationLatitude;

}

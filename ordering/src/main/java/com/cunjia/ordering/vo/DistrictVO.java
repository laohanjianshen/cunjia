package com.cunjia.ordering.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * 区
 */
@Data
public class DistrictVO {
    @ApiModelProperty(value = "区名称")
    private String districtName;//区名称
    @ApiModelProperty(value = "位置list")
    private List<LocaltionsVO> localtionsList;

}

package com.cunjia.ordering.vo;

import com.cunjia.ordering.domain.DistrictDO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * 城市
 */
@Data
public class CityVO {
    @ApiModelProperty(value = "城市名称")
    private String cityName;
    @ApiModelProperty(value = "区list")
    private List<DistrictVO> districtList;
}

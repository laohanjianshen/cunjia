package com.cunjia.ordering.service;

import com.cunjia.ordering.vo.CityVO;
import com.cunjia.ordering.vo.LocaltionsVO;

import java.util.List;

public interface LocationsService {
    List<CityVO> listLocations();
    List<LocaltionsVO> listLatitudeAndLongitudeByCityName(String cityName);//根据市 获取 支持的配送点的经纬度
}

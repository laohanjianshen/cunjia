package com.cunjia.ordering.dao;

import com.cunjia.ordering.vo.CityVO;
import com.cunjia.ordering.vo.LocaltionsVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LocationsMapper {

    List<CityVO> listLocations();
    List<LocaltionsVO> listLatitudeAndLongitudeByCityName(String cityName);//根据市 获取 支持的配送点的经纬度
}

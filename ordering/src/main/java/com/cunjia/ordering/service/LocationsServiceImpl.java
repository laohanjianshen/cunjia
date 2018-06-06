package com.cunjia.ordering.service;

import com.cunjia.ordering.dao.LocationsMapper;
import com.cunjia.ordering.vo.CityVO;
import com.cunjia.ordering.vo.LocaltionsVO;
import org.hibernate.annotations.Source;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LocationsServiceImpl implements LocationsService {
    @Autowired
    LocationsMapper locationsMapper;

    /**
     * 省市区查询  hyf
     * @return json
     */
    @Override
    public List<CityVO> listLocations() {
        return locationsMapper.listLocations();
    }

    /**
     * 获取每个市下面支持配送点的经纬度  hyf
     * @param cityName 城市名称
     * @return 经纬度list
     */
    @Override
    public List<LocaltionsVO> listLatitudeAndLongitudeByCityName(String cityName) {
        return locationsMapper.listLatitudeAndLongitudeByCityName(cityName);
    }
}

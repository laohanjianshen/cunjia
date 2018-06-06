package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.Addresses;
import com.cunjia.ordering.domain.CityDO;
import com.cunjia.ordering.domain.DistrictDO;
import com.cunjia.ordering.domain.LocationsDO;
import com.cunjia.ordering.vo.AddressesVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.List;

@Mapper
public interface AddressesMapper {
    Integer insertAddresses(Addresses addresses);

    List<AddressesVO> listAddresses(Integer userId);

    Integer updateAddressDefault(Addresses addresses);

    Integer updateAddress(Addresses addresses);

    /**后台地址管理页面*/
    CityDO selectByCityName(String cityName);
    int insertCity(CityDO cityDO);
    DistrictDO selectByDistrictName(String districtName);
    int  insertDistrict(DistrictDO districtDO);
    LocationsDO selectByLocationBuildingAndAddressDetail(String locationBuilding,String addressDetail);
    int insertLocation(LocationsDO locationsDO);


}

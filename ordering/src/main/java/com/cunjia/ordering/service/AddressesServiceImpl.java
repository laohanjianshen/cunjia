package com.cunjia.ordering.service;

import com.cunjia.ordering.base.exception.DescribeException;
import com.cunjia.ordering.base.exception.ExceptionEnum;
import com.cunjia.ordering.dao.AddressesMapper;
import com.cunjia.ordering.domain.Addresses;
import com.cunjia.ordering.domain.CityDO;
import com.cunjia.ordering.domain.DistrictDO;
import com.cunjia.ordering.domain.LocationsDO;
import com.cunjia.ordering.dto.AddressDTO;
import com.cunjia.ordering.vo.AddressesVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;

@Service
@Slf4j
public class AddressesServiceImpl implements AddressesService {
    @Resource
    private AddressesMapper addressesMapper;

    /**
     * 新增收获地址
     *
     * @param addresses 收货地址
     * @return
     */
    @Override
    public Integer insertAddresses(Addresses addresses) {
        return addressesMapper.insertAddresses(addresses);
    }

    /**
     * 查询收货地址
     *
     * @param userId 登陆人id
     * @return
     */
    @Override
    public List<AddressesVO> listAddresses(Integer userId) {
        return addressesMapper.listAddresses(userId);
    }


    /**
     * 修改为默认地址
     *
     * @param addresses
     * @return
     */
    @Override
    public Integer updateAddressDefault(Addresses addresses) {
        return addressesMapper.updateAddressDefault(addresses);
    }

    /**
     * 修改配送地址
     *
     * @param addresses
     * @return
     */
    @Override
    public Integer updateAddress(Addresses addresses) {
        return addressesMapper.updateAddress(addresses);
    }

    /**
     * 后台管理页面 添加新的配送点
     *
     * @param addressDTO
     * @return
     * @auther xpc 252645816@qq.com
     */
    @Transactional
    @Override
    public void addAddress4Admin(AddressDTO addressDTO) {
        //1.分别判断是否已经存在该配送城市,配送县区,配送地点;
        //2.根据判断结果,插入数据至相应数据库中;
        if (null == addressDTO) {
            return;
        }
        Integer cityId = null;
        Integer districtId = null;
        CityDO cityDO = addressesMapper.selectByCityName(addressDTO.getCityName());
        if (cityDO == null) {
            CityDO cityDONew = new CityDO();
            cityDONew.setCityName(addressDTO.getCityName());
            addressesMapper.insertCity(cityDONew);
            cityId = cityDONew.getCityId();
        } else {
            cityId = cityDO.getCityId();
        }
        DistrictDO districtDO = addressesMapper.selectByDistrictName(addressDTO.getDistrictName());
        if (null == districtDO) {
            DistrictDO districtDONew = new DistrictDO();
            districtDONew.setDistrictName(addressDTO.getDistrictName());
            districtDONew.setCityId(cityId);
            addressesMapper.insertDistrict(districtDONew);
            districtId = districtDONew.getDistrictId();
        } else {
            districtId = districtDO.getDistrictId();
        }
        LocationsDO locationsDO = addressesMapper.selectByLocationBuildingAndAddressDetail(addressDTO.getLocationBuilding(), addressDTO.getAddressDetail());
        if (null == locationsDO) {
            LocationsDO locationsDONew = new LocationsDO();
            locationsDONew.setLocationBuilding(addressDTO.getLocationBuilding());
            locationsDONew.setAddressDetail(addressDTO.getAddressDetail());
            locationsDONew.setLocationLongitude(addressDTO.getLocationLongitude());
            locationsDONew.setLocationLatitude(addressDTO.getLocationLatitude());
            locationsDONew.setDistrictId(districtId);
            locationsDONew.setLocationState(addressDTO.getLocationState());
            addressesMapper.insertLocation(locationsDONew);
        } else {
            log.error("[后台管理页面添加地址]:新增失败,该地址已存在");
            throw new DescribeException(ExceptionEnum.ADDRESS_ALREADY_EXIST);
        }
    }
}

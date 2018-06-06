package com.cunjia.ordering.service;

import com.cunjia.ordering.domain.Addresses;
import com.cunjia.ordering.dto.AddressDTO;
import com.cunjia.ordering.vo.AddressesVO;

import java.util.List;

public interface AddressesService {
    Integer insertAddresses(Addresses addresses);
    List<AddressesVO> listAddresses(Integer userId);
    Integer updateAddressDefault(Addresses addresses);
    Integer updateAddress(Addresses addresses);
    //后台管理页面 添加新的配送点
    void addAddress4Admin(AddressDTO addressDTO);
}

package com.cunjia.ordering.dao;

import com.cunjia.ordering.vo.ShopsVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShopsMapper {

    /*
     * 通过shopId获取商铺信息
     */
    ShopsVO getShopInfoByShopId(Integer shopId);

    /*
     * 通过shopId获取商铺的倒计时信息
     */
    ShopsVO getShopTimestampByShopId(Integer shopId);
}
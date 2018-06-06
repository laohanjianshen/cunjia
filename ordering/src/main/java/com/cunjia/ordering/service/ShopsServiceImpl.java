package com.cunjia.ordering.service;

import com.cunjia.ordering.dao.ShopsMapper;
import com.cunjia.ordering.vo.ShopsVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("shopService")
public class ShopsServiceImpl implements ShopsService {

    @Resource
    private ShopsMapper shopsMapper;

    /**
     * 通过shopId获取商铺信息
     * @author 甘雨
     * @param shopId 用户商铺id
     * @return 商铺
     */
    @Override
    public ShopsVO getShopInfo(Integer shopId) {
        return shopsMapper.getShopInfoByShopId(shopId);
    }

    /**
     * 通过shopId获取商铺的倒计时信息
     * @author 甘雨
     * @param shopId 用户商铺id
     * @return 商铺的优惠倒计时和订单倒计时
     */
    @Override
    public ShopsVO getShopTimestamp(Integer shopId) {
        return shopsMapper.getShopTimestampByShopId(shopId);
    }

}

package com.cunjia.ordering.service;

import com.cunjia.ordering.dao.GoodsSkuMapper;
import com.cunjia.ordering.domain.GoodsSku;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("goodsSkuService")
public class GoodsSkuServiceImpl implements GoodsSkuService{

    @Resource
    private GoodsSkuMapper goodsSkuMapper;

    /**
     * 获得商品的单个sku
     * @param skuId skuId
     * @return sku object
     */
    public GoodsSku getGoodsSku(Integer skuId) {
//        return goodsSkuMapper.selectBySkuId(skuId);
        return null;
    }

    /**
     * 获得商品的多个sku
     * @param goodsId 商品的id
     * @return goodsSku List
     */
    @Override
    public List<GoodsSku> getGoodsSkuList(Integer goodsId) {
//        return goodsSkuMapper.selectByGoodsId(goodsId);
        return null;
    }

}

package com.cunjia.ordering.service;

import com.cunjia.ordering.domain.GoodsSku;

import java.util.List;

public interface GoodsSkuService {

    //获取商品单个sku
    GoodsSku getGoodsSku(Integer skuId);

    //获取多个sku
    List<GoodsSku> getGoodsSkuList(Integer goodsId);
}

package com.cunjia.ordering.service;

import com.cunjia.ordering.domain.Goods;

import java.util.List;

public interface GoodsService {
    //获取单个商品
    Goods getGoods(Integer goodsId);

    //获取商品列表
    List<Goods> getGoodsList(List<Integer> goodsIds);
}
package com.cunjia.ordering.service;

import com.cunjia.ordering.dao.GoodsMapper;
import com.cunjia.ordering.domain.Goods;
import com.cunjia.ordering.domain.GoodsSku;
import com.cunjia.ordering.vo.GoodsDetailVO;
import com.cunjia.ordering.vo.GoodsSkuVO;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

    @Resource
    private GoodsMapper goodsMapper;

    /**
     * 获得单个商品
     *
     * @param goodsId 商品id
     * @return 商品object
     */
    @Override
    public Goods getGoods(Integer goodsId) {
//        return goodsMapper.selectByGoodsId(goodsId);
        return null;
    }

    /**
     * 获取商品列表
     *
     * @return
     */
    @Override
    public List<Goods> getGoodsList(List<Integer> goodsIds) {
//        return goodsMapper.getGoodsListByGoodsIds(goodsIds);
        return null;
    }
}
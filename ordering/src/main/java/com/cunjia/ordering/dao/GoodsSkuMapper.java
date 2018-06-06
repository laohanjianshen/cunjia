package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.GoodsSku;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface GoodsSkuMapper {
    int deleteByPrimaryKey(Integer skuId);

    int insert(GoodsSku record);

    int insertSelective(GoodsSku record);

    GoodsSku selectByPrimaryKey(Integer skuId);

    int updateByPrimaryKeySelective(GoodsSku record);

    int updateByPrimaryKey(GoodsSku record);

    List<GoodsSku> findAllByGoodsId(Integer goodsId);

}
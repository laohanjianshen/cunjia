package com.cunjia.ordering.dao;

import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.domain.Goods;
import com.cunjia.ordering.domain.Order;
import com.cunjia.ordering.domain.OrdersBoxLunch;
import com.cunjia.ordering.vo.BoxLunchVO;
import com.cunjia.ordering.vo.OrderBoxLunchVO;
import com.cunjia.ordering.vo.OrderDetailVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrdersGoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrdersBoxLunch record);

    int insertSelective(OrdersBoxLunch record);

    int updateByPrimaryKeySelective(OrdersBoxLunch record);

    int updateByPrimaryKey(OrdersBoxLunch record);

    int insertBatch(List<BoxLunchVO> goodsList);

}
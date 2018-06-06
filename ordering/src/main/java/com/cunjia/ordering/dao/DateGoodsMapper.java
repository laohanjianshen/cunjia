package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.DateGoods;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DateGoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DateGoods record);

    int insertSelective(DateGoods record);

    DateGoods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DateGoods record);

    int updateByPrimaryKey(DateGoods record);

    List<DateGoods> selectGoodsListByTimestamp(List<Long> list);
}
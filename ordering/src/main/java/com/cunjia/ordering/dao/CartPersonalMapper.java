package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.CartPersonal;
import com.cunjia.ordering.domain.DateBoxLunch;
import com.cunjia.ordering.vo.BoxLunchVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface CartPersonalMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CartPersonal record);

    int insertSelective(CartPersonal record);

    CartPersonal selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CartPersonal record);

    int updateByPrimaryKey(CartPersonal record);

    List<CartPersonal> selectByUserId(Integer userId);

    List<CartPersonal> selectByUserIdAndDate(Integer userId, Long boxLunchDate);

    List<CartPersonal> selectByUserIdAndDateList(Map map);

    CartPersonal selectByUserIdAndBoxLunchIdAndSkuIdAndTypeAndDate(Integer userId, Integer boxLunchId, Integer skuId, Integer boxLunchType, Long boxLunchDate);

    void deleteByPrimaryKeyList(List<Integer> idList);

    List<CartPersonal> selectAllByUserId(Integer userId);

    int deleteBoxLunchList(@Param("userId") Integer userId, @Param("list") List<BoxLunchVO> boxLunches);
}
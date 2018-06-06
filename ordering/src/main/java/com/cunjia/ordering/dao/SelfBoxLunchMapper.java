package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.SelfBoxLunch;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SelfBoxLunchMapper {
    int deleteByPrimaryKey(Integer selfId);

    int insert(SelfBoxLunch record);

    int insertSelective(SelfBoxLunch record);

    SelfBoxLunch selectByPrimaryKey(Integer selfId);

    int updateByPrimaryKeySelective(SelfBoxLunch record);

    int updateByPrimaryKey(SelfBoxLunch record);

    SelfBoxLunch selectOneByUserId(Integer userId);

    int insertAndReturnSelfId(SelfBoxLunch selfBoxLunch);

    List<SelfBoxLunch> listByUserId(Integer userId);

    int deleteByUserId(Integer userId);
}
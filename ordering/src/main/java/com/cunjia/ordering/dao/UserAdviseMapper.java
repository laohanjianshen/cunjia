package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.UserAdvise;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserAdviseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserAdvise record);

    int insertSelective(UserAdvise record);

    UserAdvise selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserAdvise record);

    int updateByPrimaryKeyWithBLOBs(UserAdvise record);

    int updateByPrimaryKey(UserAdvise record);

    List<UserAdvise> findAllAdviseOrderByTime();

    List<UserAdvise> findAllByUserIdOrderByTimeDESC(Integer userId);
}
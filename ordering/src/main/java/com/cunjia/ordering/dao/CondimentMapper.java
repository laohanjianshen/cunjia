package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.Condiment;
import com.cunjia.ordering.vo.CondimentVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface CondimentMapper {

    /*
     * 获取某个盒饭的调料包列表
     */
    ArrayList<CondimentVO> getCondimentListByBoxLunchId(Integer boxLunchId);
    /**
     * 购物车模块
     * 通过调料Id查询出调料名等
     */
    Condiment selectByPrimaryKey(Integer condimentId);
}
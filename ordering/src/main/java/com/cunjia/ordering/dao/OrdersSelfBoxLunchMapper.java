package com.cunjia.ordering.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.domain.OrdersSelfBoxLunch;
import com.cunjia.ordering.vo.BoxLunchVO;
import com.cunjia.ordering.vo.OrderBoxLunchVO;
import com.cunjia.ordering.vo.OrderDetailVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrdersSelfBoxLunchMapper extends BaseMapper<OrdersSelfBoxLunch> {

    int insertSelfBatch(List<BoxLunchVO> goodsList);

}
package com.cunjia.ordering.dao;

import com.cunjia.ordering.vo.BoxLunchPraiseVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface BoxLunchPraiseMapper {

    /*
     * 检查用户对盒饭的点赞是否存在
     */
    BoxLunchPraiseVO checkBoxLunchPraiseByUserId(Map<String,Object> paramMap);

    /*
     * 添加点赞
     */
    void addPraise();
}
package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.util.ArrayList;

/**
 * 分类食品VO
 */
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class FoodsClassifyVo {
    //食品类型id
    private Integer categoryId;
    //食品类型名称
    private String categoryName;
    //食物分类属性 1 必点 2 选点
    private Integer categoryClassify;
    //食品分类列表
    private ArrayList<FoodsVO> foodsList;
}

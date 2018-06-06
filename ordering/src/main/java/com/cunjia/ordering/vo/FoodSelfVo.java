package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.util.ArrayList;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class FoodSelfVo {

    //食物分类id
    private Integer categoryId;
    //食物分类名称
    private String categoryName;
    //食物列表
    private ArrayList<FoodsVO> foodVOList;
}

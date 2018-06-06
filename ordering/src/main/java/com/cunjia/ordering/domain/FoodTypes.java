package com.cunjia.ordering.domain;

import lombok.Data;

@Data
public class FoodTypes {
    private Integer categoryId;//食品类型id
    private String categoryName;//食品类型名称
    private String categoryDesc;//食品类型描述
    private Integer categoryClassify;//食品类型分类 1 必点 2 选点
}

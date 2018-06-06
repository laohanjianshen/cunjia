package com.cunjia.ordering.dto;

import lombok.Data;

import java.util.Map;

@Data
public class PageInfo {

    //偏移量
    private Integer offset;
    //长度
    private Integer limit;
    //排序规则map
    private Map<String,Object> sorts;
}

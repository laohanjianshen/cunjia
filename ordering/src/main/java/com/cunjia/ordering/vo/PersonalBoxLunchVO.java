package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.util.ArrayList;

/**
 * 个人点餐页面接口中的盒饭数据结构
 */

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class PersonalBoxLunchVO {

    //盒饭分类id
    private Integer categoryId;
    //盒饭分类名称
    private String categoryName;
    //盒饭详情list
    private ArrayList<BoxLunchVO> boxLunchVOList;
}

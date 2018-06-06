package com.cunjia.ordering.domain;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class BoxLunchPraise {
    //自增id
    private Integer id;
    //用户id
    private Integer userId;
    //盒饭id
    private Integer boxLunchId;
    //是否取消点赞 0=已点赞 1=已取消点赞
    private Byte boxLunchPraiseStatus;
}
package com.cunjia.ordering.domain;

import lombok.Data;

import java.util.Date;

/**
 * 二级评论
 */
@Data
public class CommentSecondLevelDO {
    private Integer commentSecondLevelId;//主键
    private Integer userId;//用户id
    private String commentDetail;//评论详情
    private Date commentDate;//评论时间
    private Integer isAnonymous;//是否匿名0=否 1=是
    private Integer commentFirstLevelId;//一级评论id
}

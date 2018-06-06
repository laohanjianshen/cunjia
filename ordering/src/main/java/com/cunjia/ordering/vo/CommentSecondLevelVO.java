package com.cunjia.ordering.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.util.Date;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CommentSecondLevelVO {
    private Integer comment_second_level_id;//主键
    private Integer userId;//用户id
    private String commentDetail;//评论详情
    private Date commentDate;//评论时间
    private Integer isAnonymous;//是否匿名0=否 1=是
    private Integer commentFirstLevelId;//一级评论id
    private String seondUserName;//用户名称
    private String userAvatarUrl;//微信头像url
}

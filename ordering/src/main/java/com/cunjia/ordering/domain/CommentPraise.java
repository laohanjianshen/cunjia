package com.cunjia.ordering.domain;

import lombok.Data;

/**
 * 点赞记录表
 */
@Data
public class CommentPraise {
    private Integer commentPraiseId;//id
    private Integer userId;//用户id
    private Integer commentFirstLevelId;//一级评论id
    private Integer commentPraiseStatus;//是否取消点赞 0=已点赞 1=已取消点赞
}

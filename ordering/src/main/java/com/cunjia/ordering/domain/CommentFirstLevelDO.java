package com.cunjia.ordering.domain;

import lombok.Data;

import java.util.Date;

/**
 * 一级评论表
 */
@Data
public class CommentFirstLevelDO {
    private Integer commentFirstLevelId;//id
    private Integer userId;//用户id
    private Integer goodsId;//商品id
    private Integer flavor;//口味
    private Integer packing;//包装
    private String commentDetail;//评论详情
    private Date commentDate;//评论时间
    private String pictureUrl;//图片url
    private Integer commentSource;//评价来源 1=盒饭,2=食物
    private Integer praiseNumber;//点赞数量
    private Integer isAnonymous;//是否匿名0=否 1=是
    private Integer totalEvaluate; //总评价(1=差，2=一般，3=还不错，4=很满意，5=强烈推荐)
    private Integer commentNumber;//评论总数量
}

package com.cunjia.ordering.dto;

import lombok.Data;

import java.util.List;

/**
 * 一级评论表DTO
 */
@Data
public class CommentFirstLevelDTO extends PageInfo {
    private Integer commentFirstLevelId;//id
    private Integer userId;//用户id
    private Integer goodsId;//商品id
    private Integer flavor;//口味
    private Integer packing;//包装
    private String commentDetail;//评论详情
    private String pictureUrl;//图片url
    private Integer commentSource;//评价来源 1=盒饭,2=食物
    private Integer praiseNumber;//点赞数量
    private Integer isAnonymous;//是否匿名0=否 1=是
    private Integer totalEvaluate; //总评价(1=差，2=一般，3=还不错，4=很满意，5=强烈推荐)
    private List<GoodsDescribeDTO> list;//商品描述list
    private Integer goodsDescribeId;//商品评价id
    private Integer orderId;//订单id
    private Integer boxLunchIsFire;//是否上月爆款 0 否，1是
    private Integer isPicture;//是否是图片查询 0=否 1=是
    private Integer boxLunchId;//评论自助点餐的时候需要用到的字段  临时盒饭id
}

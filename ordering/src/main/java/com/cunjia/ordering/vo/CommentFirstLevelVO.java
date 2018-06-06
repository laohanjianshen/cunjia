package com.cunjia.ordering.vo;

import com.cunjia.ordering.dto.GoodsDescribeDTO;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CommentFirstLevelVO {
    private Integer commentFirstLevelId;//id
    private Integer userId;//用户id
    private Integer goodsId;//商品id
    private Integer flavor;//口味
    private Integer packing;//包装
    private String commentDetail;//评论详情
    private String pictureUrl;//图片url
    private Integer commentSource;//评价来源 1=盒饭,2=食物
    private Integer praiseNumber;//点赞数量
    private Date commentDate;//评论时间
    private Integer isAnonymous;//是否匿名0=否 1=是
    private Integer totalEvaluate; //总评价(1=差，2=一般，3=还不错，4=很满意，5=强烈推荐)
    private String userName;//用户名称
    private List<CommentSecondLevelVO> CommentSecondLevelList;//二级评论list
    private Integer averageFlavor;//口味平均值
    private Integer averagePacking;//包装平均值
    private Integer sumCommentNumber;
    private Integer isPraise;//是否点赞 0 = 未点赞， 1 = 已点赞
    private BigDecimal percentageTotalEvaluate;//好评百分比
    private BigDecimal percentageFlavor;//口味百分比
    private BigDecimal percentagePacking;//包装百分比
    private Integer commentNumber;//总评论数
    private String userAvatarUrl;//微信头像url
}

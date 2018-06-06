package com.cunjia.ordering.service;

import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.domain.CommentFirstLevelDO;
import com.cunjia.ordering.domain.CommentPraise;
import com.cunjia.ordering.domain.GoodsDescribeDO;
import com.cunjia.ordering.dto.CommentFirstLevelDTO;
import com.cunjia.ordering.vo.CommentFirstLevelVO;
import com.cunjia.ordering.vo.GoodsDescribeVO;

import java.util.List;

public interface CommentFirstLevelService {
    List<GoodsDescribeDO> listGoodsDescribe();
    Integer insertCommentFirstLevel(CommentFirstLevelDTO commentFirstLevelDTO);
    List<GoodsDescribeVO> listSumGoodsDescribe(CommentFirstLevelDTO commentFirstLevelDTO);
    //List<CommentFirstLevelVO> listCommentFirstLevel(CommentFirstLevelDTO commentFirstLevelDTO);

    List<CommentFirstLevelVO> listCommentFirstLevelByDescribeId(CommentFirstLevelDTO commentFirstLevelDTO);
    List<CommentFirstLevelDO> listFlavorAndPacking(CommentFirstLevelDTO commentFirstLevelDTO);

    List<CommentFirstLevelDO> listPraiseNumber(List<Integer> list);

    Integer insertCommentPraise(CommentPraise commentPraise);//新增点赞记录
    Integer updateCommentPraise(CommentPraise commentPraise);//取消点赞

    List<CommentPraise> listCommentPraise(Integer userId);//根据userId 获取已点赞的一级评论id

    Integer updateCommentPraiseStatus(CommentPraise commentPraise);

    List<CommentFirstLevelVO> listAllCommentFirstLevel(CommentFirstLevelDTO commentFirstLevelDTO);//根据商品id 来源 查询所有一级评价

    Integer increasePraiseNumber(Integer id);//点赞数量+1
    Integer decreasePraiseNumber(Integer id);//点赞数量-1
    Integer increaseCommentNumber(Integer id);//二级评论数量+1
}

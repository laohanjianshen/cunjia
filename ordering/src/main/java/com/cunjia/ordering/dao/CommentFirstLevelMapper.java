package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.CommentFirstLevelDO;
import com.cunjia.ordering.domain.GoodsDescribeDO;
import com.cunjia.ordering.dto.CommentFirstLevelDTO;
import com.cunjia.ordering.vo.CommentFirstLevelVO;
import com.cunjia.ordering.vo.GoodsDescribeVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface CommentFirstLevelMapper {
    @Select("SELECT goods_describe_id,describe_name FROM `goods_describe` ")
    List<GoodsDescribeDO> listGoodsDescribe();

    Integer insertCommentFirstLevel(CommentFirstLevelDTO commentFirstLevelDTO);

    Integer insertCommentFirstLevelDescribe(CommentFirstLevelDTO commentFirstLevelDTO);

    List<GoodsDescribeVO> listSumGoodsDescribe(CommentFirstLevelDTO commentFirstLevelDTO);

    //List<CommentFirstLevelVO> listCommentFirstLevel(CommentFirstLevelDTO commentFirstLevelDTO);

    List<CommentFirstLevelVO> listCommentFirstLevelByDescribeId(CommentFirstLevelDTO commentFirstLevelDTO);

    @Select("SELECT  packing,flavor,total_evaluate as totalEvaluate FROM `comment_first_level` WHERE goods_id = #{goodsId} AND comment_source = #{commentSource}")
    List<CommentFirstLevelDO> listFlavorAndPacking(CommentFirstLevelDTO commentFirstLevelDTO);

    List<CommentFirstLevelDO> listPraiseNumber(List<Integer> list);

    List<CommentFirstLevelVO> listAllCommentFirstLevel(CommentFirstLevelDTO commentFirstLevelDTO);

    @Update("UPDATE `comment_first_level` SET praise_number = praise_number+1 WHERE comment_first_level_id = #{id}")
    Integer increasePraiseNumber(Integer id);//点赞数量+1

    @Update("UPDATE `comment_first_level` SET praise_number = praise_number-1 WHERE comment_first_level_id = #{id}")
    Integer decreasePraiseNumber(Integer id);//点赞数量-1

    @Update("UPDATE `comment_first_level` SET comment_number = comment_number+1 WHERE comment_first_level_id = #{id}")
    Integer increaseCommentNumber(Integer id);//二级评论数量+1
}

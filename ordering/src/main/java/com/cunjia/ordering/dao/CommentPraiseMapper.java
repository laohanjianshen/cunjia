package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.CommentPraise;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * 评论点赞Mapper
 */
@Mapper
public interface CommentPraiseMapper {
    @Insert("INSERT INTO `comment_praise` (user_id, comment_first_level_id) VALUES(#{userId},#{commentFirstLevelId})")
    Integer insertCommentPraise(CommentPraise commentPraise);

    @Update("UPDATE `comment_praise` SET comment_praise_status = 1 WHERE user_id = #{userId} AND comment_first_level_id = #{commentFirstLevelId}")
    Integer updateCommentPraise(CommentPraise commentPraise);

    @Select("SELECT comment_first_level_id FROM `comment_praise` WHERE user_id = #{userId} AND comment_praise_status = 1")
    List<CommentPraise> listCommentPraise(Integer userId);

    @Update("UPDATE `comment_praise` SET comment_praise_status = 1   WHERE comment_praise_id = (  " +
            "SELECT s.comment_praise_id FROM (  SELECT comment_praise_id FROM `comment_praise` WHERE user_id = #{userId} AND comment_first_level_id = #{commentFirstLevelId} " +
            ") AS s  )")
    Integer updateCommentPraiseStatus(CommentPraise commentPraise);
}

package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.CommentSecondLevelDO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentSecondLevelMapper {
    @Insert("INSERT INTO `comment_second_level`(user_id,comment_detail,is_anonymous,comment_first_level_id) VALUES(#{userId},#{commentDetail},#{isAnonymous},#{commentFirstLevelId})")
    Integer insertCommentSecondLevel(CommentSecondLevelDO commentSecondLevelDO);
}

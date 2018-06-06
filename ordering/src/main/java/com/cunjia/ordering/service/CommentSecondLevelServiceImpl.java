package com.cunjia.ordering.service;

import com.cunjia.ordering.dao.CommentSecondLevelMapper;
import com.cunjia.ordering.domain.CommentSecondLevelDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentSecondLevelServiceImpl implements CommentSecondLevelService {
    @Autowired
    CommentSecondLevelMapper commentSecondLevelMapper;

    /**
     * 新增二级评论
     * @param commentSecondLevelDO 二级评论表
     * @return 0/1
     */
    @Override
    public Integer insertCommentSecondLevel(CommentSecondLevelDO commentSecondLevelDO) {
        return commentSecondLevelMapper.insertCommentSecondLevel(commentSecondLevelDO);
    }
}

package com.cunjia.ordering.service;

import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.dao.CommentFirstLevelMapper;
import com.cunjia.ordering.dao.CommentPraiseMapper;
import com.cunjia.ordering.dao.OrdersMapper;
import com.cunjia.ordering.domain.CommentFirstLevelDO;
import com.cunjia.ordering.domain.CommentPraise;
import com.cunjia.ordering.domain.GoodsDescribeDO;
import com.cunjia.ordering.domain.Order;
import com.cunjia.ordering.dto.CommentFirstLevelDTO;
import com.cunjia.ordering.vo.CommentFirstLevelVO;
import com.cunjia.ordering.vo.GoodsDescribeVO;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * 评论service
 */
@Service
public class CommentFirstLevelServiceImpl implements CommentFirstLevelService {

    @Autowired
    private CommentFirstLevelMapper commentFirstLevelMapper;
    @Autowired
    private OrderService orderService;
    @Autowired
    private CommentPraiseMapper commentPraiseMapper;
    @Autowired
    private OrdersMapper ordersMapper;
    /**
     * 获取商品描述
     *
     * @return 返回描述集合
     */
    @Override
    public List<GoodsDescribeDO> listGoodsDescribe() {
        return commentFirstLevelMapper.listGoodsDescribe();
    }

    /**
     * 新增商品评价
     *
     * @param commentFirstLevelDTO 一级评价DTO
     * @return Integer
     */
    @Override
    @Transactional
    public Integer insertCommentFirstLevel(CommentFirstLevelDTO commentFirstLevelDTO) {
        if (commentFirstLevelMapper.insertCommentFirstLevel(commentFirstLevelDTO) > Constants.ZERO) {//新增评论
            if (CollectionUtils.isNotEmpty(commentFirstLevelDTO.getList())) {//新增评论描述
                commentFirstLevelMapper.insertCommentFirstLevelDescribe(commentFirstLevelDTO);
            }
            if (commentFirstLevelDTO.getCommentSource() == Constants.ONE) {//来源为盒饭
                if (ordersMapper.updateOrderBuxlunchCommentStatus(commentFirstLevelDTO) > Constants.ZERO) {//修改订单下的商品的评论状态
                    if (ordersMapper.countOrderBuxlunchByCommentStatus(commentFirstLevelDTO.getOrderId()) > Constants.ZERO) {//有未完成的评价
                        return Constants.ONE;
                    }
                }
            } else {//来源为食物
                if (ordersMapper.updateSelfBoxLunchDetailCommentStatus(commentFirstLevelDTO) > Constants.ZERO) {//修改订单下的商品的评论状态
                    if (ordersMapper.countSelfBoxLunchDetailCommentStatus(commentFirstLevelDTO.getOrderId()) > Constants.ZERO) {//有未完成的评价
                        return Constants.ONE;
                    }
                }
            }
            orderService.updateOrderInfo(new Order(commentFirstLevelDTO.getOrderId(), Constants.FIVE));//修改订单状态为已完成
            return Constants.ONE;
        }
        return Constants.ZERO;
    }

    /**
     * 分组商品描述并统计
     *
     * @param commentFirstLevelDTO 一级评价DTO
     * @return list
     */
    @Override
    public List<GoodsDescribeVO> listSumGoodsDescribe(CommentFirstLevelDTO commentFirstLevelDTO) {
        return commentFirstLevelMapper.listSumGoodsDescribe(commentFirstLevelDTO);
    }

   /* *//**
     * 获取商品评价列表
     *
     * @param commentFirstLevelDTO 一级评价DTO
     * @return list
     *//*
    @Override
    public List<CommentFirstLevelVO> listCommentFirstLevel(CommentFirstLevelDTO commentFirstLevelDTO) {
        return commentFirstLevelMapper.listCommentFirstLevel(commentFirstLevelDTO);
    }*/

    /**
     * 根据评价描述获取商品评价列表
     *
     * @param commentFirstLevelDTO 一级评价DTO
     * @return list
     */
    @Override
    public List<CommentFirstLevelVO> listCommentFirstLevelByDescribeId(CommentFirstLevelDTO commentFirstLevelDTO) {
        return commentFirstLevelMapper.listCommentFirstLevelByDescribeId(commentFirstLevelDTO);
    }

    /**
     * 获取评论包装和口味 百分比
     *
     * @param commentFirstLevelDTO 一级评价DTO
     * @return list
     */
    @Override
    public List<CommentFirstLevelDO> listFlavorAndPacking(CommentFirstLevelDTO commentFirstLevelDTO) {
        return commentFirstLevelMapper.listFlavorAndPacking(commentFirstLevelDTO);
    }

    /**
     * 获取一级评论被点赞数量
     * @param list 一级评价id
     * @return list
     */
    @Override
    public List<CommentFirstLevelDO> listPraiseNumber(List<Integer> list) {
        if (CollectionUtils.isNotEmpty(list)) {
            return commentFirstLevelMapper.listPraiseNumber(list);
        }
        return null;
    }

    /**
     * 新增点赞记录
     * @param commentPraise 点赞记录表
     * @return int
     */
    @Override
    public Integer insertCommentPraise(CommentPraise commentPraise) {
        return commentPraiseMapper.insertCommentPraise(commentPraise);
    }

    /**
     * 取消点赞
     * @param commentPraise
     * @return
     */
    @Override
    public Integer updateCommentPraise(CommentPraise commentPraise) {
        return commentPraiseMapper.updateCommentPraise(commentPraise);
    }

    /**
     * 根据userId 获取已点赞的一级评论id
     * @param userId 用户id
     * @return 一级评论id List
     */
    @Override
    public List<CommentPraise> listCommentPraise(Integer userId) {
        return commentPraiseMapper.listCommentPraise(userId);
    }

    /**
     * 先查询是否存在记录，如果存在 则修改状态为已点赞
     * @param commentPraise
     * @return
     */
    @Override
    public Integer updateCommentPraiseStatus(CommentPraise commentPraise) {
        return commentPraiseMapper.updateCommentPraiseStatus(commentPraise);
    }

    /**
     * 根据商品id 和来源查询所有一级评论
     * @param commentFirstLevelDTO 一级评论
     * @return 查询结果
     */
    @Override
    public List<CommentFirstLevelVO> listAllCommentFirstLevel(CommentFirstLevelDTO commentFirstLevelDTO) {
        return commentFirstLevelMapper.listAllCommentFirstLevel(commentFirstLevelDTO);
    }

    /**
     * 对点赞数量+1
     * @param id 一级评价id
     * @return int
     */
    @Override
    public Integer increasePraiseNumber(Integer id) {
        return commentFirstLevelMapper.increasePraiseNumber(id);
    }

    /**
     * 对点赞数量-1
     * @param id 一级评价id
     * @return int
     */
    @Override
    public Integer decreasePraiseNumber(Integer id) {
        return commentFirstLevelMapper.decreasePraiseNumber(id);
    }

    /**
     * 对评论数量+1
     * @param id 一级评论主键
     * @return int
     */
    @Override
    public Integer increaseCommentNumber(Integer id) {
        return commentFirstLevelMapper.increaseCommentNumber(id);
    }

}

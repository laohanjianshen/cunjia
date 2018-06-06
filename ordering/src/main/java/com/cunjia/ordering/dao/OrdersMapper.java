package com.cunjia.ordering.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.cunjia.ordering.domain.Order;
import com.cunjia.ordering.dto.CommentFirstLevelDTO;
import com.cunjia.ordering.dto.PageInfo;
import com.cunjia.ordering.vo.OrderDetailVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface OrdersMapper extends BaseMapper<Order> {
    int deleteByPrimaryKey(Integer orderId);

    int insertOrderBatch(List<OrderDetailVO> record);

    Order selectByPrimaryKey(Integer orderId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    List<Order> getOrderListByUserId(@Param(value = "userId") Integer userId,
                                     @Param(value = "page") PageInfo pageInfo, @Param(value = "order")Order order);

    List<Order> getOrderListAll(@Param(value = "userId") Integer userId,
                                     @Param(value = "page") PageInfo pageInfo);

    List<OrderDetailVO> getPersonOrderDetail(Integer orderId);

    List<OrderDetailVO> getSelfOrderDetail(Integer orderId);

    int updateOrderStatus(Order order);

    @Update("UPDATE `orders_box_lunch` SET comment_status = 1 WHERE order_id = #{orderId} AND box_lunch_id = #{goodsId}")
    Integer updateOrderBuxlunchCommentStatus(CommentFirstLevelDTO commentFirstLevelDTO);//修改订单下的盒饭为已评论
    @Select("SELECT COUNT(*) FROM `orders_box_lunch` WHERE order_id = #{orderId} AND comment_status = 0")
    Integer countOrderBuxlunchByCommentStatus(Integer orderId);//统计订单下的盒饭是否有未评价的

    @Update("UPDATE `self_box_lunch_detail` SET comment_status = 1 WHERE self_id = (SELECT box_lunch_id FROM `orders_self_box_lunch` WHERE order_id = #{orderId} AND box_lunch_id = #{boxLunchId} )AND food_id = #{goodsId}")
    Integer updateSelfBoxLunchDetailCommentStatus(CommentFirstLevelDTO commentFirstLevelDTO);//修改自助点餐订单下的食物评论状态
    @Select("SELECT COUNT(*) FROM `orders_self_box_lunch` osbl\n" +
            "INNER JOIN `self_box_lunch` sbl ON sbl.self_id = osbl.box_lunch_id AND osbl.order_id = #{orderId}\n" +
            "INNER JOIN `self_box_lunch_detail` sbld ON sbld.self_id = sbl.self_id AND sbld.comment_status = 0")
    Integer countSelfBoxLunchDetailCommentStatus(Integer orderId);//自助点餐统计订单下的食物是否有未评价的
}
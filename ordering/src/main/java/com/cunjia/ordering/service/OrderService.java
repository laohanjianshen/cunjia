package com.cunjia.ordering.service;

import com.cunjia.ordering.domain.Order;
import com.cunjia.ordering.dto.PageInfo;
import com.cunjia.ordering.vo.OrderDetailVO;

import java.util.List;

public interface OrderService {

    public int deleteOrder(Order order);

    public List<OrderDetailVO> getOrderInfo(Order order);

    public int updateOrderInfo(Order order);

    public List<Order> getOrderListPaged(Integer userId, PageInfo pageInfo, Order order);

    int changeOrderStatus(Order order);

    boolean createPersonOrder(Order order, List<OrderDetailVO> orderBoxLunches);

    boolean createSelfOrder(Order order, List<OrderDetailVO> orderBoxLunches);
}

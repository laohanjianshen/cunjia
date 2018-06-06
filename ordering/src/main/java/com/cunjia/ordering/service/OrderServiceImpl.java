package com.cunjia.ordering.service;

import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.dao.*;
import com.cunjia.ordering.domain.Order;
import com.cunjia.ordering.dto.PageInfo;
import com.cunjia.ordering.vo.BoxLunchVO;
import com.cunjia.ordering.vo.OrderDetailVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

    @Resource
    OrdersMapper ordersMapper;
    @Resource
    OrdersGoodsMapper ordersGoodsMapper;
    @Resource
    AddressesMapper addressesMapper;
    @Resource
    BoxLunchMapper boxLunchMapper;
    @Resource
    OrdersSelfBoxLunchMapper ordersSelfBoxLunchMapper;
    @Resource
    CartPersonalMapper cartPersonalMapper;

    /**
     * 删除订单
     *
     * @param order
     * @return
     * @author 靳楠楠
     */
    @Override
    public int deleteOrder(Order order) {
        return ordersMapper.deleteByPrimaryKey(order.getOrderId());
    }

    /**
     * 获取订单详情
     *
     * @param order
     * @return
     * @author 靳楠楠
     */
    @Override
    public List<OrderDetailVO> getOrderInfo(Order order) {
        int orderType = order.getOrderType();
        int orderId = order.getOrderId();
        if (Constants.BOX_LUNCH_TYPE_PERSON == orderType) {
            List<OrderDetailVO> list = ordersMapper.getPersonOrderDetail(orderId);
            System.out.println("个人点餐数据：" + list);
            return ordersMapper.getPersonOrderDetail(orderId);
        } else if (Constants.BOX_LUNCH_TYPE_SELF == orderType) {
            List<OrderDetailVO> list = ordersMapper.getSelfOrderDetail(orderId);
            System.out.println("自助点餐数据：" + list);
            return ordersMapper.getSelfOrderDetail(orderId);
        }
        return null;
    }

    /**
     * 更新订单信息
     *
     * @param order
     * @return
     * @author 靳楠楠
     */
    @Override
    public int updateOrderInfo(Order order) {
        return ordersMapper.updateByPrimaryKeySelective(order);
    }

    /**
     * 分页获取订单列表
     *
     * @param userId
     * @param pageInfo
     * @param order
     * @return
     * @author 靳楠楠
     */
    @Override
    public List<Order> getOrderListPaged(Integer userId, PageInfo pageInfo, Order order) {
        if(order.getOrderStatus() == Constants.ZERO){
            return ordersMapper.getOrderListAll(userId, pageInfo);
        }
        return ordersMapper.getOrderListByUserId(userId, pageInfo,order);
    }

    /**
     * 修改订单状态
     *
     * @param order
     * @return
     * @author 靳楠楠
     */
    @Override
    public int changeOrderStatus(Order order) {
        return ordersMapper.updateOrderStatus(order);
    }

    /**
     * 创建个人点餐订单
     *
     * @param order
     * @param orderBoxLunches
     * @return
     * @author 靳楠楠
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED, timeout = 30)
    public boolean createPersonOrder(Order order, List<OrderDetailVO> orderBoxLunches) {
        int orderResult = ordersMapper.insertOrderBatch(orderBoxLunches);
        List<BoxLunchVO> boxLunches = new ArrayList<>();
        for (OrderDetailVO od : orderBoxLunches) {
            for (BoxLunchVO b : od.getBoxLunchList()) {
                b.setOrderId(od.getOrderId());
                boxLunches.add(b);
            }
        }
        if (orderResult == orderBoxLunches.size()) {
            int result = ordersGoodsMapper.insertBatch(boxLunches);
            if(result == boxLunches.size()){
                System.out.println("创建订单成功后，删除购物车中对应的商品："+boxLunches);
                cartPersonalMapper.deleteBoxLunchList(order.getUserId(), boxLunches);
                return true;
            }
        }
        return false;
    }


    /**
     * 创建自助点餐订单
     *
     * @param order
     * @param orderBoxLunches
     * @return
     * @author 靳楠楠
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED, timeout = 30)
    public boolean createSelfOrder(Order order, List<OrderDetailVO> orderBoxLunches) {
        int orderResult = ordersMapper.insertOrderBatch(orderBoxLunches);

        List<BoxLunchVO> boxLunches = new ArrayList<>();
        for (OrderDetailVO od : orderBoxLunches) {
            for (BoxLunchVO b : od.getBoxLunchList()) {
                b.setOrderId(od.getOrderId());
                boxLunches.add(b);
            }
        }
        if (orderResult == orderBoxLunches.size()) {
            System.out.println("批量插入订单详情：" + boxLunches);
            int result = ordersSelfBoxLunchMapper.insertSelfBatch(boxLunches);
            if(result == boxLunches.size()){

                return true;
            }
        }
        return false;
    }

}

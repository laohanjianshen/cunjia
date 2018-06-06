package com.cunjia.ordering.controller;

import com.alibaba.fastjson.JSONArray;
import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.base.exception.ExceptionEnum;
import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.base.exception.ResultUtil;
import com.cunjia.ordering.domain.Order;
import com.cunjia.ordering.dto.PageInfo;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.service.BoxLunchService;
import com.cunjia.ordering.service.FoodsService;
import com.cunjia.ordering.service.OrderService;
import com.cunjia.ordering.service.UserService;
import com.cunjia.ordering.utils.DateUtil;
import com.cunjia.ordering.utils.NumberUtils;
import com.cunjia.ordering.vo.*;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 订单Controller
 */

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {


    @Resource
    OrderService orderService;
    @Resource
    BoxLunchService boxLunchesList;
    @Resource
    UserService userService;
    @Resource
    FoodsService foodsService;


    /**
     * 个人点餐确认订单
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @ResponseBody
    @PostMapping(value = "/confirmPersonOrder")
    public Result confirmPersonOrder(@Validated ShiroToken token, @Validated Order order, @RequestParam(required = true) String dateList) {
        validateToken(token);
        order.setUserId(token.getUserId());
        System.out.println("token:"+token+"order:"+order+"dateList:"+dateList.toString());
        List<DateBoxLunchVO> dates = JSONArray.parseArray(dateList, DateBoxLunchVO.class);
        List<OrderBoxLunchVO> boxLunchList = new ArrayList<>();
        //判断提交的日期是否有效，无效则直接返回日期无效
        for(DateBoxLunchVO db: dates){
            if(db.getBoxLunchDate() < DateUtil.getCurrentTimestampOfZero()){
                return ResultUtil.error(ExceptionEnum.BOX_LUNCH_DATE_INVALID);
            }
            boxLunchList.addAll(db.getBoxLunchList());
        }
        Map<String, Object> boxLunches = boxLunchesList.getBoxLunchListByIdList(order.getUserId(), boxLunchList);
        System.out.println("套餐列表信息：" + boxLunches);
        if (!(boolean) boxLunches.get(Constants.KEY_IS_TRUE)) {
            List<BoxLunchVO> resultBoxLunches = (List<BoxLunchVO>) boxLunches.get(Constants.KEY_RESULT_LIST);
            return ResultUtil.error(ExceptionEnum.BOX_LUNCH_IN_ORDER_INVALID, resultBoxLunches);
        }
        UserInfoVO userInfoVO = userService.getUserExtraInfo(token.getUserId());
        List<DateBoxLunchVO> resultBoxLunches = (List<DateBoxLunchVO>) boxLunches.get(Constants.KEY_RESULT_LIST);
        OrderDetailVO orderDetailVO = new OrderDetailVO();
        BeanUtils.copyProperties(userInfoVO, orderDetailVO);
        orderDetailVO.setDateBoxLunchList(resultBoxLunches);
        return ResultUtil.success(orderDetailVO);

    }

    /**
     * 自助点餐确认订单
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @ResponseBody
    @PostMapping(value = "/confirmSelfOrder")
    public Result confirmSelfOrder(@Validated ShiroToken token, @Validated Order order, @RequestParam String dateList) {
        validateToken(token);
        order.setUserId(token.getUserId());
        List<DateBoxLunchVO> dates = JSONArray.parseArray(dateList, DateBoxLunchVO.class);
        System.out.println("自助点餐测试数据：" + dates);
        List<OrderBoxLunchVO> boxLunchList = new ArrayList<>();
        //判断提交的日期是否有效，无效则直接返回日期无效
        for(DateBoxLunchVO db: dates){
            if(db.getBoxLunchDate() < DateUtil.getCurrentTimestampOfZero()){
                return ResultUtil.error(ExceptionEnum.BOX_LUNCH_DATE_INVALID);
            }
            boxLunchList.addAll(db.getBoxLunchList());
        }
        Map<String, Object> boxLunches = foodsService.getBoxLunchListByIdList(token.getUserId(), boxLunchList);
        if (!boxLunches.containsKey(Constants.KEY_IS_TRUE)) {
            return ResultUtil.error(ExceptionEnum.BOX_LUNCH_NOT_EXIST);
        }
        List<DateBoxLunchVO> resultBoxLunches = (List<DateBoxLunchVO>) boxLunches.get(Constants.KEY_RESULT_LIST);
        System.out.println("查询结果数据：" + resultBoxLunches);
        if (!(boolean) boxLunches.get(Constants.KEY_IS_TRUE)) {
            return ResultUtil.error(ExceptionEnum.ORDER_BOX_LUNCH_LACK_FOOD, resultBoxLunches);
        }
        UserInfoVO userInfoVO = userService.getUserExtraInfo(token.getUserId());
        System.out.println("用户额外信息："+userInfoVO);
        OrderDetailVO orderDetailVO = new OrderDetailVO();
        BeanUtils.copyProperties(userInfoVO, orderDetailVO);
        orderDetailVO.setDateBoxLunchList(resultBoxLunches);
        return ResultUtil.success(orderDetailVO);

    }
    /**
     * 创建订单
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @ResponseBody
    @PostMapping(value = "/createOrder")
    public Result createOrder(@Validated ShiroToken token, @Validated Order order, @RequestParam String dateList) {
        validateToken(token);
        order.setUserId(token.getUserId());
        //TODO 3、Jmeter并发访问登陆接口，看是否会串数据
        //TODO 4、预计送达时间、配送费由厨房、目的地通过算法得到
        List<OrderDetailVO> orderBoxLunches = JSONArray.parseArray(dateList, OrderDetailVO.class);
        List<String> orderNumbers = NumberUtils.generateOrderNumber(orderBoxLunches.size());
        System.out.println("order："+order);
        System.out.println("参数列表："+dateList);
        int index = 0;
        for(OrderDetailVO od: orderBoxLunches){
            BeanUtils.copyProperties(order, od,"redPacketId","orderTotalPrice","orderSurfacePrice");
            od.setOrderCreateTime(Timestamp.valueOf(LocalDateTime.now()).toString());
            od.setOrderNumber(orderNumbers.get(index++));
            System.out.println("order："+order);
        }
        int orderType = order.getOrderType();
        boolean isSuccess = false;
        if(orderType == Constants.ZERO){
            //个人点餐创建订单
            isSuccess = orderService.createPersonOrder(order, orderBoxLunches);
            System.out.println("result:"+orderBoxLunches);
        }else if(orderType == Constants.ONE){
            //自助点餐创建订单
            isSuccess = orderService.createSelfOrder(order, orderBoxLunches);
        }
        return ResultUtil.error(isSuccess?ExceptionEnum.CREATE_ORDER_SUCCESS:ExceptionEnum.CREATE_ORDER_FAILED,orderBoxLunches);

    }

    /**
     * 删除订单
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @PostMapping(value = "/deleteOrder")
    @ResponseBody
    public Result deleteOrder(@Validated ShiroToken token, @Validated Order order) {
        validateToken(token);
        order.setUserId(token.getUserId());
        int result = orderService.deleteOrder(order);
        if (result == 1) {
            return ResultUtil.success();
        }
        return ResultUtil.error(ExceptionEnum.USER_DELETE_FAILED);
    }

    /**
     * 修改订单状态
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @ResponseBody
    @PostMapping("/changeOrderStatus")
    public Result changeOrderStatus(@Validated ShiroToken token, @Validated Order order, BindingResult bindingResult) {
        validateToken(token);
        order.setUserId(token.getUserId());
        int updateResult = orderService.changeOrderStatus(order);
        if (updateResult != Constants.ONE) {
            return ResultUtil.error(ExceptionEnum.UPDATE_ORDER_INFO_FAILED);
        }
        return ResultUtil.success();
    }

    /**
     * 修改订单信息
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @ResponseBody
    @PostMapping("/updateOrderInfo")
    public Result updateOrderInfo(@Validated ShiroToken token, @Validated Order order, BindingResult bindingResult) {
        validateToken(token);
        order.setUserId(token.getUserId());
        int updateResult = orderService.updateOrderInfo(order);
        if (updateResult != Constants.ONE) {
            return ResultUtil.error(ExceptionEnum.UPDATE_ORDER_INFO_FAILED);
        }
        return ResultUtil.success();
    }

    /**
     * 分页获取用户订单列表
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @ResponseBody
    @PostMapping("/getOrderList")
    public Result getOrderList(ShiroToken token, PageInfo pageInfo, Order order) {
        System.out.println("orderStatus:"+order);
        validateToken(token);
        List<Order> orderList = orderService.getOrderListPaged(token.getUserId(), pageInfo, order);
        return ResultUtil.success(orderList);
    }

    /**
     * 获取订单详情
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @ResponseBody
    @PostMapping("/getOrderDetail")
    public Result getOrderInfo(@Validated ShiroToken token, @Validated Order order) {
        validateToken(token);
        order.setUserId(token.getUserId());
        System.out.println("请求订单详情参数：" + order);
        List<OrderDetailVO> orderDetails = orderService.getOrderInfo(order);
        if (orderDetails != null) {
            return ResultUtil.success(orderDetails);
        }
        return ResultUtil.error(ExceptionEnum.GET_ORDER_DETAIL_FAILED);
    }

}

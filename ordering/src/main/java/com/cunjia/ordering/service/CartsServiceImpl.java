package com.cunjia.ordering.service;

import com.cunjia.ordering.base.exception.DescribeException;
import com.cunjia.ordering.base.exception.ExceptionEnum;
import com.cunjia.ordering.dao.*;
import com.cunjia.ordering.domain.*;
import com.cunjia.ordering.dto.CartPersonalDTO;
import com.cunjia.ordering.dto.CartSelfDTO;
import com.cunjia.ordering.utils.TimeUtils;
import com.cunjia.ordering.vo.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 购物车
 *
 * @auther xpc 252645816@qq.com
 * @date 2018/4/23 21:24
 */
@Service
@Slf4j
public class CartsServiceImpl implements CartsService {

    @Resource
    private CartPersonalMapper cartPersonalMapper;
    @Resource
    private BoxLunchMapper boxLunchMapper;
    @Resource
    private BoxLunchSkuMapper boxLunchSkuMapper;
    @Resource
    private SelfBoxLunchMapper selfBoxLunchMapper;
    @Resource
    private SelfBoxLunchDetailMapper selfBoxLunchDetailMapper;
    @Resource
    private FoodsMapper foodsMapper;
    @Resource
    CondimentMapper condimentMapper;

    /**
     * 个人点餐 添加购物车
     *
     * @param cartPersonalDTO
     * @return
     */
    @Transactional
    @Override
    public void add2Cart4Personal(CartPersonalDTO cartPersonalDTO) {
        //通过userID和boxLunchId->查询并判断该用户购物车中是否存在该商品
        CartPersonal cartPersonal = cartPersonalMapper.selectByUserIdAndBoxLunchIdAndSkuIdAndTypeAndDate(cartPersonalDTO.getUserId(), cartPersonalDTO.getBoxLunchId(), cartPersonalDTO.getSkuId(), cartPersonalDTO.getBoxLunchType(), cartPersonalDTO.getBoxLunchDate());
        Condiment condiment = null;
        if (cartPersonalDTO.getCondimentId() != null) {
            condiment = condimentMapper.selectByPrimaryKey(cartPersonalDTO.getCondimentId());
        }
        //购物车中不存在该商品
        if (cartPersonal == null) {
            System.out.println(cartPersonalDTO.getUserId());
            CartPersonal cartPersonalNew = new CartPersonal();
            //通过boxLunchId联表查询出商品价格等所有相关信息并存放至DTO
            BoxLunchVO boxLunchVO = boxLunchMapper.selectBoxLunchAndSkuByBoxLunchId(cartPersonalDTO.getBoxLunchId());
            //联表查询出调料相关的内容
            BeanUtils.copyProperties(boxLunchVO, cartPersonalNew);
            if (cartPersonalDTO.getCondimentId() != null) {
                cartPersonalNew.setCondimentId(cartPersonalDTO.getCondimentId());
                cartPersonalNew.setCondimentName(condiment.getCondimentName());
            }
            cartPersonalNew.setUserId(cartPersonalDTO.getUserId());
            cartPersonalNew.setBoxLunchNumber(cartPersonalDTO.getBoxLunchNumber());
            cartPersonalNew.setBoxLunchImageUrl(boxLunchVO.getBoxLunchImagesUrl());
            cartPersonalNew.setBoxLunchDate(cartPersonalDTO.getBoxLunchDate());
            cartPersonalNew.setBoxLunchType(cartPersonalDTO.getBoxLunchType());
            //如果用户添加的是sku商品,进一步查询出sku商品的价格等信息
            if (cartPersonalDTO.getSkuId() != null) {
                BoxLunchSku boxLunchSku = boxLunchSkuMapper.selectBySkuId(cartPersonalDTO.getSkuId());
                cartPersonalNew.setSkuId(cartPersonalDTO.getSkuId());
                cartPersonalNew.setBoxLunchSalePrice(boxLunchSku.getSkuSalePrice());
                cartPersonalNew.setBoxLunchPrice(boxLunchSku.getSkuPrice());
                cartPersonalNew.setBoxLunchName(boxLunchSku.getSkuName());
                cartPersonalNew.setBoxLunchType(cartPersonalDTO.getBoxLunchType());
                if (cartPersonalDTO.getCondimentId() != null) {
                    cartPersonalNew.setCondimentId(cartPersonalDTO.getCondimentId());
                    cartPersonalNew.setCondimentName(condiment.getCondimentName());
                }
                cartPersonalMapper.insert(cartPersonalNew);
            } else {
                //非sku商品
                cartPersonalMapper.insert(cartPersonalNew);
            }
        } else {
            //购物车中存在该商品
            cartPersonal.setBoxLunchNumber(cartPersonal.getBoxLunchNumber() + cartPersonalDTO.getBoxLunchNumber());
            cartPersonalMapper.updateByPrimaryKey(cartPersonal);
        }
    }

    /**
     * 自助点餐 添加购物车
     *
     * @param cartSelfDTOList<cartSelfDTO>
     */
    @Transactional
    @Override
    public Integer add2Cart4Self(Integer userId, List<CartSelfDTO> cartSelfDTOList, Long boxLunchDate) {
        Integer selfId = null;
        try {
            //通过foodId的list联表查询获取food所需信息并接收
            List<SelfBoxLunchDetail> selfBoxLunchDetailList = new ArrayList<>();
            //获取foodId的List
            List<Integer> list = new ArrayList<>();
            for (CartSelfDTO cartSelfDTO : cartSelfDTOList) {
                list.add(cartSelfDTO.getFoodId());
            }
            double total = 0.0;
            double saleTotal = 0.0;
            //通过foodId获取food详细信息和所属类别
            List<CartSelfDTO> cartSelfDTOS = foodsMapper.selectFoodsAndFoodsTypeByFoodsId(list);
            //封装成一个完整的盒饭
            for (CartSelfDTO cartSelfDTO : cartSelfDTOS) {
                for (CartSelfDTO cartSelfDTONew:cartSelfDTOList) {
                     if (cartSelfDTO.getCategoryName().equals(cartSelfDTONew.getType())){
                         SelfBoxLunchDetail selfBoxLunchDetail = new SelfBoxLunchDetail();
                         BeanUtils.copyProperties(cartSelfDTO, selfBoxLunchDetail);
                         selfBoxLunchDetail.setFoodType(cartSelfDTO.getCategoryName());
                         selfBoxLunchDetail.setFoodNumber(cartSelfDTONew.getFoodNumber());
                         selfBoxLunchDetailList.add(selfBoxLunchDetail);
                         total += cartSelfDTO.getFoodPrice().multiply(new BigDecimal(selfBoxLunchDetail.getFoodNumber())).doubleValue();
                         saleTotal += cartSelfDTO.getFoodSalePrice().multiply(new BigDecimal(selfBoxLunchDetail.getFoodNumber())).doubleValue();
                     }
                }

            }
            SelfBoxLunch selfBoxLunch = new SelfBoxLunch();
            selfBoxLunch.setBoxLunchDate(boxLunchDate);
            selfBoxLunch.setBoxLunchPrice(new BigDecimal(total).setScale(2, RoundingMode.HALF_EVEN));
            selfBoxLunch.setBoxLunchSalePrice(new BigDecimal(saleTotal).setScale(2, RoundingMode.HALF_EVEN));
            selfBoxLunch.setUserId(userId);
            selfBoxLunchMapper.insertAndReturnSelfId(selfBoxLunch);
            selfId = selfBoxLunch.getSelfId();
            for (SelfBoxLunchDetail selfBoxLunchDetail : selfBoxLunchDetailList
                    ) {
                selfBoxLunchDetail.setSelfId(selfId);
            }
            selfBoxLunchDetailMapper.insertList(selfBoxLunchDetailList);
        } catch (Exception e) {
            log.error("[自助点餐]添加购物车失败 e{}",e);
            throw new DescribeException(ExceptionEnum.ADD_CART_FAIL);
        }
        return selfId;
    }


    /**
     * 个人点餐 查看购物车
     *
     * @param userId
     * @return
     */
    @Override
    public List<CartVO> viewCart4Personal(Integer userId) {
        List<CartVO> cartVOList = null;
        //通过userid group by time 拿到lunchdate类型的List,将其作为参数查询出内容并封装.
        List<CartPersonal> cartPersonalDateList = cartPersonalMapper.selectByUserId(userId);
        if (CollectionUtils.isEmpty(cartPersonalDateList)) {
            return null;
        }
        List<Long> boxLunchDateList = new ArrayList<>();
        //判断购物车中的商品是否过期，过期的不显示给前端.而且购物车中最多只显示14条日期相关的数据
        for (CartPersonal cartpersonal : cartPersonalDateList) {
            if (!TimeUtils.isExpire(cartpersonal.getBoxLunchDate())) {
                boxLunchDateList.add(cartpersonal.getBoxLunchDate());
            }
        }
        if (CollectionUtils.isEmpty(boxLunchDateList)) {
            return null;
        }
        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        map.put("dateList", boxLunchDateList);
        List<CartPersonal> cartPersonalList = cartPersonalMapper.selectByUserIdAndDateList(map);
        cartVOList = new ArrayList<>();
        //按照前端要求的格式封装数据并返回
        for (Long boxLunchDate : boxLunchDateList) {
            List<CartInfoVO> cartInfoVOList = new ArrayList<>();
            double total = 0.0;
            double saleTotal = 0.0;
            for (CartPersonal cartPersonal : cartPersonalList) {
                CartInfoVO cartInfoVO = new CartInfoVO();
                if (cartPersonal.getBoxLunchDate().equals(boxLunchDate)) {
                    BeanUtils.copyProperties(cartPersonal, cartInfoVO);
                    cartInfoVO.setBoxLunchImagesUrl(cartPersonal.getBoxLunchImageUrl());
                    cartInfoVOList.add(cartInfoVO);
                    BigDecimal subTotal = cartPersonal.getBoxLunchPrice().multiply(new BigDecimal(cartPersonal.getBoxLunchNumber()));
                    BigDecimal subSaleTotal = cartPersonal.getBoxLunchSalePrice().multiply(new BigDecimal(cartPersonal.getBoxLunchNumber()));
                    total += subTotal.doubleValue();
                    saleTotal += subSaleTotal.doubleValue();
                }
            }
            CartVO cartVO = new CartVO();
            cartVO.setCartInfoVOList(cartInfoVOList);
            cartVO.setPersonalTotalPrice(new BigDecimal(total).setScale(2, BigDecimal.ROUND_HALF_EVEN));
            cartVO.setPersonalSaleTotalPrice(new BigDecimal(saleTotal).setScale(2, BigDecimal.ROUND_HALF_EVEN));
            cartVO.setBoxLunchDate(boxLunchDate);
            cartVOList.add(cartVO);
        }
        return cartVOList;
    }

    /**
     * 自助点餐 查看购物车 默认显示最新添加的一条盒饭记录
     *
     * @param userId
     * @return
     */
    @Override
    public CartSelfVO viewCart4Self(Integer userId) {
        CartSelfVO cartSelfVO = null;
        //1.通过userId拿到selfId
        SelfBoxLunch selfBoxLunch = selfBoxLunchMapper.selectOneByUserId(userId);//这里限制一次只能查出最新添加购物车的一条数据
        if (selfBoxLunch == null) {
            return null;
        }
        //通过selfId查出所需的详细信息
        List<SelfBoxLunchDetail> selfBoxLunchDetailList = selfBoxLunchDetailMapper.selectBySelfId(selfBoxLunch.getSelfId());
        //封装进CartSelfVO
        cartSelfVO = new CartSelfVO();
        BeanUtils.copyProperties(selfBoxLunch, cartSelfVO);
        List<CartSelfInfoVO> cartSelfInfoVOList = new ArrayList<>();
        for (SelfBoxLunchDetail selfBoxLunchDetail : selfBoxLunchDetailList
                ) {
            CartSelfInfoVO cartSelfInfoVO = new CartSelfInfoVO();
            BeanUtils.copyProperties(selfBoxLunchDetail, cartSelfInfoVO);
            cartSelfInfoVOList.add(cartSelfInfoVO);
        }
        cartSelfVO.setCartSelfInfoVOList(cartSelfInfoVOList);
        System.out.println(cartSelfVO);
        return cartSelfVO;
    }


    /**
     * 个人点餐: 从购物车中减少单个商品指定的数量,当该商品数量被减少至0时从购物车中删除该商品
     *
     * @param cartPersonalDTO
     */
    @Override
    public void decreaseCart4Personal(CartPersonalDTO cartPersonalDTO) {
        CartPersonal cartPersonal = cartPersonalMapper.selectByUserIdAndBoxLunchIdAndSkuIdAndTypeAndDate(cartPersonalDTO.getUserId(), cartPersonalDTO.getBoxLunchId(), cartPersonalDTO.getSkuId(), cartPersonalDTO.getBoxLunchType(), cartPersonalDTO.getBoxLunchDate());
        if (cartPersonal == null) {
            log.error("[减购]:减购失败 cartPersonalDTO={}", cartPersonalDTO);
            throw new DescribeException(ExceptionEnum.GOODS_NOT_EXIST_IN_CART);
        }
        Integer result = cartPersonal.getBoxLunchNumber() - cartPersonalDTO.getBoxLunchNumber();
        if (result > 0) {
            cartPersonal.setBoxLunchNumber(result);
            cartPersonalMapper.updateByPrimaryKey(cartPersonal);
        } else if (result < 0) {
            log.error("[减购]:减购失败 result={}", result);
            throw new DescribeException(ExceptionEnum.REMOVE_CART_FAIL);
        } else {
            cartPersonalMapper.deleteByPrimaryKey(cartPersonal.getId());
        }
    }

    /**
     * 自助点餐: 删除购物车中单件已经点好的一份自助盒饭(在1.0版本里作用相当于清空购物车,因此这块内容2.0版本再写实现)
     */
//    public void decreaseCart4Self(CartSelfDTO cartSelfDTO){
//    }


    /**
     * 个人点餐:清空购物车
     *
     * @param userId
     */
    @Override
    public void clearCart4Personal(Integer userId) {
        List<CartPersonal> cartPersonalList = cartPersonalMapper.selectAllByUserId(userId);
        if (CollectionUtils.isEmpty(cartPersonalList)) {
            log.error("[清空购物车]:清空购物车失败 userId={}", userId);
            throw new DescribeException(ExceptionEnum.EMPTY_CARTS);
        }
        List<Integer> idList = new ArrayList<>();
        for (CartPersonal cartPersonal : cartPersonalList
                ) {
            Integer id = null;
            id = cartPersonal.getId();
            idList.add(id);
        }
        cartPersonalMapper.deleteByPrimaryKeyList(idList);
    }

    /**
     * 自助点餐:清空购物车
     *
     * @param userId
     */
    @Override
    public void clearCart4Self(Integer userId) {
        List<SelfBoxLunch> selfBoxLunchList = selfBoxLunchMapper.listByUserId(userId);
        if (CollectionUtils.isEmpty(selfBoxLunchList)) {
            log.error("[自助点餐]:清空购物车失败,购物车为空 userId={}", userId);
            throw new DescribeException(ExceptionEnum.EMPTY_CARTS);
        }
        //通过userId获取所有的selfId
        List<Integer> selfBoxLunchIdList = selfBoxLunchList.stream().collect(() -> new ArrayList<Integer>(),
                (list, selfBoxLunch) -> list.add(selfBoxLunch.getSelfId()), (list1, list2) -> list1.addAll(list2));
        //根据userId和selfIdList删除两张表中的数据.
        selfBoxLunchMapper.deleteByUserId(userId);
        selfBoxLunchDetailMapper.deleteBySelfIdList(selfBoxLunchIdList);
    }
}
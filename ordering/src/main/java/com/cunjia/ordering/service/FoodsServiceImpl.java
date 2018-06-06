package com.cunjia.ordering.service;

import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.base.exception.DescribeException;
import com.cunjia.ordering.base.exception.ExceptionEnum;
import com.cunjia.ordering.dao.FoodsMapper;
import com.cunjia.ordering.dto.FoodTypesDTO;
import com.cunjia.ordering.dto.FoodsDTO;
import com.cunjia.ordering.vo.BoxLunchVO;
import com.cunjia.ordering.vo.FoodsClassifyVo;
import com.cunjia.ordering.vo.FoodsVO;
import com.cunjia.ordering.dao.UserMapper;
import com.cunjia.ordering.domain.DateBoxLunch;
import com.cunjia.ordering.domain.Order;
import com.cunjia.ordering.utils.NumberArithmeticUtils;
import com.cunjia.ordering.vo.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("foodsService")
public class FoodsServiceImpl implements FoodsService {

    @Resource
    private FoodsMapper foodsMapper;

    @Resource
    private UserMapper userMapper;
    /**
     * 分页获得分类食品列表
     *
     * @return 食物list
     * @param paramMap 查询的参数map
     */
    @Override
    public ArrayList<FoodsVO> getSelfFoodList(HashMap<String, Object> paramMap) {
        return foodsMapper.getFoodListByAll(paramMap);
    }

    /**
     * 获得食品信息
     *
     * @param foodId 食品id
     * @return 食品
     */
    @Override
    public FoodsVO getFood(Integer foodId) {
        return foodsMapper.getFoodByFoodId(foodId);
    }

    @Override
    public Map<String, Object> getBoxLunchListByIdList(Integer userId, List<OrderBoxLunchVO> orderBoxLunches) {
        List<DateBoxLunchVO> boxLunchList = foodsMapper.getSelfBoxLunchListByIdList(orderBoxLunches);
        UserInfoVO userInfoVO = userMapper.getUserExtraInfo(userId);
        List<OrderBoxLunchVO> invalidBoxLunchList = new ArrayList<>();
        Map<String, Object> map = new HashMap<>();
        long buyDeadLine = userInfoVO.getShopBuyDeadline();
        long discountDeadLine = userInfoVO.getShopDiscountDeadline();
        BigDecimal shopSelfSurfacePrice = userInfoVO.getShopSelfSurfacePrice();
        //List<FoodsClassifyVo> foodsClass = foodsMapper.getFoodClassifyByAll();
        for (DateBoxLunchVO db: boxLunchList) {
            boolean isBuyLine = System.currentTimeMillis() < db.getBoxLunchDate() + buyDeadLine;
            boolean isDiscountLine = System.currentTimeMillis() < db.getBoxLunchDate() + discountDeadLine;
            List<OrderBoxLunchVO> boxLunches = db.getBoxLunchList();
            BigDecimal totalPrice = new BigDecimal(0);
            for (OrderBoxLunchVO b : boxLunches) {
                int boxLunchNumber = b.getBoxLunchNumber();
                BigDecimal boxLunchPrice = new BigDecimal(0);
                boolean isValid = true;
                boolean hasSoup = false;
                boolean hasFruit = false;
                boolean hasDrink = false;
                for (FoodsVO f : b.getFoodVOList()) {
                    System.out.println("====================="+f.getCategoryId());
                    if (f.getFoodStatus() == Constants.ZERO) {
                        isValid = false;
                    }
                    BigDecimal price = f.getFoodPrice();
                    BigDecimal salePrice = f.getFoodSalePrice();
                    int foodNumber = f.getFoodNumber();
                    if (!isBuyLine) {
                        System.out.println("已超过商品购买截止时间");
                        throw new DescribeException(ExceptionEnum.ORDER_BOX_LUNCH_STOP_SELL);
                    } else if (!isDiscountLine) {
                        boxLunchPrice = NumberArithmeticUtils.safeAdd(boxLunchPrice, NumberArithmeticUtils.safeMultiply(price, foodNumber));
                        System.out.println("已超过商品优惠截止时间");
                    } else {
                        System.out.println("foodPrice:"+salePrice+"  foodNumber:"+foodNumber);
                        boxLunchPrice = NumberArithmeticUtils.safeAdd(boxLunchPrice, NumberArithmeticUtils.safeMultiply(salePrice, foodNumber));
                    }
                    if(f.getCategoryId() == 4){
                        hasSoup = true;
                    }
                    if(f.getCategoryId() == 5){
                        hasFruit = true;
                    }
                    if(f.getCategoryId() == 7){
                        hasDrink = true;
                    }
                }
                if(!hasSoup){
                    b.getFoodVOList().add(new FoodsVO(4,"配汤",0));
                }
                if(!hasFruit){
                    b.getFoodVOList().add(new FoodsVO(5,"水果",0));
                }
                if(!hasDrink){
                    b.getFoodVOList().add(new FoodsVO(7,"饮料",0));
                }
                System.out.println("boxLunchPrice:"+boxLunchPrice+"  boxLunchNumber:"+boxLunchNumber);
                System.out.println("totalPrice:"+totalPrice+"  某天总价："+ NumberArithmeticUtils.safeMultiply(NumberArithmeticUtils.safeAdd(boxLunchPrice,shopSelfSurfacePrice), boxLunchNumber));
                totalPrice = NumberArithmeticUtils.safeAdd(totalPrice, NumberArithmeticUtils.safeMultiply(NumberArithmeticUtils.safeAdd(boxLunchPrice,shopSelfSurfacePrice), boxLunchNumber));
                if (!isValid) {
                    invalidBoxLunchList.add(b);
                }
            }
            db.setOrderSurfacePrice(NumberArithmeticUtils.safeMultiply(shopSelfSurfacePrice, boxLunches.size()));
            db.setBoxLunchTotalPrice(totalPrice);
        }
        if (invalidBoxLunchList.size() > 0) {
            map.put(Constants.KEY_IS_TRUE, false);
            map.put(Constants.KEY_RESULT_LIST, invalidBoxLunchList);
        } else {
            map.put(Constants.KEY_IS_TRUE, true);
            map.put(Constants.KEY_RESULT_LIST, boxLunchList);
        }
        return map;
    }

    /**
     * 新增商品  hyf
     * @param foodsDTO 商品DTO
     * @return int
     */
    @Override
    public Integer insertFoods(FoodsDTO foodsDTO) {
        return foodsMapper.insertFoods(foodsDTO);
    }

    /**
     * 新增商品类型 hyf
     * @param foodTypesDTO 商品类型DTO
     * @return int
     */
    @Override
    public Integer insertFoodTypes(FoodTypesDTO foodTypesDTO) {
        return foodsMapper.insertFoodTypes(foodTypesDTO);
    }

    /**
     * 获得食品类型列表
     * @return 食品列表
     */
    @Override
    public List<FoodsClassifyVo> getFoodClassify() {
        return foodsMapper.getFoodClassifyByAll();
    }

    /**
     * 修改商品
     * @param foodsDTO 商品DTO
     * @return int
     */
    @Override
    public Integer updateFoods(FoodsDTO foodsDTO) {
        return foodsMapper.updateFoods(foodsDTO);
    }

    /**
     * 作废商品
     * @param foodsDTO 商品DTO
     * @return int
     */
    @Override
    public Integer updateFoodStatus(FoodsDTO foodsDTO) {
        return foodsMapper.updateFoodStatus(foodsDTO);
    }
}

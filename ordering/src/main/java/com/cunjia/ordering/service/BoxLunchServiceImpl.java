package com.cunjia.ordering.service;

import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.base.exception.DescribeException;
import com.cunjia.ordering.base.exception.ExceptionEnum;
import com.cunjia.ordering.dao.*;
import com.cunjia.ordering.dto.BoxLunchDTO;
import com.cunjia.ordering.vo.BoxLunchClassifyVO;
import com.cunjia.ordering.vo.BoxLunchVO;
import com.cunjia.ordering.vo.FoodsVO;
import com.cunjia.ordering.vo.PersonalBoxLunchVO;
import com.cunjia.ordering.utils.NumberArithmeticUtils;
import com.cunjia.ordering.vo.*;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("boxLunchService")
public class BoxLunchServiceImpl implements BoxLunchService {

    @Resource
    private BoxLunchMapper boxLunchMapper;
    @Resource
    private FoodsMapper foodsMapper;
    @Resource
    private UserMapper userMapper;
    @Resource
    private BoxLunchSkuMapper boxLunchSkuMapper;
    @Resource
    private BoxLunchPraiseMapper boxLunchPraiseMapper;

    /**
     * 获得单个盒饭
     *
     * @param boxLunchId 盒饭id
     * @return 盒饭
     * @author 甘雨
     */
    @Override
    public BoxLunchVO getBoxLunch(Integer boxLunchId) {
        BoxLunchVO boxLunchList = boxLunchMapper.getBoxLunchAndSkuByBoxLunchId(boxLunchId);
        ArrayList<FoodsVO> foodsVOList = foodsMapper.getFoodListByBoxLunchId(boxLunchId);
        if (CollectionUtils.isNotEmpty(foodsVOList))
            boxLunchList.setFoodVOList(foodsVOList);
        return boxLunchList;
    }

    /**
     * 获取个人点餐页面的盒饭列表
     *
     * @return 盒饭列表
     * @author 甘雨
     */
    @Override
    public ArrayList<PersonalBoxLunchVO> getPersonalBoxLunchList(Map<String, Object> map) {
        return boxLunchMapper.getBoxLunchListForPersonal(map);
    }

    @Override
    public Map<String, Object> getBoxLunchListByIdList(Integer userId, List<OrderBoxLunchVO> orderBoxLunches) {
        List<DateBoxLunchVO> dates = boxLunchMapper.getBoxLunchListByIdList(userId, orderBoxLunches);
        UserInfoVO userInfoVO = userMapper.getUserExtraInfo(userId);
        System.out.println("userInfo:" + userInfoVO);
        List<OrderBoxLunchVO> invalidList = new ArrayList<>();
        long buyDeadLine = userInfoVO.getShopBuyDeadline();
        long discountDeadLine = userInfoVO.getShopDiscountDeadline();
        System.out.println("确认订单，数据库结果：" + dates);
        for (DateBoxLunchVO db : dates) {
            boolean isBuyLine = System.currentTimeMillis() < db.getBoxLunchDate() + buyDeadLine;
            System.out.println("current:" + System.currentTimeMillis() + " date:" + db.getBoxLunchDate() + " deadline:" + buyDeadLine);
            boolean isDiscountLine = System.currentTimeMillis() < db.getBoxLunchDate() + discountDeadLine;
            BigDecimal totalPrice = db.getBoxLunchTotalPrice();
            BigDecimal totalSurcacePrice = db.getBoxLunchTotalPrice();
            List<OrderBoxLunchVO> boxLunchList = db.getBoxLunchList();
            for (OrderBoxLunchVO b : boxLunchList) {
                if (b.getBoxLunchStatus() == Constants.ZERO) {
                    invalidList.add(b);
                }
                BigDecimal price = b.getBoxLunchPrice();
                BigDecimal salePrice = b.getBoxLunchSalePrice();
                BigDecimal surfacePrice = b.getBoxLunchSurfacePrice();
                int boxLunchNumber = b.getBoxLunchNumber();
                if (!isBuyLine) {
                    System.out.println("已超过商品购买截止时间");
                    throw new DescribeException(ExceptionEnum.ORDER_BOX_LUNCH_STOP_SELL);
                } else if (!isDiscountLine) {
                    totalPrice = NumberArithmeticUtils.safeAdd(totalPrice, NumberArithmeticUtils.safeMultiply(price, boxLunchNumber));
                    System.out.println("已超过商品优惠截止时间");
                } else {
                    totalPrice = NumberArithmeticUtils.safeAdd(totalPrice, NumberArithmeticUtils.safeMultiply(salePrice, boxLunchNumber));
                }
                totalSurcacePrice = NumberArithmeticUtils.safeAdd(totalSurcacePrice, NumberArithmeticUtils.safeMultiply(surfacePrice, boxLunchNumber));
                totalPrice = NumberArithmeticUtils.safeAdd(totalPrice, NumberArithmeticUtils.safeMultiply(surfacePrice, boxLunchNumber));
            }
            db.setOrderSurfacePrice(totalSurcacePrice);
            db.setBoxLunchTotalPrice(totalPrice);
        }
        Map<String, Object> map;
        if (invalidList.size() > 0) {
            map = new HashMap<>();
            map.put(Constants.KEY_IS_TRUE, false);
            map.put(Constants.KEY_RESULT_LIST, invalidList);
        } else {
            map = new HashMap<>();
            map.put(Constants.KEY_IS_TRUE, true);
            map.put(Constants.KEY_RESULT_LIST, dates);
        }
        return map;
    }

    /**
     * 分页获取爆款商品列表
     *
     * @return 爆款盒饭列表
     * @author 甘雨
     */
    @Override
    public List<BoxLunchVO> getBoxLunchFireList(Map<String, Object> map) {
        return boxLunchMapper.getBoxLunchFireListByPage(map);
    }

    /**
     * 获取某天的所有盒饭分类
     *
     * @param timestamp 时间戳
     * @return 盒饭分类列表
     * @author 甘雨
     */
    @Override
    public ArrayList<BoxLunchClassifyVO> getBoxLunchClassifyList(Long timestamp) {
        return boxLunchMapper.getBoxLunchClassifyByTimestamp(timestamp);
    }

    /**
     * 新增商品
     *
     * @param boxLunchDTO 商品DTO
     * @return int
     * @author hyf
     */
    @Override
    public Integer insertBoxLunch(BoxLunchDTO boxLunchDTO) {
        return boxLunchMapper.insertBoxLunch(boxLunchDTO);
    }

    /**
     * 新增商品、商品sku、调料包
     *
     * @param boxLunchDTO 商品DTO
     * @return int
     */
    @Override
    @Transactional
    public Integer insertOrUpdateBoxLunchAndSku(BoxLunchDTO boxLunchDTO) {
        if (boxLunchDTO.getBoxLunchId() != null) {//有id = 修改
            if (boxLunchMapper.updateBoxLunchById(boxLunchDTO) > Constants.ZERO) {//修改盒饭成功

                boxLunchSkuMapper.deleteSku(boxLunchDTO.getBoxLunchId());//删除盒饭SKU

                boxLunchMapper.deleteCondimentBoxLunchByBoxLunchId(boxLunchDTO.getBoxLunchId());//删除盒饭调料包

                boxLunchMapper.deleteBoxLunchFoodByBoxLunchId(boxLunchDTO.getBoxLunchId());//删除盒饭商品关联表
            } else {
                return Constants.ZERO;//修改失败
            }
        } else {//没id  = 新增
            if (this.insertBoxLunch(boxLunchDTO) < Constants.ONE) {
                return Constants.ZERO;//新增失败
            }
        }

        if (CollectionUtils.isNotEmpty(boxLunchDTO.getBoxLunchSkuList())) {//判断是否有sku
            boxLunchSkuMapper.insertSku(boxLunchDTO); //批量新增盒饭sku
        }

        if (boxLunchDTO.getBoxLunchIsCondiment() == Constants.ONE) {//判断是否有调味包
            boxLunchMapper.insertCondimentBoxLunch(boxLunchDTO);//新增盒饭调料包
        }

        if (CollectionUtils.isNotEmpty(boxLunchDTO.getFoodsList())) {
            boxLunchMapper.insertBoxLunchFood(boxLunchDTO); //新增盒饭商品关联
        }
        return Constants.ONE;
    }

    /**
     * 检查用户对盒饭的点赞是否存在
     *
     * @param userId     用户id
     * @param boxLunchId 盒饭id
     * @return 0 用户未点赞 1 用户已点赞 2 用户取消了点赞 -1 未知错误
     */
    @Override
    public Integer checkBoxLunchPraise(Integer userId, Integer boxLunchId) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userId", userId);
        paramMap.put("boxLunchId", boxLunchId);

        BoxLunchPraiseVO boxLunchPraiseVO = boxLunchPraiseMapper.checkBoxLunchPraiseByUserId(paramMap);
        if (!boxLunchPraiseVO.getUserId().equals(userId) || !boxLunchPraiseVO.getBoxLunchId().equals(boxLunchId))
            return 0;
        if (boxLunchPraiseVO.getUserId().equals(userId) || boxLunchPraiseVO.getBoxLunchId().equals(boxLunchId) || boxLunchPraiseVO.getBoxLunchPraiseStatus() == 0)
            return 1;
        if (boxLunchPraiseVO.getUserId().equals(userId) || boxLunchPraiseVO.getBoxLunchId().equals(boxLunchId) || boxLunchPraiseVO.getBoxLunchPraiseStatus() == 1)
            return 2;
        return -1;
    }

    /**
     * 添加点赞
     *
     * @return
     */
    @Override
    public Integer addPraise() {
        boxLunchPraiseMapper.addPraise();
        return null;
    }

    /**
     * 获取首页推荐盒饭列表
     *
     * @param paramResult 查询参数
     * @return 盒饭列表
     */
    @Override
    public List<BoxLunchVO> getIndexBoxLunchList(HashMap<String, Object> paramResult) {
        return boxLunchMapper.getBoxLunchListByIndex(paramResult);
    }

    /**
     * 批量作废盒饭
     *
     * @param boxLunchDTO 盒饭dto
     * @return int
     */
    @Override
    public Integer updateBoxLunchStatus(BoxLunchDTO boxLunchDTO) {
        return boxLunchMapper.updateBoxLunchStatus(boxLunchDTO);
    }
}

package com.cunjia.ordering.controller;

import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.base.exception.ExceptionEnum;
import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.base.exception.ResultUtil;
import com.cunjia.ordering.dto.FoodTypesDTO;
import com.cunjia.ordering.dto.FoodsDTO;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.service.FoodsService;
import com.cunjia.ordering.service.ShopsService;
import com.cunjia.ordering.vo.FoodsClassifyVo;
import com.cunjia.ordering.vo.FoodsVO;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 食物接口类
 */

@Controller
@RequestMapping("/food")
public class FoodController extends BaseController {

    @Resource
    private ShopsService shopsService;
    @Resource
    private FoodsService foodsService;

    /**
     * 自助点餐页面-分页获取食品分类接口
     *
     * @return 自助点餐页面json
     * @author 甘雨
     */
    @ResponseBody
    @PostMapping(value = "/selfFood")
    public Result selfFood(@Validated ShiroToken token,
                           @RequestParam(value = "categoryId") Integer categoryId, @RequestParam("offset") Integer offset,
                           @RequestParam("limit") Integer limit) {
        validateToken(token);

        HashMap<String, Object> resultMap = new HashMap<>();
        HashMap<String, Object> paramMap = new HashMap<>();
        paramMap.put("categoryId", categoryId);
        paramMap.put("offset", offset);
        paramMap.put("limit", limit);

        ArrayList<FoodsVO> selfFoodList = foodsService.getSelfFoodList(paramMap);

        resultMap.put("selfFoodList", selfFoodList);
        return ResultUtil.success(resultMap);
    }

    /**
     * 自主点餐页面-所有的食品类型列表
     *
     * @return 食品类型列表json
     * @author 甘雨
     */
    @ResponseBody
    @GetMapping("getFoodClassify")
    public Result getFoodClassify(@Validated ShiroToken token) {
        validateToken(token);

        HashMap<String, Object> resultMap = new HashMap<>();

        List<FoodsClassifyVo> foodsClassifyList = foodsService.getFoodClassify();
        ArrayList<FoodsClassifyVo> necessaryList = new ArrayList<>();
        ArrayList<FoodsClassifyVo> noNecessaryList = new ArrayList<>();

        for (FoodsClassifyVo foodClassify : foodsClassifyList) {
            foodClassify.setFoodsList(null);
            switch (foodClassify.getCategoryClassify()) {
                case 1:
                    necessaryList.add(foodClassify);
                    break;
                case 2:
                    noNecessaryList.add(foodClassify);
                    break;
            }
        }
        resultMap.put("necessaryList", necessaryList);
        resultMap.put("noNecessaryList", noNecessaryList);

        return ResultUtil.success(resultMap);
    }

    /**
     * 食品详情接口
     *
     * @param foodId 食物id
     * @return 食物json
     * @author 甘雨
     */
    @ResponseBody
    @PostMapping(value = "/getFood")
    public Result getFood(@Validated ShiroToken token,
                          @RequestParam("foodId") Integer foodId) {
        validateToken(token);
        return ResultUtil.success(foodsService.getFood(foodId));
    }

    /**
     * 自助点餐页面-商铺倒计时接口
     *
     * @param selfTimestamp 零点时间戳
     * @return 商铺倒计时json
     * @author 甘雨
     */
    @ResponseBody
    @PostMapping(value = "getSelfTimestamp")
    public Result getSelfTimestamp(@Validated ShiroToken token,
                                   @RequestParam("selfTimestamp") Long selfTimestamp) {
        validateToken(token);

        //返回当前盒饭所在那一天的优惠倒计时和订单倒计时
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("shopTimestamp", CommonGoods.getShopTimestamp(shopsService.getShopTimestamp(token.getShopId()), selfTimestamp));

        return ResultUtil.success(resultMap);
    }

    /**
     * 后台管理系统-新增商品
     * @param foodsDTO 商品DTO
     * @return json
     */
    @ResponseBody
    @PostMapping("insertFoods")
    public Result insertFoods(@RequestBody FoodsDTO foodsDTO) {
        if (StringUtils.isNotBlank(foodsDTO.getFoodName()) && foodsDTO.getFoodName().length() > Constants.TEN) {
            return ResultUtil.error(ExceptionEnum.BOX_LUNCH_NAME_CONTENT_SIZE_OVER);
        }

        if (foodsDTO.getFoodId() != null) {//修改
            if (foodsService.updateFoods(foodsDTO) > Constants.ZERO) {
                return ResultUtil.success();
            }
        } else {//新增
            if (foodsService.insertFoods(foodsDTO) > Constants.ZERO) {
                return ResultUtil.success();
            }
        }
        return ResultUtil.error(ExceptionEnum.OPERATION_FAIL);
    }

    /**
     * 新增商品类型
     * @param foodTypesDTO 商品类型DTO
     * @return json
     */
    @ResponseBody
    @PostMapping("insertFoodTypes")
    public Result insertFoodTypes(@RequestBody  FoodTypesDTO foodTypesDTO){
        if (StringUtils.isNotBlank(foodTypesDTO.getCategoryName()) && foodTypesDTO.getCategoryName().length() > Constants.TEN) {
            return ResultUtil.error(ExceptionEnum.BOX_LUNCH_NAME_CONTENT_SIZE_OVER);
        }

        if (StringUtils.isNotBlank(foodTypesDTO.getCategoryDesc()) && foodTypesDTO.getCategoryDesc().length() > Constants.FIFTY) {
            return ResultUtil.error(ExceptionEnum.FOOD_TYPE_DESC_CONTENT_SIZE_OVER);
        }

        if (foodsService.insertFoodTypes(foodTypesDTO) > Constants.ZERO) {
            return ResultUtil.success();
        }
        return ResultUtil.error(ExceptionEnum.OPERATION_FAIL);
    }

    /**
     * 作废商品
     * @param foodsDTO 商品DTO
     * @return json
     */
    @ResponseBody
    @PostMapping("deleteFoodStatus")
    public Result deleteFoodStatus(@RequestBody FoodsDTO foodsDTO){
        if (CollectionUtils.isEmpty(foodsDTO.getIdList())) {
            return  ResultUtil.error(ExceptionEnum.PARAM_IS_NULL);
        }
        foodsDTO.setFoodStatus(Constants.NINETY_NINE);
        if (foodsService.updateFoodStatus(foodsDTO) > Constants.ZERO) {
            return ResultUtil.success();
        }
        return ResultUtil.error(ExceptionEnum.OPERATION_FAIL);
    }
}
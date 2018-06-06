package com.cunjia.ordering.service;

import com.cunjia.ordering.dto.FoodTypesDTO;
import com.cunjia.ordering.dto.FoodsDTO;
import com.cunjia.ordering.vo.BoxLunchVO;
import com.cunjia.ordering.vo.FoodsClassifyVo;
import com.cunjia.ordering.vo.FoodsVO;
import com.cunjia.ordering.vo.OrderBoxLunchVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface FoodsService {

    /*
     * 分页获得分类食品列表
     */
    ArrayList<FoodsVO> getSelfFoodList(HashMap<String, Object> paramMap);

    /*
     * 获得食品信息
     */
    FoodsVO getFood(Integer foodId);

    /*
     * 获得食品类型列表
     */
    List<FoodsClassifyVo> getFoodClassify();

    /**
     * 获取自助点餐订单食物列表
     */
    Map<String,Object> getBoxLunchListByIdList(Integer userId, List<OrderBoxLunchVO> orderBoxLunches);

    Integer insertFoods(FoodsDTO foodsDTO);//新增商品

    Integer insertFoodTypes(FoodTypesDTO foodTypesDTO);//新增商品类型

    /**
     * 修改商品
     */
    Integer updateFoods(FoodsDTO foodsDTO);

    /**
     * 作废商品
     */
    Integer updateFoodStatus(FoodsDTO foodsDTO);

}

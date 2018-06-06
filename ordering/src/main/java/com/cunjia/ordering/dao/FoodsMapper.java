package com.cunjia.ordering.dao;

import com.cunjia.ordering.dto.CartSelfDTO;
import com.cunjia.ordering.dto.FoodTypesDTO;
import com.cunjia.ordering.dto.FoodsDTO;
import com.cunjia.ordering.vo.BoxLunchVO;
import com.cunjia.ordering.vo.FoodsClassifyVo;
import com.cunjia.ordering.vo.DateBoxLunchVO;
import com.cunjia.ordering.vo.FoodsClassifyVo;
import com.cunjia.ordering.vo.FoodsVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Mapper
public interface FoodsMapper {

    /*
     * 通过盒饭id获取食品list(不区分是否下架)
     */
    ArrayList<FoodsVO> getFoodListByBoxLunchId(Integer boxLunchId);

    /*
     * 分页获得分类食品list(区分是否下架)
     */
    ArrayList<FoodsVO> getFoodListByAll(HashMap<String, Object> paramMap);

    /*
     * 获得食品信息(不区分是否下架)
     */
    FoodsVO getFoodByFoodId(Integer foodId);

    /*
     * 获取自助点餐盒饭列表
     */
    List<DateBoxLunchVO> getSelfBoxLunchListByIdList(List<?> boxLunchList);

    /*
     * [购物车模块]通过盒饭idList联表查询获得盒饭详细信息和盒饭所属类别
     */
    List<CartSelfDTO> selectFoodsAndFoodsTypeByFoodsId(List<Integer> list);

    Integer insertFoods(FoodsDTO foodsDTO);//新增商品

    /*
     * 获得所有的食品类型
     */
    List<FoodsClassifyVo> getFoodClassifyByAll();

    @Insert("INSERT INTO `food_types`(category_name,category_desc,category_classify) VALUES(#{categoryName},#{categoryDesc},#{categoryClassify})")
    Integer insertFoodTypes(FoodTypesDTO foodTypesDTO);//新增商品类型

    /**
     * 修改商品
     */
    Integer updateFoods(FoodsDTO foodsDTO);
    /**
     * 批量作废商品
     */
    Integer updateFoodStatus(FoodsDTO foodsDTO);
}
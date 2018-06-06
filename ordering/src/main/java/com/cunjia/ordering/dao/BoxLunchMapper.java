package com.cunjia.ordering.dao;

import com.cunjia.ordering.dto.BoxLunchDTO;
import com.cunjia.ordering.vo.BoxLunchClassifyVO;
import com.cunjia.ordering.vo.BoxLunchVO;
import com.cunjia.ordering.vo.PersonalBoxLunchVO;
import com.cunjia.ordering.vo.DateBoxLunchVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface BoxLunchMapper {

    /*
     * 通过盒饭id从数据库中联表查询单个盒饭和sku列表(不区分是否下架)
     */
    BoxLunchVO getBoxLunchAndSkuByBoxLunchId(Integer boxLunchId);

    /*
     * 分页获取个人点餐页面分类盒饭列表(多表分页查询)
     */
    ArrayList<PersonalBoxLunchVO> getBoxLunchListForPersonal(Map<String, Object> map);

    //根据盒饭id集合获取购物车盒饭列表
    List<DateBoxLunchVO> getBoxLunchListByIdList(@Param("userId") Integer userId, @Param("list") List<?> boxLunchList);

    /*
     * 分页获取爆款商品列表(只取上架的爆款盒饭)
     */
    ArrayList<BoxLunchVO> getBoxLunchFireListByPage(Map<String,Object> map);

    /*
     * 获取某天的所有盒饭分类(只取上架商品的分类)
     */
    ArrayList<BoxLunchClassifyVO> getBoxLunchClassifyByTimestamp(Long timestamp);

    /**
     * 获取个人点餐多品盒饭列表
     */
    List<BoxLunchVO> getMultiBoxLunchListByIdList(List<?> boxLunchList);

    /**
     * 获取个人点餐单品盒饭列表
     */
    List<BoxLunchVO> getSingleBoxLunchListByIdList(List<?> boxLunchList);

    /**
     * [购物车模块] 通过盒饭id获取单个盒饭详情和sku商品的详情,当盒饭为单品时,仍然返回单品的数据内容
     */
    BoxLunchVO selectBoxLunchAndSkuByBoxLunchId(Integer boxLunchId);

    Integer insertBoxLunch(BoxLunchDTO boxLunchDTO);//新增盒饭

    Integer insertCondimentBoxLunch(BoxLunchDTO boxLunchDTO);//新增盒饭调料包

    Integer insertBoxLunchFood(BoxLunchDTO boxLunchDTO);//新增盒饭商品关联

    Integer updateBoxLunchById(BoxLunchDTO boxLunchDTO);//根据id修改盒饭信息

    @Delete("DELETE FROM `condiment_box_lunch` WHERE box_lunch_id = #{boxLunchId}")
    Integer deleteCondimentBoxLunchByBoxLunchId(Integer boxLunchId);//根据盒饭id删除调料包
    @Delete("DELETE FROM `box_lunch_food` WHERE box_lunch_id = #{boxLunchId}")
    Integer deleteBoxLunchFoodByBoxLunchId(Integer boxLunchId);//根据id删除盒饭 商品关联

    /**
     * 批量作废盒饭
     */
    Integer updateBoxLunchStatus(BoxLunchDTO boxLunchDTO);

    /*
     * 分页获取首页推荐的盒饭列表
     */
    List<BoxLunchVO> getBoxLunchListByIndex(HashMap<String, Object> paramResult);
}
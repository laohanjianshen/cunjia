package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.BoxLunchSku;
import com.cunjia.ordering.dto.BoxLunchDTO;
import com.cunjia.ordering.dto.BoxLunchSkuDTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface BoxLunchSkuMapper {
/*
    通过skuId查询sku价格和sku商品名称,供购物车模块调用
 */
    BoxLunchSku selectBySkuId(Integer skuId);

    Integer insertSku(BoxLunchDTO boxLunchDTO);//批量新增盒饭sku

    @Delete("DELETE FROM `box_lunch_sku` WHERE box_lunch_id = #{boxLunchId}")
    Integer deleteSku(Integer boxLunchId);//根据盒饭id 删除 盒饭SKU
}
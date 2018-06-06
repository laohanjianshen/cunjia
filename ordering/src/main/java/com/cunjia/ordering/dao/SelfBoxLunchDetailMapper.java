package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.SelfBoxLunchDetail;
import com.cunjia.ordering.dto.CartSelfDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SelfBoxLunchDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SelfBoxLunchDetail record);

    int insertSelective(SelfBoxLunchDetail record);

    SelfBoxLunchDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SelfBoxLunchDetail record);

    int updateByPrimaryKey(SelfBoxLunchDetail record);

    List<SelfBoxLunchDetail> selectBySelfId(Integer selfId);

    List<CartSelfDTO> selectAllLinkedInfoBySelfId(Integer selfId);

    void insertList(List<SelfBoxLunchDetail> list);
    //根据selfBoxLunchIdList 批量删除数据
    int deleteBySelfIdList(List<Integer> list);
}
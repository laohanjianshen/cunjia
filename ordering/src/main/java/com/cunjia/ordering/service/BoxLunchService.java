package com.cunjia.ordering.service;

import com.cunjia.ordering.dto.BoxLunchDTO;
import com.cunjia.ordering.vo.BoxLunchClassifyVO;
import com.cunjia.ordering.vo.BoxLunchVO;
import com.cunjia.ordering.vo.OrderBoxLunchVO;
import com.cunjia.ordering.vo.PersonalBoxLunchVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoxLunchService {

    /*
     * 获得单个盒饭和sku列表
     */
    BoxLunchVO getBoxLunch(Integer boxLunchId);

    /*
     * 分页获取个人点餐页面的盒饭列表
     */
    ArrayList<PersonalBoxLunchVO> getPersonalBoxLunchList(Map<String, Object> map);

    /*
     * 分页获取爆款商品列表
     */
    List<BoxLunchVO> getBoxLunchFireList(Map<String, Object> map);

    /*
     * 获取某天的所有盒饭分类
     */
    ArrayList<BoxLunchClassifyVO> getBoxLunchClassifyList(Long timestamp);
    Integer insertBoxLunch(BoxLunchDTO boxLunchDTO);//新增盒饭
    Integer insertOrUpdateBoxLunchAndSku(BoxLunchDTO boxLunchDTO);//新增盒饭
    Map<String, Object> getBoxLunchListByIdList(Integer userId, List<OrderBoxLunchVO> orderBoxLunches);

    /**
     * 批量作废盒饭
     */
    Integer updateBoxLunchStatus(BoxLunchDTO boxLunchDTO);

    /*
     * 检查用户对盒饭的点赞是否存在
     */
    Integer checkBoxLunchPraise(Integer userId, Integer boxLunchId);

    /*
     * 添加盒饭点赞
     */
    Integer addPraise();

    /*
     * 获取首页推荐盒饭列表
     */
    List<BoxLunchVO> getIndexBoxLunchList(HashMap<String, Object> paramResult);
}

package com.cunjia.ordering.service;

import com.cunjia.ordering.dao.CondimentMapper;
import com.cunjia.ordering.vo.CondimentVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service("condimentService")
public class CondimentServiceImpl implements CondimentService {

    @Resource
    private CondimentMapper condimentMapper;

    /**
     * 获取某个盒饭的调料包列表
     *
     * @param boxLunchId 盒饭id
     * @return 调料包列表
     * @author 甘雨
     */
    @Override
    public ArrayList<CondimentVO> getCondimentListToBoxLunch(Integer boxLunchId) {
        return condimentMapper.getCondimentListByBoxLunchId(boxLunchId);
    }
}

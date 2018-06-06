package com.cunjia.ordering.service;

import com.cunjia.ordering.vo.CondimentVO;

import java.util.ArrayList;

public interface CondimentService {

    /*
     * 获取某个盒饭的调料包列表
     */
    ArrayList<CondimentVO> getCondimentListToBoxLunch(Integer boxLunchId);
}

package com.cunjia.ordering.service;

import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.dao.BannerMapper;
import com.cunjia.ordering.domain.BannerDO;
import com.cunjia.ordering.vo.BannerVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerMapper bannerMapper;

    /**
     * 获取轮播图和广告图 hyf
     * @return map
     */
    @Override
    public Map<String, Object> listBanner() {
        List<BannerDO> list = bannerMapper.listBanner();
        List<BannerVO> bannerList = new ArrayList<>();
        List<BannerVO> advertisementList = new ArrayList<>();
        BannerVO bannerVO = null;
        for (BannerDO b: list) {
            bannerVO = new BannerVO();
            BeanUtils.copyProperties(b, bannerVO);
            if (b.getBannerType() == Constants.ONE) {//轮播图
                bannerList.add(bannerVO);
            } else {//广告图
                advertisementList.add(bannerVO);
            }
        }
        Map<String, Object> map = new HashMap<>();
        map.put("bannerList", bannerList);//轮播图
        map.put("advertisementList", advertisementList);//广告图
        return map;
    }
}

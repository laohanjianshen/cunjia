package com.cunjia.ordering.service;

import com.cunjia.ordering.dao.DateGoodsMapper;
import com.cunjia.ordering.domain.DateGoods;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("dateGoodsService")
public class DateGoodsServiceImpl implements DateGoodsService {

    @Resource
    private DateGoodsMapper dateGoodsMapper;

    /**
     * 查询多天的商品与日期关系的列表
     * @param timestamps 一周的每天零点的时间戳集合
     * @return 一周每天要上架的商品id集合
     */
    @Override
    public List<DateGoods> getDateGoodsList(List<Long> timestamps) {
        return dateGoodsMapper.selectGoodsListByTimestamp(timestamps);
    }
}

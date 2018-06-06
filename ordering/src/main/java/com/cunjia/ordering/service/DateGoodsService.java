package com.cunjia.ordering.service;

import com.cunjia.ordering.domain.DateGoods;

import java.util.List;

public interface DateGoodsService {

    List<DateGoods> getDateGoodsList(List<Long> timestamps);
}

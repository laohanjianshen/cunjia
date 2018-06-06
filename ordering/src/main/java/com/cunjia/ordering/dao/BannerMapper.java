package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.BannerDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface BannerMapper {
    @Select("SELECT banner_url,banner_detail_url,banner_type FROM `banner` WHERE banner_status = 1")
    List<BannerDO> listBanner();
}

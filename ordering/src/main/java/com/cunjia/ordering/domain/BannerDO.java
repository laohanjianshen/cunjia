package com.cunjia.ordering.domain;

import lombok.Data;

/**
 * 首页轮播图和广告
 */
@Data
public class BannerDO {
    private Integer bannerId;//id
    private String bannerUrl;//图片url
    private String bannerDetailUrl;//详情url
    private Integer bannerType;//类型：1 = 轮播图， 2 = 广告
    private Integer bannerStatus;//状态：0=未启用 1=启用 99=作废
}

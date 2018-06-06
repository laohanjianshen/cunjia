package com.cunjia.ordering.domain;

        import lombok.Data;

        import javax.persistence.Entity;
        import javax.persistence.Id;
        import java.math.BigDecimal;

/**
 * 商品sku
 * @auther xpc 252645816@qq.com
 * @date 2018/4/23 16:11
 */
@Entity
@Data
public class GoodsSku {
    //    商品规格id
    @Id
    private Integer skuId;
    //    商品名称
    private String skuName;
    //    商品id
    private Integer goodsId;
    //    商品sku价格
    private BigDecimal skuPrice;
    //    商品sku折扣价格
    private BigDecimal skuSalePrice;
}

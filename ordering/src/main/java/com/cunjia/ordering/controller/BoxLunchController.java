package com.cunjia.ordering.controller;

import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.base.exception.ExceptionEnum;
import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.base.exception.ResultUtil;
import com.cunjia.ordering.dto.BoxLunchDTO;
import com.cunjia.ordering.dto.BoxLunchSkuDTO;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.service.BoxLunchService;
import com.cunjia.ordering.service.CondimentService;
import com.cunjia.ordering.service.ShopsService;
import com.cunjia.ordering.vo.*;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 商品的接口类
 */

@Controller
@RequestMapping("/boxLunch")
public class BoxLunchController extends BaseController {

    private static final String STRING_CONDIMENT = "调料包";
    private static final String STRING_SKU = "规格";
    private static final String STRING_KEY_NAME = "name";
    private static final String STRING_KEY_LIST = "list";

    @Resource
    private BoxLunchService boxLunchService;
    @Resource
    private ShopsService shopsService;
    @Resource
    private CondimentService condimentService;


    /**
     * 盒饭详情接口
     *
     * @param boxLunchId 盒饭id
     * @return 盒饭详情json
     * @author 甘雨
     */
    @ResponseBody
    @PostMapping(value = "/getBoxLunch")
    public Result getBoxLunch(@Validated ShiroToken token,
                              @RequestParam("boxLunchId") Integer boxLunchId, @RequestParam("boxLunchTimestamp") Long timestamp) {
        validateToken(token);
        HashMap<String, Object> resultMap = new HashMap<>();

        //返回当前盒饭所在那一天的优惠倒计时和订单倒计时
        resultMap.put("shopTimestamp", CommonGoods.getShopTimestamp(shopsService.getShopTimestamp(token.getShopId()), timestamp));

        //返回盒饭数据
        BoxLunchVO boxLunch = boxLunchService.getBoxLunch(boxLunchId);

        //处理盒饭中的sku的排序
        encodeSku(boxLunch);

        HashMap<String, Object> skuMap = new HashMap<>();
        skuMap.put(STRING_KEY_NAME, STRING_SKU);
        skuMap.put(STRING_KEY_LIST, boxLunch.getBoxLunchSkuVOList());
        resultMap.put("sku", skuMap);
        //盒饭中的sku单独提出，所以要将盒饭中的置空不传给前端
        boxLunch.setBoxLunchSkuVOList(null);

        resultMap.put("boxLunch", boxLunch);

        //返回调料包数据
        ArrayList<CondimentVO> condimentList = null;
        if (boxLunch.getBoxLunchIsCondiment() > 0)
            condimentList = condimentService.getCondimentListToBoxLunch(boxLunch.getBoxLunchId());
        if (condimentList != null) {
            HashMap<String, Object> condimentMap = new HashMap<>();
            condimentMap.put(STRING_KEY_NAME, STRING_CONDIMENT);
            condimentMap.put(STRING_KEY_LIST, condimentList);
            resultMap.put("condiment", condimentMap);
        }

        return ResultUtil.success(resultMap);
    }

    /**
     * 个人点餐页面-分类盒饭列表
     *
     * @return 个人点餐页面json
     * @author 甘雨
     */
    @ResponseBody
    @PostMapping(value = "/personalBoxLunch")
    public Result personalBoxLunch(@Validated ShiroToken token,
                                   @RequestParam("personalTimestamp") Long timestamp, @RequestParam("categoryId") Integer categoryId,
                                   @RequestParam("offset") Integer offset, @RequestParam("limit") Integer limit) {
        validateToken(token);
        HashMap<String, Object> resultMap = new HashMap<>();

        HashMap<String, Object> paramMap = new HashMap<>();
        paramMap.put("timestamp", timestamp);
        paramMap.put("categoryId", categoryId);
        paramMap.put("offset", offset);
        paramMap.put("limit", limit);
        ArrayList<PersonalBoxLunchVO> personalBoxLunchList = boxLunchService.getPersonalBoxLunchList(paramMap);

        //将sku和调料包列表的名称写入返回的数据
        for (PersonalBoxLunchVO personalBoxLunch : personalBoxLunchList) {
            for (BoxLunchVO boxLunch : personalBoxLunch.getBoxLunchVOList()) {
                boxLunch.setSkuListName(STRING_SKU);

                //处理盒饭中的sku的排序
                encodeSku(boxLunch);

                if (boxLunch.getBoxLunchIsCondiment() > 0) boxLunch.setCondimentListName(STRING_CONDIMENT);
            }
        }

        resultMap.put("personalBoxLunchList", personalBoxLunchList);
        return ResultUtil.success(resultMap);
    }

    /**
     * 个人点餐页面-爆款盒饭列表
     *
     * @return 盒饭列表json
     * @author 甘雨
     */
    @ResponseBody
    @PostMapping(value = "/personalFire")
    public Result personalFire(@Validated ShiroToken token,
                               @RequestParam("offset") Integer offset, @RequestParam("limit") Integer limit) {
        validateToken(token);
        HashMap<String, Object> resultMap = new HashMap<>();

        HashMap<String, Object> paramMap = new HashMap<>();
        paramMap.put("offset", offset);
        paramMap.put("limit", limit);
        List<BoxLunchVO> boxLunchFireList = boxLunchService.getBoxLunchFireList(paramMap);

        //将sku和调料包列表的名称写入返回的数据
        for (BoxLunchVO boxLunch : boxLunchFireList) {
            boxLunch.setSkuName(STRING_SKU);

            //处理盒饭中的sku的排序
            encodeSku(boxLunch);

            if (boxLunch.getBoxLunchIsCondiment() > 0) boxLunch.setCondimentListName(STRING_CONDIMENT);
        }

        resultMap.put("boxLunchFireList", boxLunchFireList);
        return ResultUtil.success(resultMap);
    }

    /**
     * 个人点餐页面-某天的盒饭类型列表
     *
     * @param timestamp 某天零点的时间戳
     * @return 盒饭分类列表
     * @author 甘雨
     */
    @ResponseBody
    @PostMapping(value = "/personalClassify")
    public Result personalClassify(@Validated ShiroToken token, @RequestParam("personalTimestamp") Long timestamp) {
        validateToken(token);

        HashMap<String, Object> resultMap = new HashMap<>();

        ArrayList<BoxLunchClassifyVO> boxLunchClassifyList = boxLunchService.getBoxLunchClassifyList(timestamp);

        resultMap.put("shopTimestamp", CommonGoods.getShopTimestamp(shopsService.getShopTimestamp(token.getShopId()), timestamp));
        resultMap.put("boxLunchClassifyList", boxLunchClassifyList);

        return ResultUtil.success(resultMap);
    }

    /**
     * 盒饭点赞
     *
     * @param boxLunchId 盒饭id
     * @return 点赞结果json
     * @author 甘雨
     */
    @ResponseBody
    @PostMapping("praise")
    public Result praise(@Validated ShiroToken token,
                         @RequestParam("boxLunchId") Integer boxLunchId) {
        validateToken(token);

        Integer praiseStatus = boxLunchService.checkBoxLunchPraise(token.getUserId(), boxLunchId);


        if (praiseStatus == 2) {
            synchronized (this) {
                boxLunchService.addPraise();
            }
        }
        return ResultUtil.success();
    }

    /**
     * 新增 / 修改 盒饭 以及 sku
     * @param boxLunchDTO 盒饭DTO
     * @return json
     * @author hyf
     */
    @PostMapping("insertOrUpdateBoxLunchAndSku")
    @ResponseBody
    public Result insertOrUpdateBoxLunchAndSku(@RequestBody BoxLunchDTO boxLunchDTO){
        if (boxLunchDTO != null && boxLunchDTO.getBoxLunchName().length() > Constants.TEN) {//判断套餐名称是否超出上限
            return ResultUtil.error(ExceptionEnum.BOX_LUNCH_NAME_CONTENT_SIZE_OVER);
        }

        if (boxLunchDTO.getDefaultSkuId() != Constants.ZERO && CollectionUtils.isEmpty(boxLunchDTO.getBoxLunchSkuList())) {
            return ResultUtil.error(ExceptionEnum.BOX_LUNCH_SKU_IS_NULL);
        }

        if (CollectionUtils.isNotEmpty(boxLunchDTO.getBoxLunchSkuList())) {//有规格
            for (BoxLunchSkuDTO b : boxLunchDTO.getBoxLunchSkuList()) {

                if (b.getSkuName().length() > Constants.TEN) {
                    return ResultUtil.error(ExceptionEnum.SKU_NAME_CONTENT_SIZE_OVER);
                }
            }
        }

        if (CollectionUtils.isNotEmpty(boxLunchDTO.getCondimentList())) {//判断是否有调味包
            boxLunchDTO.setBoxLunchIsCondiment(Constants.ONE);//有调料包
        } else {
            boxLunchDTO.setBoxLunchIsCondiment(Constants.ZERO);//无调料包
        }

        if (CollectionUtils.isEmpty(boxLunchDTO.getFoodsList())) {//判断盒饭是否有载入商品
            return ResultUtil.error(ExceptionEnum.FOODS_IS_NULL);
        }


        if (boxLunchService.insertOrUpdateBoxLunchAndSku(boxLunchDTO) > Constants.ZERO) {
            return ResultUtil.success();
        }
        return ResultUtil.error(ExceptionEnum.OPERATION_FAIL);
    }

    /**
     * 后台管理系统 -- 批量删除盒饭 hyf
     * @param boxLunchDTO 盒饭dto
     * @return json
     */
    @ResponseBody
    @PostMapping("deleteBoxLunchStatus")
    public Result updateBoxLunchStatus(@RequestBody BoxLunchDTO boxLunchDTO) {
        if (CollectionUtils.isEmpty(boxLunchDTO.getIdList())) {
            return ResultUtil.error(ExceptionEnum.PARAM_IS_NULL);
        }
        boxLunchDTO.setBoxLunchStatus(Constants.NINETY_NINE);
        if (boxLunchService.updateBoxLunchStatus(boxLunchDTO) > Constants.ZERO) {
            return ResultUtil.success();
        }
        return ResultUtil.error(ExceptionEnum.OPERATION_FAIL);
    }

    /**
     * 处理盒饭中的sku的排序
     *
     * @param boxLunch 盒饭
     * @author 甘雨
     */
    private void encodeSku(BoxLunchVO boxLunch) {
        if (boxLunch.getDefaultSkuId() == 0) {
            boxLunch.getBoxLunchSkuVOList().add(
                    new BoxLunchSkuVO(boxLunch.getBoxLunchId(), boxLunch.getBoxLunchName(),
                            boxLunch.getBoxLunchPrice(), boxLunch.getBoxLunchSalePrice()));
        } else {
            //将sku列表中的默认sku放在首位
            List<BoxLunchSkuVO> tempList = boxLunch.getBoxLunchSkuVOList();
            ArrayList<BoxLunchSkuVO> boxLunchSku = new ArrayList<>();
            for (int i = 0; i < tempList.size(); i++) {
                if (Objects.equals(tempList.get(i).getBoxLunchId(), boxLunch.getDefaultSkuId())) {
                    boxLunchSku.add(tempList.get(i));
                    tempList.remove(i);
                    boxLunchSku.addAll(tempList);
                    boxLunch.setBoxLunchSkuVOList(boxLunchSku);
                    break;
                }
            }
        }
    }
}

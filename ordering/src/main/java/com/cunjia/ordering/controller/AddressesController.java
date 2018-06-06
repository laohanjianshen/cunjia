package com.cunjia.ordering.controller;

import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.base.exception.DescribeException;
import com.cunjia.ordering.base.exception.ExceptionEnum;
import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.base.exception.ResultUtil;
import com.cunjia.ordering.domain.Addresses;
import com.cunjia.ordering.dto.AddressDTO;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.service.AddressesService;
import com.cunjia.ordering.service.LocationsService;
import com.cunjia.ordering.utils.CommentUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/addresses")
public class AddressesController extends BaseController{
    @Autowired
    private AddressesService addressesService;
    @Autowired
    private LocationsService locationsService;

    /**
     * 新增收货地址
     * @auther hyf
     * @param addresses 地址实体类
     * @return json
     */
    @PostMapping("/insertAddresses")
    public Result insertAddresses(@Validated Addresses addresses, @Validated ShiroToken token) {
        validateToken(token);
        addresses.setUserId(token.getUserId());

        if (addresses.getAddressName().trim().length() > Constants.TWENTY_FOUR) {//名称不能超过24位
            addresses.setAddressName(addresses.getAddressName().substring(Constants.ZERO, Constants.TWENTY_FOUR));
        }
        if (addresses.getAddressPhone().trim().length() != Constants.ELEVEN) {//手机号码位数为11位
            return ResultUtil.error(ExceptionEnum.ELEBEN_BITS_PHONE);
        } else {//正则表达式验证手机号码是否有效
            if (!CommentUtil.validatePhone(addresses.getAddressPhone())) {
                return ResultUtil.error(ExceptionEnum.PHONE_FORMAT_ERROR);
            }
        }
        if (addressesService.insertAddresses(addresses) > Constants.ZERO) {
            return ResultUtil.success();
        }
        return ResultUtil.error(ExceptionEnum.OPERATION_FAIL);
    }

    /**
     * 查询支持的送货地点
     * @auther hyf
     * @return json
     */
    @GetMapping("/listLocations")
    public Result listLocations(@Validated ShiroToken token) {
        validateToken(token);
        return  ResultUtil.success(locationsService.listLocations());
    }

    /**
     * 查询收货地址
     * @auther hyf
     * @return json
     */
    @PostMapping("/listAddresses")
    public Result listAddresses(@Validated ShiroToken token) {
        validateToken(token);
        return ResultUtil.success(addressesService.listAddresses(token.getUserId()));
    }

    /**
     * 删除收货地址
     * @auther hyf
     * @param addressId 地址信息
     * @return json
     */
    @PostMapping("/deleteAddresses")
    public Result  deleteAddresses(@RequestParam("addressId") Integer addressId, @Validated ShiroToken token) {
        validateToken(token);
        if (addressId == null || addressId < Constants.ONE) {
            throw new DescribeException(ExceptionEnum.PARAM_IS_NULL);
        }
        if (addressesService.updateAddressDefault(new Addresses(null, Constants.NINETY_NINE, addressId)) > Constants.ZERO) {//状态修改为已作废 99；
            return ResultUtil.success();
        }
        return ResultUtil.error(ExceptionEnum.OPERATION_FAIL);
    }

    /**
     * 修改默认配送地址
     * @auther hyf
     * @param addresses 地址信息
     * @return json
     */
    @PostMapping("/updateAddressDefault")
    public Result updateAddressDefault(@Validated Addresses addresses, @Validated ShiroToken token) {
        validateToken(token);
        if (addresses == null || addresses.getAddressId() == null) {
            throw new DescribeException(ExceptionEnum.PARAM_IS_NULL);
        }
        if (addressesService.updateAddressDefault(new Addresses(addresses.getUserId(),Constants.ZERO,null)) > Constants.ZERO) {//根据userId修改为非默认
            if (addressesService.updateAddressDefault(new Addresses(null, Constants.ONE, addresses.getAddressId())) > Constants.ZERO) {//根据addressId修改为默认地址
                return ResultUtil.success();
            }
        }
        return ResultUtil.error(ExceptionEnum.OPERATION_FAIL);
    }

    /**
     * 修改配送地址
     * @auther hyf
     * @param addresses 地址信息
     * @return json
     */
    @PostMapping("/updateAddress")
    public Result updateAddressById(@Validated Addresses addresses, @Validated ShiroToken token) {
        validateToken(token);
        if (addresses == null || addresses.getAddressId() == null) {
            throw new DescribeException(ExceptionEnum.PARAM_IS_NULL);
        }
        if (addresses.getAddressName().trim().length() > Constants.TWENTY_FOUR) {//名称不能超过24位
            addresses.setAddressName(addresses.getAddressName().substring(Constants.ZERO, Constants.TWENTY_FOUR));
        }
        if (addresses.getAddressPhone().trim().length() != Constants.ELEVEN) {//手机号码位数为11位
            return ResultUtil.error(ExceptionEnum.ELEBEN_BITS_PHONE);
        } else {//正则表达式验证手机号码是否有效
            if (!CommentUtil.validatePhone(addresses.getAddressPhone())) {
                return ResultUtil.error(ExceptionEnum.PHONE_FORMAT_ERROR);
            }
        }
        addresses.setUserId(token.getUserId());
        if (addressesService.insertAddresses(addresses) > 0) {//新增成功
            addressesService.updateAddressDefault(new Addresses(null, Constants.NINETY_NINE, addresses.getAddressId()));//作废地址
            return ResultUtil.success();
        }
        return ResultUtil.error(ExceptionEnum.OPERATION_FAIL);
    }

    /**
     * 获取每个市下面支持配送点的经纬度  hyf
     * @param cityName 城市名称
     * @return json
     */
    @PostMapping("/listLatitudeAndLongitudeByCityName")
    public Result listLatitudeAndLongitudeByCityName(@RequestParam String cityName, @Validated ShiroToken token){
        validateToken(token);
        return ResultUtil.success(locationsService.listLatitudeAndLongitudeByCityName(cityName));
    }

    /**
     * 后台管理页面,添加新的配送点
     * @param addressDTO
     * @param token
     * @return
     */
    @PostMapping("/add")
    public Result addNewAddress(AddressDTO addressDTO,@Validated ShiroToken token){
        validateToken(token);
        System.out.println("参数"+addressDTO);
        addressesService.addAddress4Admin(addressDTO);
        return ResultUtil.success();
    }

}
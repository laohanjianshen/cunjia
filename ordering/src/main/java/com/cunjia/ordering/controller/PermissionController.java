package com.cunjia.ordering.controller;

import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.base.exception.ResultUtil;
import com.cunjia.ordering.domain.Permission;
import com.cunjia.ordering.domain.Role;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.service.PermissionService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/permission")
public class PermissionController extends BaseController{

    @Resource
    PermissionService permissionService;

    @PostMapping("/createPermission")
    @ResponseBody
    public Result createPermission(@Validated ShiroToken token, @Validated Permission permission){
        int result = permissionService.addPermission(permission);
        return ResultUtil.success();
    }

    @PostMapping("/deletePermission")
    @ResponseBody
    public Result deletePermission(@Validated ShiroToken token, @Validated Permission permission){
        int result = permissionService.deletePermission(permission.getId());
        return ResultUtil.success();
    }

    @PostMapping("/updatePermissionInfo")
    @ResponseBody
    public Result updatePermission(@Validated ShiroToken token, @Validated Permission permission){
        int result = permissionService.updatePermissionInfo(permission);
        return ResultUtil.success();
    }

    @PostMapping("/getPermissionInfo")
    @ResponseBody
    public Result getPermissionInfo(@Validated ShiroToken token, @Validated Permission permission){
        Permission tempPermission = permissionService.getPermissionInfo(permission.getId());
        return ResultUtil.success(tempPermission);
    }
}

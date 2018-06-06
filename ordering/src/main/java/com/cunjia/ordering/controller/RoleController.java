package com.cunjia.ordering.controller;

import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.base.exception.ResultUtil;
import com.cunjia.ordering.domain.Permission;
import com.cunjia.ordering.domain.Role;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.service.PermissionService;
import com.cunjia.ordering.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/role")
public class RoleController extends BaseController{

    @Resource
    RoleService roleService;

    @PostMapping("/createRole")
    @ResponseBody
    public Result createPermission(@Validated ShiroToken token, @Validated Role role){
        int result = roleService.addRole(role);
        return ResultUtil.success();
    }

    @PostMapping("/deletePermission")
    @ResponseBody
    public Result deletePermission(@Validated ShiroToken token, @Validated Role role){
        int result = roleService.deleteRole(role.getId());
        return ResultUtil.success();
    }

    @PostMapping("/updatePermissionInfo")
    @ResponseBody
    public Result updatePermission(@Validated ShiroToken token, @Validated Role role){
        int result = roleService.updateRoleInfo(role);
        return ResultUtil.success();
    }

    @PostMapping("/getPermissionInfo")
    @ResponseBody
    public Result getPermissionInfo(@Validated ShiroToken token, @Validated Role role){
        Role tempRole = roleService.getRoleInfo(role.getId());
        return ResultUtil.success(tempRole);
    }
}

package com.cunjia.ordering.service;

import com.cunjia.ordering.dao.PermissionMapper;
import com.cunjia.ordering.domain.Permission;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("permissionService")
public class PermissionServiceImpl implements PermissionService{

    @Resource
    PermissionMapper permissionMapper;

    @Override
    public int addPermission(Permission permission) {
        return permissionMapper.insertSelective(permission);
    }

    @Override
    public int deletePermission(Long permissionId) {
        return permissionMapper.deleteByPrimaryKey(permissionId);
    }

    @Override
    public int updatePermissionInfo(Permission permission) {
        return permissionMapper.updateByPrimaryKeySelective(permission);
    }

    @Override
    public Permission getPermissionInfo(Long permissionId) {
        return permissionMapper.selectByPrimaryKey(permissionId);
    }
}

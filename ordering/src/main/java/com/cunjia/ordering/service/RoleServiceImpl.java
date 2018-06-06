package com.cunjia.ordering.service;


import com.cunjia.ordering.dao.RoleMapper;
import com.cunjia.ordering.domain.Role;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Resource
    RoleMapper roleMapper;
    @Override
    public int addRole(Role role) {
        return roleMapper.insertSelective(role);
    }

    @Override
    public int deleteRole(Long roleId) {
        return roleMapper.deleteByPrimaryKey(roleId);
    }

    @Override
    public int updateRoleInfo(Role role) {
        return roleMapper.updateByPrimaryKeySelective(role);
    }

    @Override
    public Role getRoleInfo(Long roleId) {
        return roleMapper.selectByPrimaryKey(roleId);
    }
}

package com.cunjia.ordering.service;

import com.cunjia.ordering.domain.Role;

public interface RoleService {
    int addRole(Role role);

    int deleteRole(Long roleId);

    int updateRoleInfo(Role role);

    Role getRoleInfo(Long roleId);
}

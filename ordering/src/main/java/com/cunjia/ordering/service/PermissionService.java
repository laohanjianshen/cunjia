package com.cunjia.ordering.service;

import com.cunjia.ordering.domain.Permission;
import com.cunjia.ordering.domain.Role;

public interface PermissionService {

    int addPermission(Permission permission);

    int deletePermission(Long permissionId);

    int updatePermissionInfo(Permission permission);

    Permission getPermissionInfo(Long permissionId);
}

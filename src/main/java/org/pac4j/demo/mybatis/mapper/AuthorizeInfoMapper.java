package org.pac4j.demo.mybatis.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface AuthorizeInfoMapper {

    @Select("select role_name from sec_user u, sec_user_role ur, sec_role r " +
            "where u.user_id = ur.user_id " +
            "and ur.role_id = r.role_id " +
            "and u.user_name = #{userName}")
    List<String> getRoles(@Param("userName") String userName);

    @Select("select permission_name from sec_role r, sec_role_permission rp, sec_permission p " +
            "where r.role_id = rp.role_id " +
            "and rp.permission_id = p.permission_id " +
            "and r.role_name = #{roleName}")
   List<String> getPermission(@Param("roleName") String roleName);
}

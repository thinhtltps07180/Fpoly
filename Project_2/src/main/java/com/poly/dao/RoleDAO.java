package com.poly.dao;

import java.util.List;

import com.poly.entity.Role;

public interface RoleDAO {
	Role findById(Integer id);
	List<Role>findAll();
	Role create(Role entity);
	void update(Role entity);
	Role delete(Integer id);

}

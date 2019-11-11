package com.poly.dao;

import java.util.List;

import com.poly.entity.User;

public interface UserDAO {
	User findById(String id);
	List<User>findAll();
	User create(User entity);
	void update(User entity);
	User delete(String id);

}

package com.poly.dao;

import java.util.List;

import com.poly.enity.User;

public interface UserDAO {
	User finById(Integer id);
	List<User>findAll();
	User create(User entity);
	void update(User entity);
	User delete(Integer id);

}

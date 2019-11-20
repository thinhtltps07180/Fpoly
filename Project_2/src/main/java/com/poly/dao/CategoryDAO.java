package com.poly.dao;

import java.util.List;

import com.poly.entity.Category;

public interface CategoryDAO {
	Category findById(Integer id);
	List<Category>findAll();
	Category create(Category entity);
	void update(Category entity);
	Category delete(Integer id);
	

}

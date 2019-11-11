package com.poly.dao;

import java.util.List;

import com.poly.entity.Product;

public interface ProductDAO {
	Product findById(Integer id);
	List<Product>findAll();
	Product create(Product entity);
	void update(Product entity);
	Product delete(Integer id);

}

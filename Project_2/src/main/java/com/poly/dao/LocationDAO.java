package com.poly.dao;

import java.util.List;

import com.poly.entity.Location;

public interface LocationDAO {
	Location findById(Integer id);
	List<Location>findAll();
	Location create(Location entity);
	void update(Location entity);
	Location delete(Integer id);
	

}

package com.poly.dao;

import java.util.List;

import com.poly.entity.New;

public interface NewDAO {
	New findById(Integer id);
	List<New> findAllByUserId();
	List<New> findAll();
	List<New> findAllByStatus();
	New create(New entity);
	void update(New entity);
	New delete(Integer id);
	List<New> findPage(int pageNo);
	int getPageCount();

}

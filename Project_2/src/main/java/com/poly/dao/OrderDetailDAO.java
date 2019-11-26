package com.poly.dao;

import java.util.List;

import com.poly.entity.OrderDetail;

public interface OrderDetailDAO {
	OrderDetail findById(Integer id);
	List<OrderDetail>findAll();
	List<OrderDetail>findAllByStatus();
	List<OrderDetail>findAllByOrderId(Integer id);
	List<OrderDetail>findAllByA1();
	List<OrderDetail>findAllByA2();
	List<OrderDetail>findAllByA3();
	OrderDetail create(OrderDetail entity);
	void update(OrderDetail entity);
	OrderDetail delete(Integer id);

}

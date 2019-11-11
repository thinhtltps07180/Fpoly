package com.poly.dao;

import java.util.List;

import com.poly.entity.Order;
import com.poly.entity.OrderDetail;

public interface OrderDAO {
	Order findById(Integer id);
	List<Order>findAll();
	List<Order>findAllByUser();
	Order create(Order entity);
	void update(Order entity);
	Order delete(Integer id);
	void create(Order order, List<OrderDetail> orderDetails);

}

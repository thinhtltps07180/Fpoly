package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.entity.User;

@Transactional
@Repository
public class OrDerDAOImpl implements OrderDAO {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	HttpSession session;

	@Override
	public Order findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(Order.class, id);
	}

	@Override
	public List<Order> findAll() {
		String hql = "FROM Order";
		Session session = factory.getCurrentSession();
		TypedQuery<Order> query = session.createQuery(hql, Order.class);
		return query.getResultList();
		
	}

	@Override
	public Order create(Order entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Order entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public Order delete(Integer id) {
		Order entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

	@Override
	public void create(Order order, List<OrderDetail> orderDetails) {
		Session session = factory.getCurrentSession();
		session.save(order);
		orderDetails.forEach(d->{
			session.save(d);
		});
	}

	@Override
	public List<Order> findAllByUser() {
		User user = (User)session.getAttribute("user");
		String hql = "FROM Order WHERE user =:id";
		Session session = factory.getCurrentSession();
		TypedQuery<Order> query = session.createQuery(hql, Order.class);
		query.setParameter("id", user);
		return query.getResultList();
	}

	

	
}

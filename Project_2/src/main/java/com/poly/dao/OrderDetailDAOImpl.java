package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.OrderDetail;

@Transactional
@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public OrderDetail findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(OrderDetail.class, id);
	}

	@Override
	public List<OrderDetail> findAll() {
		String hql = "FROM OrderDetail";
		Session session = factory.getCurrentSession();
		TypedQuery<OrderDetail> query = session.createQuery(hql, OrderDetail.class);
		return query.getResultList();
		
	}

	@Override
	public OrderDetail create(OrderDetail entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(OrderDetail entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public OrderDetail delete(Integer id) {
		OrderDetail entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

	
	@Override
	public List<OrderDetail> findAllByA1() {
		String hql = "from OrderDetail dt where dt.product.location = 1 and dt.product.countShow > 0 and dt.status = true ";
		Session session = factory.getCurrentSession(); 
		TypedQuery<OrderDetail> query = session.createQuery(hql, OrderDetail.class);
		return query.getResultList();	
	}

	@Override
	public List<OrderDetail> findAllByA2() {
		String hql = "from OrderDetail dt where dt.product.location = 2 and dt.product.countShow > 0 and dt.status = true ";
		Session session = factory.getCurrentSession(); 
		TypedQuery<OrderDetail> query = session.createQuery(hql, OrderDetail.class);
		return query.getResultList();	
	}

	@Override
	public List<OrderDetail> findAllByA3() {
		String hql = "from OrderDetail dt where dt.product.location = 3 and dt.product.countShow > 0 and dt.status = true ";
		Session session = factory.getCurrentSession(); 
		TypedQuery<OrderDetail> query = session.createQuery(hql, OrderDetail.class);
		return query.getResultList();	
	}

	@Override
	public List<OrderDetail> findAllByOrderId(Integer id) {
		String hql = "FROM OrderDetail where OrderId =:id";
		Session session = factory.getCurrentSession();
		TypedQuery<OrderDetail> query = session.createQuery(hql, OrderDetail.class);
		query.setParameter("id", id);
		return query.getResultList();	
	}

	@Override
	public List<OrderDetail> findAllByStatus() {
		String hql = "FROM OrderDetail dt where dt.status = false ";
		Session session = factory.getCurrentSession();
		TypedQuery<OrderDetail> query = session.createQuery(hql, OrderDetail.class);
		return query.getResultList();
	}

	

	
}

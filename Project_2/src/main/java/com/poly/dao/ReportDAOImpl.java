package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Transactional
@Repository
public class ReportDAOImpl implements ReportDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public List<Object[]> revenueByProduct() {
		String hql = "SELECT d.product.location.name,"
				+ "SUM(d.quantity),"
				+ "SUM(d.quantity * d.unitPrice),"
				+ "MIN(d.unitPrice),"
				+ "MAX(d.unitPrice)"
				+ "FROM OrderDetail d "
				+ "GROUP BY d.product.location.name";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
		
	}

	@Override
	public List<Object[]> revenueByCustomer() {
		String hql = "SELECT d.order.user.id,"
				+ "SUM(d.quantity),"
				+ "SUM(d.quantity * d.unitPrice),"
				+ "MIN(d.unitPrice),"
				+ "MAX(d.unitPrice)"
				+ "FROM OrderDetail d "
				+ "GROUP BY d.order.user.id "
				+ "ORDER BY SUM(d.quantity * d.unitPrice) DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]>statisticalByCategoriesNews() {
		String hql = "SELECT n.categories.name,"
				+ "SUM(n.countViewer),"
				+ "MIN(n.countViewer),"
				+ "MAX(n.countViewer)"
				+ "FROM New n "
				+ "GROUP BY n.categories.name ";
				
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> statisticalByAuthor() {
		String hql = "SELECT n.user.id,"		
				+ "SUM(n.countViewer),"
				+ "COUNT(n.id),"
				+ "MIN(n.countViewer),"
				+ "MAX(n.countViewer)"
				+ "FROM New n "
				+ "Where n.user.roles.name = 'journalist' "
				+ "GROUP BY n.user.id "
				+ "ORDER BY SUM(n.countViewer) DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

}

package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.Location;

@Transactional
@Repository
public class LocationDAOImpl implements LocationDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public Location findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(Location.class, id);
	}

	@Override
	public List<Location> findAll() {
		String hql = "FROM Location";
		Session session = factory.getCurrentSession();
		TypedQuery<Location> query = session.createQuery(hql, Location.class);
		return query.getResultList();
		
	}

	@Override
	public Location create(Location entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Location entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public Location delete(Integer id) {
		Location entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}



	

	
}

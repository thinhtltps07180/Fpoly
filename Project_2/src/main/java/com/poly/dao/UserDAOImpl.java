package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.User;

@Transactional
@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public User findById(String id) {
		Session session = factory.getCurrentSession();
		return session.find(User.class, id);
	}

	@Override
	public List<User> findAll() {
		String hql = "FROM User";
		Session session = factory.getCurrentSession();
		TypedQuery<User> query = session.createQuery(hql, User.class);
		return query.getResultList();
		
	}

	@Override
	public User create(User entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(User entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public User delete(String id) {
		User entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

	

	
}

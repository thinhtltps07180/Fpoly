package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.Role;

@Transactional
@Repository
public class RoleDAOImpl implements RoleDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public Role findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(Role.class, id);
	}

	@Override
	public List<Role> findAll() {
		String hql = "FROM Role";
		Session session = factory.getCurrentSession();
		TypedQuery<Role> query = session.createQuery(hql, Role.class);
		return query.getResultList();
		
	}

	@Override
	public Role create(Role entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Role entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public Role delete(Integer id) {
		Role entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

	

	
}

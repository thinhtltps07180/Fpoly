package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.New;
import com.poly.entity.User;

@Transactional
@Repository
public class NewDAOImpl implements NewDAO {
	@Autowired
	SessionFactory factory;

	@Autowired
	HttpSession session;
	
	int pageSize = 5;

	@Override
	public New findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(New.class, id);
	}

	@Override
	public List<New> findAllByUserId() {
		User user = (User) session.getAttribute("user");
		String hql = "FROM New n WHERE n.user.id =:id  ";
		Session session = factory.getCurrentSession();
		TypedQuery<New> query = session.createQuery(hql, New.class);
		query.setParameter("id", user.getId());
		return query.getResultList();

	}

	@Override
	public New create(New entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(New entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public New delete(Integer id) {
		New entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

	@Override
	public List<New> findAll() {
		String hql = "FROM New n  WHERE n.status = true ORDER BY n.id DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<New> query = session.createQuery(hql, New.class);
		return query.getResultList();
	}

	@Override
	public List<New> findAllByStatus() {
		String hql = "FROM New where status = false";
		Session session = factory.getCurrentSession();
		TypedQuery<New> query = session.createQuery(hql, New.class);
		return query.getResultList();
	}

	@Override
	public List<New> findPage(int pageNo) {
		String hql = "FROM New n  WHERE n.status = true ORDER BY n.id DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<New> query = session.createQuery(hql, New.class);
		query.setFirstResult(pageNo * pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int getPageCount() {
		String hql = "SELECT count(n) FROM New n  WHERE status = true ";
	
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session.createQuery(hql, Long.class);
		long count = query.getSingleResult();
		int pageCount = (int) Math.ceil(1.0 * count/pageSize);
		return pageCount;
	}

	@Override
	public List<New> findAllByCategoryIsUEFAChampionsLeague() {
		String hql = "FROM New n  WHERE n.status = true AND n.categories.id = '1'  ORDER BY createDate DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<New> query = session.createQuery(hql, New.class);
		return query.getResultList();
	}

	@Override
	public List<New> findAllByCategoryIsPremierLeague() {
		String hql = "FROM New n  WHERE n.status = true AND n.categories.id = '2'  ORDER BY createDate DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<New> query = session.createQuery(hql, New.class);
		return query.getResultList();
	}

	@Override
	public List<New> findAllByCategoryIsBundesLiga() {
		String hql = "FROM New n  WHERE n.status = true AND n.categories.id = '3'  ORDER BY createDate DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<New> query = session.createQuery(hql, New.class);
		return query.getResultList();
	}

	@Override
	public List<New> findAllByCategoryIsSerieA() {
		String hql = "FROM New n  WHERE n.status = true AND n.categories.id = '4'  ORDER BY createDate DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<New> query = session.createQuery(hql, New.class);
		return query.getResultList();
	}

	@Override
	public List<New> findAllByCategoryIsVietnamesefootball() {
		String hql = "FROM New n  WHERE n.status = true AND n.categories.id = '5'  ORDER BY createDate DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<New> query = session.createQuery(hql, New.class);
		return query.getResultList();
	}

	@Override
	public New findByTop1News() {
		String hql = "SELECT n FROM New n WHERE n.status = true  ORDER BY n.id DESC ";
		Session session = factory.getCurrentSession();
		TypedQuery<New> query = session.createQuery(hql,New.class);
		query.setFirstResult(0);
		query.setMaxResults(1);
		New result = query.getSingleResult();
		return result;
	}

	@Override
	public List<New> findAllTop2() {
		String hql = "FROM New n  WHERE n.status = true ORDER BY n.id DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<New> query = session.createQuery(hql, New.class);
		query.setFirstResult(1);
		query.setMaxResults(2);
		return query.getResultList();
	}

	@Override
	public New findByTop1NewsOrDerByCountViewer() {
		String hql = "SELECT n FROM New n WHERE n.status = true  ORDER BY countViewer DESC ";
		Session session = factory.getCurrentSession();
		TypedQuery<New> query = session.createQuery(hql,New.class);
		query.setFirstResult(0);
		query.setMaxResults(1);
		New result = query.getSingleResult();
		return result;
	}

	@Override
	public List<New> findByListNewsOrDerByCountViewer() {
		String hql = "FROM New  WHERE status = true ORDER BY countViewer DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<New> query = session.createQuery(hql, New.class);
		query.setFirstResult(1);
		query.setMaxResults(3);
		return query.getResultList();
	}

	@Override
	public List<New> findAllByCategoryIsLaliga() {
		String hql = "FROM New n  WHERE n.status = true AND n.categories.id = '6'  ORDER BY createDate DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<New> query = session.createQuery(hql, New.class);
		return query.getResultList();
	}

	

}

package com.poly.dao;

import java.util.List;

import com.poly.entity.New;

public interface NewDAO {
	New findById(Integer id);
	New findByTop1News();
	New findByTop1NewsOrDerByCountViewer();
	List<New> findByListNewsOrDerByCountViewer();
	List<New> findAllByUserId();
	List<New> findAllTop2();
	List<New> findAll();
	List<New> findAllByStatus();
	List<New> findAllByCategoryIsUEFAChampionsLeague();
	List<New> findAllByCategoryIsPremierLeague();
	List<New> findAllByCategoryIsBundesLiga();
	List<New> findAllByCategoryIsSerieA();
	List<New> findAllByCategoryIsVietnamesefootball();
	New create(New entity);
	void update(New entity);
	New delete(Integer id);
	List<New> findPage(int pageNo);
	int getPageCount();

}

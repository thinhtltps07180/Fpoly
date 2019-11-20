package com.poly.dao;

import java.util.List;

public interface ReportDAO {
	List<Object[]> revenueByProduct();
	List<Object[]> revenueByCustomer();
	List<Object[]> statisticalByCategoriesNews();
	List<Object[]> statisticalByAuthor();
}

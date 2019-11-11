package com.poly.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.dao.ProductDAO;
import com.poly.entity.Product;

@SessionScope
@Service
public class ClientService {
	@Autowired
	ProductDAO dao;

	List<Product> items = new ArrayList<>();

	public void add(Integer id) {
		for (Product item : items) {
			if (item.getId().intValue() == id.intValue()) {
				item.setQuantity(item.getQuantity() + 1);
				item.setCountShow(item.getCountShow() + 5);
				return;
			}
		}
		Product p = dao.findById(id);
		p.setQuantity(1);
		items.add(p);
	}

	public void remove(Integer id) {
		for (Product item : items) {
			if (item.getId().intValue() == id.intValue()) {
				items.remove(item);
				return;
			}
		}
	}

	public void update(Integer id, int qty) {
		for (Product item : items) {
			if (item.getId().intValue() == id.intValue()) {
				item.setQuantity(qty);
				return;
			}
		}
	}

	public void clear() {
		items.clear();
	}

	public List<Product> getItems() {
		return items;
	}

	public int getCount() {
		int count = 0;
		for (Product item : items) {
			count += item.getQuantity();
		}
		return count;
	}

	public double getAmount() {
		int amount = 0;
		for (Product item : items) {
			amount += item.getQuantity() * item.getUnitPrice();
		}
		return amount;
	}

}

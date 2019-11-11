package com.poly.interceptor;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.poly.dao.OrderDetailDAO;
import com.poly.entity.OrderDetail;

@Component
public class FilterInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	HttpSession session;
	
	@Autowired
	OrderDetailDAO dao;
	
	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if (modelAndView != null) {
			List<OrderDetail> list  = dao.findAllByA1();
			Collections.shuffle( list);
			modelAndView.addObject("listPut" , list.get(0));
//			list.get(0).setCountShow(list.get(0).getCountShow() - 1);
			OrderDetail orderDetail = dao.findById(list.get(0).getId());
			orderDetail.setCountShow(orderDetail.getCountShow() - 1);
			dao.update(orderDetail);
			System.out.println("before ");
			System.out.println("OrdetailID :" + list.get(0).getId());
			System.out.println("CounShow :" + list.get(0).getCountShow());
			System.out.println("after");
			System.out.println("OrdetailID :" + orderDetail.getId());
			System.out.println("CounShow :" + orderDetail.getCountShow());
		}
		
		
	}

}

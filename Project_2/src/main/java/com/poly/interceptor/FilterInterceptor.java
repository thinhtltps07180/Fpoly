package com.poly.interceptor;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.poly.dao.CategoryDAO;
import com.poly.dao.NewDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.entity.New;
import com.poly.entity.OrderDetail;

@Component
public class FilterInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	HttpSession session;
	
	@Autowired
	OrderDetailDAO dao;
	
	@Autowired
	NewDAO newDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if (modelAndView != null) {
			List<OrderDetail> list  = dao.findAllByA1();
			List<OrderDetail> listA2  = dao.findAllByA2();
			List<OrderDetail> listA3  = dao.findAllByA3();
			
			if(list.size()>0) {
				Collections.shuffle( list);
				OrderDetail orderDetail = list.get(0);
				orderDetail.setCountShow(orderDetail.getCountShow() - 1);
				modelAndView.addObject("listPut" , orderDetail);
				dao.update(orderDetail);
			}
			
			if(listA2.size()>0) {
				Collections.shuffle( listA2);
				OrderDetail orderDetail = listA2.get(0);
				orderDetail.setCountShow(orderDetail.getCountShow() - 1);
				modelAndView.addObject("listPuta2" , orderDetail);
				dao.update(orderDetail);
			}
			
			if(listA3.size()>0) {
				Collections.shuffle( listA3);
				OrderDetail orderDetail = listA3.get(0);
				orderDetail.setCountShow(orderDetail.getCountShow() - 1);
				modelAndView.addObject("listPuta3" , orderDetail);
				dao.update(orderDetail);
			}
			
			New top1Viewer = newDAO.findByTop1NewsOrDerByCountViewer();
			List<New> listTopNewsByCountViewer = newDAO.findByListNewsOrDerByCountViewer();
			List<New> listTop2 = newDAO.findAllTop2();
			New top1 = newDAO.findByTop1News();
			modelAndView.addObject("listTop2", listTop2 );
			modelAndView.addObject("top1" , top1);
			
			
			
			
			modelAndView.addObject("top1Viewer" , top1Viewer);
			modelAndView.addObject("listCountV" , listTopNewsByCountViewer);
//			list.get(0).setCountShow(list.get(0).getCountShow() - 1);
		
			

//			System.out.println("before ");
//			System.out.println("OrdetailID :" + list.get(0).getId());
//			System.out.println("CounShow :" + list.get(0).getCountShow());
//			System.out.println("after");
//			System.out.println("OrdetailID :" + orderDetail.getId());
//			System.out.println("CounShow :" + orderDetail.getCountShow());
		}
		
		
	}

}

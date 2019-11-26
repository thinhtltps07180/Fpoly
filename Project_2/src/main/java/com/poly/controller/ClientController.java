package com.poly.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.LocationDAO;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Category;
import com.poly.entity.Location;
import com.poly.entity.New;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.entity.Product;
import com.poly.entity.User;
import com.poly.service.ClientService;

@Controller
public class ClientController {
	
	@Autowired
	ServletContext app;
	
	@Autowired
	LocationDAO locationDAO ;

	@Autowired
	HttpSession session;

	@Autowired
	ProductDAO dao;

	@Autowired
	OrderDAO orderDAO;

	@Autowired
	OrderDetailDAO detailDAO;

	@Autowired
	ClientService service;

	@GetMapping("/client/home")
	public String adminList(Model model) {
		List<Location> listLct = locationDAO.findAll();
		model.addAttribute("listLct", listLct);
		model.addAttribute("add", new Product());
		return "client/home";
	}
	
	@PostMapping("/client/addBanner")
	public String register(Model model, @ModelAttribute("add") Product product, @RequestParam("up_photo") MultipartFile file) {
		if (file.isEmpty()) {
			product.setImage("product.png");
		} else {
			product.setImage(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/images/banner/" + product.getImage());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		try {

			Location location = new Location();
			location.setId(product.getLocation().getId());
			product.setLocation(location);
			dao.create(product);
			model.addAttribute("message", "Order  thành công!");
			
		} catch (Exception e) {
			model.addAttribute("message", "Order thất bại!");
		}

		

		return "client/confirm";
	}

	


	@RequestMapping("/client/view")
	public String view() {
		return "client/view";
	}

	@RequestMapping("/client/add/{id}")
	public String add(@PathVariable("id") Integer id) {		
		service.add(id);
		return "redirect:/client/view";
	}

	@RequestMapping("/client/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		service.remove(id);
		return "redirect:/client/view";
	}

	@RequestMapping("/client/update")
	public String update(HttpServletRequest request) {
		List<Product> list = service.getItems();
		for (Product p : list) {
			String id = p.getId().toString();
			int qty = Integer.parseInt(request.getParameter(id));
			service.update(p.getId(), qty);
		}
		return "redirect:/client/view";
	}

	@RequestMapping("/client/clear")
	public String clear() {
		service.clear();
		return "redirect:/client/view";
	}

	@RequestMapping("/client/accept")
	public String accept(Model model, HttpServletRequest request) {
		Order order = new Order();
		order.setOrderDate(new Date());
		order.setAmount(service.getAmount());
		User user = (User) session.getAttribute("user");
		order.setUser(user);

		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		List<Product> list = service.getItems();
		for (Product p : list) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setUnitPrice(service.getAmount());
			orderDetail.setQuantity(p.getQuantity());
			orderDetail.setCountShow(p.getCountShow());
			orderDetail.setImage(p.getImage());
			orderDetail.setStatus(false);
			orderDetail.setOrder(order);
			orderDetail.setProduct(p);
//			orderDetail.setImage(image);
			orderDetails.add(orderDetail);
		}

		orderDAO.create(order, orderDetails);

		return "redirect:/client/view";
	}

	
	
	@RequestMapping("/client/orderdetail")
	public String orderdetail(Model model) {
		List<Order> list = orderDAO.findAllByUser();
		model.addAttribute("listDetailByUser", list);
	
		return "client/management";
	}
	
	@RequestMapping("/client/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		List<OrderDetail> list = detailDAO.findAllByOrderId(id);
		model.addAttribute("listDetail", list);
		for (OrderDetail c : list) {
			System.out.println(c.getId());
			
		}
		return "client/detail";
	}
	
	


}

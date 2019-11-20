package com.poly.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.NewDAO;
import com.poly.dao.ReportDAO;
import com.poly.dao.RoleDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.New;
import com.poly.entity.Role;
import com.poly.entity.User;

@Controller
public class AdminController {

	@Autowired
	UserDAO dao;

	@Autowired
	NewDAO newDAO;

	@Autowired
	RoleDAO roleDAO;
	
	@Autowired
	ReportDAO reportDAO;

	@Autowired
	ServletContext app;

	@GetMapping("/admin/newList")
	public String adminNews(Model model) {
		List<New> list = newDAO.findAllByStatus();
		model.addAttribute("list", list);
		return "admin/newList";
	}
	
	@RequestMapping("/admin/checkNews/{id}")
	public String checkNew(Model model , @PathVariable("id") Integer id) {
		New n = newDAO.findById(id);
		n.setStatus(true);
		newDAO.update(n);
		return "redirect:/admin/newList";
	}

	@GetMapping("/admin/userList")
	public String adminList(Model model) {
		List<User> list = dao.findAll();
		model.addAttribute("list", list);
		return "admin/userList";
	}
	

	@RequestMapping("/admin/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		User user = dao.findById(id);
		model.addAttribute("listRole", roleDAO.findAll());
		model.addAttribute("userEdit", user);
		return "admin/edit";
	}
	
	@RequestMapping("/admin/update")
	public String edit(Model model, @ModelAttribute("userEdit") User user ) {	
		Role role = new Role();
		role.setId(user.getRoles().getId());
		user.setRoles(role);
//		role.setId(2);
//		user.setRoles(role);
		dao.update(user);
		return "redirect:/admin/userList";
	}

	@PostMapping("/admin/delete")
	public String delete(Model model, @RequestParam("id") String id) {
		dao.delete(id);
		return "redirect:/admin/userlist";
	}
	
	@RequestMapping("/admin/revenueByProduct")
	public String revenueByProduct(Model model) {
		model.addAttribute("data" ,reportDAO.revenueByProduct() );
		return "admin/revenueByProduct";
	}
	
	@RequestMapping("/admin/revenueByCustomer")
	public String revenueByCustomer(Model model) {
		model.addAttribute("data" ,reportDAO.revenueByCustomer() );
		return "admin/revenueByCustomer";
	}
	@RequestMapping("/admin/statisticalByCategoriesNews")
	public String statisticalByCategoriesNews(Model model) {
		model.addAttribute("data" ,reportDAO.statisticalByCategoriesNews() );
		return "admin/statisticalByCategoriesNews";
	}
	
	@RequestMapping("/admin/statisticalByAuthor")
	public String statisticalByAuthor(Model model) {
		model.addAttribute("data" ,reportDAO.statisticalByAuthor() );
		return "admin/statisticalByAuthor";
	}
	
	
	

}

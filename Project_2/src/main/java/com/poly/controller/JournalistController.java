package com.poly.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
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

import com.poly.dao.CategoryDAO;
import com.poly.dao.NewDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.Category;
import com.poly.entity.New;
import com.poly.entity.User;

@Controller
public class JournalistController {
	@Autowired
	ServletContext app;

	@Autowired
	NewDAO dao;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	UserDAO userDAO;

	@Autowired
	HttpSession session;

	@RequestMapping("/journalist/management")
	public String management(Model model) {
		List<New> list = dao.findAllByUserId();
		model.addAttribute("list", list);
		return "journalist/management";
	}

	@RequestMapping("/journalist/home")
	public String id() {
		return "journalist/home";
	}

	@GetMapping("/journalist/addNewPost")
	public String register(Model model) {
		New news = new New();
		List<Category> list = categoryDAO.findAll();
		model.addAttribute("list", list);
		model.addAttribute("add", news);
		return "journalist/addNewPost";
	}

	@PostMapping("/journalist/addNewPost")
	public String register(Model model, @ModelAttribute("add") New news, @RequestParam("up_photo") MultipartFile file) {
		if (file.isEmpty()) {
			news.setThumbnail("news.png");
		} else {
			news.setThumbnail(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/images/users/" + news.getThumbnail());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		try {
//					Role role = new Role();
//					role.setId(1);
//					user.setRoles(role);
			User user = (User) session.getAttribute("user");
			news.setUser(user);
			Category category = new Category();
			category.setId(news.getCategories().getId());
			news.setCategories(category);
			news.setStatus(false);
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			formatter.format(date);
			news.setCreateDate(date);
			news.setCountViewer(0);
			dao.create(news);
			model.addAttribute("message", "Đăng ký thành công!");
		} catch (Exception e) {
			model.addAttribute("message", "Đăng ký thất bại!");
		}

		// model.addAttribute("form" , user);

		return "journalist/addNewPost";
	}

	@GetMapping("/journalist/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {	
		New news = dao.findById(id);
		List<Category> list = categoryDAO.findAll();
		model.addAttribute("list", list);
		model.addAttribute("form", news);
		return "journalist/edit";
	}
	
	@PostMapping("/journalist/update")
	public String update(Model model, @ModelAttribute("form") New news, @RequestParam("up_photo") MultipartFile file) {
		if (file.isEmpty()) {
			news.setThumbnail("news.png");
		} else {
			news.setThumbnail(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/images/users/" + news.getThumbnail());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		try {
//					Role role = new Role();
//					role.setId(1);
//					user.setRoles(role);
			User user = (User) session.getAttribute("user");
			news.setUser(user);
			Category category = new Category();
			category.setId(news.getCategories().getId());
			news.setCategories(category);
			news.setStatus(false);
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			formatter.format(date);
			news.setCreateDate(date);
			news.setCountViewer(0);
			dao.update(news);
			model.addAttribute("message", "Đăng ký thành công!");
		} catch (Exception e) {
			model.addAttribute("message", "Đăng ký thất bại!");
		}

		// model.addAttribute("form" , user);

		return "redirect:/journalist/management";
	}
	
	@PostMapping("/journalist/delete")
	public String update(Model model, @RequestParam("id") Integer id) {	
		dao.delete(id);
		return "redirect:/journalist/management";
	}

}

package com.poly.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
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
	
	
	@RequestMapping("/journalist/home")
	public String home() {
		return "journalist/home";
	}

	@RequestMapping("/journalist/management")
	public String management(Model model) {
		List<New> list = dao.findAllByUserId();
		model.addAttribute("listNewsO", list);
		return "journalist/management";
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
	public String register(Model model,@Valid @ModelAttribute("add") New news,  BindingResult errors ,
			@RequestParam("up_photo") MultipartFile file) {
		if (file.isEmpty()) {
			news.setThumbnail("news.png");
		} else {
			news.setThumbnail(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/images/news/" + news.getThumbnail());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");
			List<Category> list = categoryDAO.findAll();
			model.addAttribute("list", list);

			return "journalist/addNewPost";	
		}else {
			try {
				User user = (User) session.getAttribute("user");
				news.setUser(user);
				Category category = new Category();
				category.setId(news.getCategories().getId());
				news.setCategories(category);
				news.setStatus(false);
				Date date = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
				formatter.format(date);
				news.setCreateDate(date);
				news.setCountViewer(0);
				dao.create(news);
				model.addAttribute("message", "Tạo bài viết thành công!");
			} catch (Exception e) {
				model.addAttribute("message", "Tạo bài viết  thất bại!");
				
			}
		}
		

		// model.addAttribute("form" , user);

		return "redirect:/journalist/management";
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
	public String update(Model model,@Valid @ModelAttribute("form") New news,BindingResult errors, @RequestParam("up_photo") MultipartFile file) {
		if (file.isEmpty()) {
			news.setThumbnail(news.getThumbnail());
		} else {
			news.setThumbnail(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/images/news/" + news.getThumbnail());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");
			List<Category> list = categoryDAO.findAll();
			model.addAttribute("list", list);
			return "journalist/edit";	
		}else {
		try {

			User user = (User) session.getAttribute("user");
			news.setUser(user);
			Category category = new Category();
			category.setId(news.getCategories().getId());
			news.setCategories(category);
			news.setStatus(news.getStatus());
			Date date = news.getCreateDate();
			news.setCreateDate(date);
			news.setCountViewer(news.getCountViewer());
			dao.update(news);
			model.addAttribute("message", "Đăng ký thành công!");
		} catch (Exception e) {
			model.addAttribute("message", "Đăng ký thất bại!");
		}

		// model.addAttribute("form" , user);

		return "redirect:/journalist/management";
	}
	}
	
	@PostMapping("/journalist/delete")
	public String update(Model model, @RequestParam("id") Integer id) {	
		dao.delete(id);
		return "redirect:/journalist/management";
	}
	
	 @InitBinder
	    public void initBinder(WebDataBinder binder) {
	        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
	        sdf.setLenient(true);
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	    }

}

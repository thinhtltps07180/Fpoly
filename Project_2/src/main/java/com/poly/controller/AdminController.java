package com.poly.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.NewDAO;
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
	

	@GetMapping("/admin/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		User user = dao.findById(id);
		List<Role> list = roleDAO.findAll();
		model.addAttribute("listRole", list);
		model.addAttribute("userEdit", user);
		return "admin/edit";
	}

	
	@PostMapping("/admin/update")
	public String register(Model model, @Valid @ModelAttribute("userEdit") User user, BindingResult errors,
			@RequestParam("up_photo") MultipartFile file) {
		if (file.isEmpty()) {
			user.setPhoto("user.png");
		} else {
			user.setPhoto(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/images/users/" + user.getPhoto());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");
		} else {
			try {

				Role role = new Role();
				role.setId(user.getRoles().getId());
				user.setRoles(role);
				dao.update(user);
				model.addAttribute("message", "Update thành công!");
			} catch (Exception e) {
				model.addAttribute("message", "Update thất bại!");
			}
		}

		model.addAttribute("userEdit" , user);
		return "admin/edit";
	}

	@PostMapping("/admin/delete")
	public String delete(Model model, @RequestParam("id") String id) {
		dao.delete(id);
		return "redirect:/admin/userlist";
	}

}

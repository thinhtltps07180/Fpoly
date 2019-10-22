package com.poly.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.UserDAO;
import com.poly.entity.Role;
import com.poly.entity.User;

@Controller
public class UserController {

	@Autowired
	ServletContext app;

	@Autowired
	UserDAO dao;

	@Autowired
	HttpSession session;

	@ResponseBody
	@RequestMapping("user/query")
	public String query() {
		List<User> list = dao.findAll();
		for (User c : list) {
			System.out.println(c.getEmail());
		}

//		list.forEach(c->{
//			System.out.println(c.getUserName());
//		});
		return "ok";
	}

	@PostMapping("/account/login")
	public String login(Model model, @RequestParam("id") String id, @RequestParam("password") String pw) {
		User user = dao.finById(id);
		if (user == null) {
			model.addAttribute("message", "Ivalid username!");
		} else if (!pw.equals(user.getPassword())) {
			model.addAttribute("message", "Ivalid password!");
		} else {
			model.addAttribute("message", "Login succesfully!");
		}
		return "account/login";

	}

	@GetMapping("/account/register")
	public String register(Model model) {
		User user = new User();
		user.setId("Trần Lê Thanh Thinh");
		model.addAttribute("form", user);
		return "account/register";
	}

	@GetMapping("/account/login")
	public String login() {
		return "account/login";
	}

	@PostMapping("/account/register")
	public String register(Model model, @Validated @ModelAttribute("form") User user, BindingResult errors,
			@RequestParam("up_photo") MultipartFile file) {
		if(file.isEmpty()) {
			user.setPhoto("user.png");
		}else {
			user.setPhoto(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/images/users/"+user.getPhoto());
				file.transferTo(new File(path));
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");
		} else {
			try {
				Role role = new Role();
				role.setId(1);
				user.setRoles(role);
				dao.create(user);
				model.addAttribute("message", "Đăng ký thành công!");
			} catch (Exception e) {
				model.addAttribute("message", "Đăng ký thất bại!");
			}
		}

//		model.addAttribute("form" , user);
		return "account/register";
	}

}

package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poly.dao.UserDAO;
import com.poly.entity.User;

@Controller
public class UserController {

	@Autowired
	UserDAO dao;

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
//
	@GetMapping("/account/login")
	public String login() {
		return "account/login";
	}

	@PostMapping("/account/login")
	public String login(Model model, @RequestParam("id") String id, @RequestParam("password") String pw) {
		User user = dao.finById(id);
		if(user == null) {
			model.addAttribute("message" , "Ivalid username!");
		}
		else if(!pw.equals(user.getPassword())) {
			model.addAttribute("message" , "Ivalid password!");
		}else {
			model.addAttribute("message" , "Login succesfully!");
		}
		return "account/login";

	}

}

package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		List<User> list  = dao.findAll();
		for(User c:list) {
			System.out.println(c.getUserName());
		}
		
//		list.forEach(c->{
//			System.out.println(c.getUserName());
//		});
		return "ok";
	}

}

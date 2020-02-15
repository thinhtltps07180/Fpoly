package com.poly.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
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
public class HomeController {
	@Autowired
	NewDAO newDAO;

	@Autowired
	ServletContext app;

	@Autowired
	UserDAO dao;

	@Autowired
	HttpSession session;

	@Autowired
	RoleDAO roleDAO;
	
	@GetMapping("/home/index")
	public String callIndex(Model model) {
		int pageNo = 0;
		List<New> list = newDAO.findPage(pageNo);
		model.addAttribute("listPage", list );
		return "home/index";
	}

	@RequestMapping({ "/home/index/{pageNo}" })
	public String index(Model model , @PathVariable( name ="pageNo") int pageNo) {
		if(pageNo >= newDAO.getPageCount()) {
			pageNo = 0;
		}else if(pageNo < 0) {
			pageNo = newDAO.getPageCount() - 1;
		}
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("lastPageCount", newDAO.getPageCount() - 1);
		List<New> list = newDAO.findPage(pageNo);
		model.addAttribute("listPage", list);
		return "home/index";
	}
	
	@GetMapping("/home/about")
	public String about(Model model) {

		
		return "home/about";
	}
	


	@GetMapping("/home/contact")
	public String contact(Model model) {

		
		return "home/contact";
	}
//

	
	@GetMapping("/home/CategoryIsUEFAChampionsLeague")
	public String findAllByCategoryIsUEFAChampionsLeague(Model model) {
		List<New> list = newDAO.findAllByCategoryIsUEFAChampionsLeague();
		model.addAttribute("listUEFA", list );
		
		return "home/CategoryIsUEFAChampionsLeague";
	}
	
	@GetMapping("/home/CategoryIsPremierLeague")
	public String findAllByCategoryIsPremierLeague(Model model) {
		List<New> list = newDAO.findAllByCategoryIsPremierLeague();
		model.addAttribute("listPRE", list );
		
		return "home/CategoryIsPremierLeague";
	}	
	
	@GetMapping("/home/CategoryIsBundesLiga")
	public String findAllByCategoryIsBundesLiga(Model model) {
		List<New> list = newDAO.findAllByCategoryIsBundesLiga();
		model.addAttribute("listBDL", list );
		
		return "home/CategoryIsBundesLiga";
	}
	
	@GetMapping("/home/CategoryIsSerieA")
	public String findAllByCategoryIsSerieA(Model model) {
		List<New> list = newDAO.findAllByCategoryIsSerieA();
		model.addAttribute("listSRA", list );
		
		return "home/CategoryIsSerieA";
	}
	
	@GetMapping("/home/CategoryIsLaliga")
	public String findAllByCategoryIsLaliga(Model model) {
		List<New> list = newDAO.findAllByCategoryIsLaliga();
		model.addAttribute("listLLG", list );
		
		return "home/CategoryIsLaliga";
	}
	
	@GetMapping("/home/CategoryIsVietnamesefootball")
	public String findAllByCategoryIsVietnamesefootball(Model model) {
		List<New> list = newDAO.findAllByCategoryIsVietnamesefootball();
		model.addAttribute("listVNF", list );
		
		return "home/CategoryIsVietnamesefootball";
	}
	

	@GetMapping("/home/login")
	public String login() {
		return "home/login";
	}

	@RequestMapping("/home/logout")
	public String logout() {
		session.removeAttribute("user");
		return "redirect:/home/index";
	}

	@PostMapping("/home/login")
	public String login(Model model, @RequestParam("id") String id, @RequestParam("password") String pw) {
		User user = dao.findById(id);
		if (user == null) {
			model.addAttribute("message", "Invalid username!");
			
		} else if (!pw.equals(user.getPassword())) {
			model.addAttribute("message", "Invalid password!");
		} else {
			session.setAttribute("user", user);

			if (user.getRoles().getName().equals("admin")) {
				return "redirect:/admin/userList";
			} else if (user.getRoles().getName().equals("user")) {
				return "redirect:/home/index";
			} else if (user.getRoles().getName().equals("client")) {
				return "redirect:/client/home";
			} else if (user.getRoles().getName().equals("journalist")) {
				return "redirect:/journalist/home";
			}
			model.addAttribute("message", "Login successfully!");
		}
		return "home/login";
	}

	@RequestMapping("/client/put")
	public String order(Model model) {
		return "home/index";
	}

	@RequestMapping("/home/click/{id}")
	public String click(Model model, @PathVariable("id") Integer id) {
		New news = new New();
		news = newDAO.findById(id);
		news.setCountViewer(news.getCountViewer() + 1);
		newDAO.update(news);
		model.addAttribute("news", news);
		return "home/new";
	}

	@GetMapping("/home/register")
	public String register(Model model) {
		model.addAttribute("form", new User());
		return "home/register";
	}

	@PostMapping("/home/register")
	public String register(Model model, @Validated @ModelAttribute("form") User user, BindingResult errors,
			@RequestParam("up_photo") MultipartFile file) {
		if (file.isEmpty()) {
			user.setPhoto(user.getPhoto());
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
			return "home/register";
		} else {
			try {

				Role role = new Role();
//				role.setId(user.getRoles().getId());
//				user.setRoles(role);
				role.setId(2);
				user.setRoles(role);
				dao.create(user);
				model.addAttribute("message", "Đăng ký thành công!");
			} catch (Exception e) {
				model.addAttribute("message", "Đăng ký thất bại!");
				return "redirect:/home/register";
				
			}
		}

//		model.addAttribute("form" , user);
		return "home/login";
	}

	@GetMapping("/home/edit")
	public String edit(Model model) {
		User user = (User) session.getAttribute("user");
		user = dao.findById(user.getId());
		List<Role> list = roleDAO.findAll();
		model.addAttribute("listRole", list);
		model.addAttribute("userEdit", user);
		return "home/profile";
	}
	
	@GetMapping("/home/edit/{id}")
	public String editUser(Model model) {
		User user = (User) session.getAttribute("user");
		user = dao.findById(user.getId());
		List<Role> list = roleDAO.findAll();
		model.addAttribute("listRole", list);
		model.addAttribute("userEdit", user);
		return "home/edit";
	}

	
	@PostMapping("/home/update")
	public String update(Model model, @Valid @ModelAttribute("userEdit") User user, BindingResult errors,
			@RequestParam("up_photo") MultipartFile file) {
		if (file.isEmpty()) {
			user.setPhoto(user.getPhoto());
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
				role.setId(2);
				user.setRoles(role);
				dao.update(user);
				model.addAttribute("message", "Update thành công!");
			} catch (Exception e) {
				model.addAttribute("message", "Update thất bại!");
			}
		}

		model.addAttribute("userEdit" , user);
		return "home/profile";
	}
	

}

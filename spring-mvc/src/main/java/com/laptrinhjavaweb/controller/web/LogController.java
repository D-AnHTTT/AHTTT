package com.laptrinhjavaweb.controller.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.laptrinhjavaweb.entity.User;
import com.laptrinhjavaweb.service.UserService;

@Controller(value = "logControllerOfWeb")
public class LogController {
	@Autowired
	UserService userService;
	@RequestMapping(value = "/trang-chu/login", method = RequestMethod.GET)
	public String showLogin() {
		return "web/login";
	}
	@RequestMapping(value = "/trang-chu/loginVerify", method = RequestMethod.POST)
	public String verifyLogin(@RequestParam("username")String username,@RequestParam("password")String password,HttpSession session) {
		try {
			User user = userService.findByUsernameAndPassword(username, password);
			if(user!=null) {
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				return "redirect:/trang-chu/newFeed";
			}
		}catch(Exception e) {
			return "web/login";
		}
		return "web/login";
	}
	@RequestMapping(value = "/trang-chu/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("username");
		session.removeAttribute("password");
		return "redirect:/trang-chu/newFeed";
	}
}

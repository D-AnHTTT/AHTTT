package com.laptrinhjavaweb.controller.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller(value = "profileControllerOfWeb")
public class ProfileController {
	@RequestMapping(value = "/trang-chu/profile", method = RequestMethod.GET)
	public String showProfile(Model model) {
		return "web/profile";
	}
}

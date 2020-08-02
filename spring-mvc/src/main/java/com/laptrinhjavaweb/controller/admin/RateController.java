package com.laptrinhjavaweb.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.laptrinhjavaweb.entity.Rate;
import com.laptrinhjavaweb.service.RateService;


@Controller
public class RateController {
	@Autowired
	private RateService rateSV;
	
	@RequestMapping(value="admin/rate")
	public String showRate(Model model){
		List<Rate> listrate = rateSV.findAll();
		model.addAttribute("listrate", listrate);
		return "admin/ManagerRate";
		
	}

}

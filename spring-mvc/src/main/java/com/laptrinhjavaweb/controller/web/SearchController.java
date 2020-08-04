package com.laptrinhjavaweb.controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.laptrinhjavaweb.entity.Post_X;
import com.laptrinhjavaweb.service.Post_XService;

@Controller
public class SearchController {
	@Autowired
	Post_XService post_xService;
	Pageable pageable = new PageRequest(0,2);
	@RequestMapping(value = "ajax")
	public void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Gson gson = new Gson();
		List<String> products = new ArrayList<String>();
		List<String> result = new ArrayList<String>();
		products.add("chung ta khong thuoc ve nhau");
		products.add("ta hua se di cung nhau");
		products.add("nhu mot giac mo ");
		products.add("chuyen di cua nam");
		products.add("chac co yeu la day");
		PrintWriter out = response.getWriter();
		String targetId = request.getParameter("serch");
		List<Post_X> list = post_xService.findPostByTitle(targetId);
		if (targetId !="") {
			for (int i = 0; i < list.size(); i++) {
				
					result.add(list.get(i).getTitle());
				
			}
			out.print(gson.toJson(result));
		} else {
			result.clear();
			out.print(gson.toJson(result));
		}
		out.flush();
		out.close();
	}
	@RequestMapping(value = "/trang-chu/search")
	public String doSearch(@RequestParam("search") String search) {
		return "web/new_feed";
	}
}

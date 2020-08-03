package com.laptrinhjavaweb.controller.admin;

import java.io.File;
import java.net.URLDecoder;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.laptrinhjavaweb.entity.Post;
import com.laptrinhjavaweb.service.PostService;

@Controller
public class PostController {
	@Autowired
	private PostService postSV;

	@RequestMapping(value = "admin/post")
	public String showUser(Model model) {
		List<Post> listpost = postSV.findAll();
		model.addAttribute("page", "post");
		model.addAttribute("listpost", listpost);
		return "admin/ManagerPost";
	}

	@RequestMapping(value = "admin/addpost")
	public String showAddUser(Model model) {
		String day = "" + LocalDate.now();
		Post post = new Post(day);
		model.addAttribute("post", post);
		return "admin/admin_addeditPost";
	}

	@RequestMapping("admin/savepost")
	public String savePost(@RequestParam("fileimg") MultipartFile fileimg, @RequestParam("content") String content,
			@RequestParam("title") String title, @RequestParam("category") int category,
			@RequestParam("username") String username, @RequestParam("timepost") String timepost) {
		long userid = postSV.getUser(username).getId();
		try {
			String fileName = fileimg.getOriginalFilename();
			File file = new File("D:\\xaolon\\", fileName);
			fileimg.transferTo(file);
			Post post = new Post(title, content, timepost, userid, username, category, fileName);
			postSV.savePost(post);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:post";
	}

	@RequestMapping(value = "admin/deletePost")
	public String deletePost(@Param("id") long id) {
		postSV.delete(id);
		return "redirect:post";

	}
}

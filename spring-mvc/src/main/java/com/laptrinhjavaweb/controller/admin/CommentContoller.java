package com.laptrinhjavaweb.controller.admin;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.laptrinhjavaweb.entity.Comment;
import com.laptrinhjavaweb.entity.Post_X;
import com.laptrinhjavaweb.entity.Rate;
import com.laptrinhjavaweb.modelAnh.PostModel;
import com.laptrinhjavaweb.service.CategoryService;
import com.laptrinhjavaweb.service.CommentService;
import com.laptrinhjavaweb.service.Post_XService;
import com.laptrinhjavaweb.service.RateService;
import com.laptrinhjavaweb.service.UserService;

@Controller
public class CommentContoller {

	@Autowired
	private CommentService commentSV;
	@Autowired
	private UserService userService;
	@Autowired
	Post_XService postService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	RateService rateSV;

	@RequestMapping(value = "admin/comment")
	public String showComment(Model model) {
		List<Comment> listcomment = commentSV.findAll();
		model.addAttribute("listcomment", listcomment);
		return "admin/ManagerComment";

	}

	@RequestMapping(value = "admin/deleteComment")
	public String deleteComment(@Param("id") long id) {
		commentSV.delete(id);
		return "redirect:comment";
	}

	@RequestMapping(value = "/trang-chu/showPostDetail/{id}", method = RequestMethod.GET)
	public String showPostDetail(@PathVariable("id") long id, Model model) {
		Post_X post = postService.findById(id);
		List<Comment> listcomment = commentSV.findPost(id);
		int quantityRate = rateSV.quantity(5);
		double avgRate = rateSV.avgRate(5);
		String categoryName = categoryService.findId(post.getCategory_id()).getName();
		PostModel postModel = new PostModel();
		postModel.setPost(post);
		postModel.setCategoryName(categoryName);
		postModel.setListImgPost();
		model.addAttribute("postDetail", postModel.getPost());
		model.addAttribute("categoryPostName", postModel.getCategoryName());
		model.addAttribute("listImgPost", postModel.getListImgPost());
		model.addAttribute("listcomment", listcomment);
		model.addAttribute("quantityRate", quantityRate);
		model.addAttribute("avgRate", avgRate);
		return "web/post_detail";
	}

	@RequestMapping(value = "/trang-chu/saveCommenst")
	public String saveComment(@Param("comment") String comment, @Param("username") String username,
			@Param("postid") int postid) {
		long id = userService.findUserName(username).getId();
		String day = "" + LocalDate.now();
		Comment comments = new Comment(comment, day, id, username, postid);
		commentSV.saveComment(comments);
		return "redirect:showPostDetail/" + postid;

	}

	@RequestMapping(value = "/trang-chu/saveRate")
	public String saveRate(@Param("quantity") int quantity, @Param("username") String username,
			@Param("postid") int postid) {
		long id = userService.findUserName(username).getId();
		String day = "" + LocalDate.now();
		Rate rate = new Rate(quantity, id, postid, day);
		rateSV.saveRate(rate);
		return "redirect:showPostDetail/" + postid;

	}

}

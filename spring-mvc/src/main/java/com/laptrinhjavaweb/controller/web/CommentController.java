package com.laptrinhjavaweb.controller.web;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.data.repository.query.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.laptrinhjavaweb.entity.Comment;
import com.laptrinhjavaweb.entity.Post_X;
import com.laptrinhjavaweb.modelAnh.PostModel;
import com.laptrinhjavaweb.service.CategoryService;
import com.laptrinhjavaweb.service.CommentService;
import com.laptrinhjavaweb.service.Post_XService;

public class CommentController {
	@Autowired
	Post_XService postService;
	@Autowired
	CommentService cmtService;
	@Autowired
	CategoryService categoryService;
	

	@RequestMapping(value = "/trang-chu/showComment", method = RequestMethod.GET)
	public String showComment(@Param("id") long id, Model model, @RequestParam("username") String username,
			@RequestParam("postid") long postid, @RequestParam("content") String content) {
		// Comment cmt = cmtService.findId(id);
		Post_X post = postService.findById(id);
		Comment cmt = new Comment();
		cmt.setContent(content);
		cmt.setId(id);
		cmt.setPost_id(postid);
		cmt.setUser_name(username);
		cmt.setTime_comment("12:00");
		cmtService.saveComment(cmt);
		String categoryName = categoryService.findId(post.getCategory_id()).getName();
		PostModel postModel = new PostModel();
		postModel.setPost(post);
		postModel.setCategoryName(categoryName);
		postModel.setListImgPost();
		postModel.setComment(cmt);
		model.addAttribute("postDetail", postModel.getPost());
		model.addAttribute("categoryPostName", postModel.getCategoryName());
		model.addAttribute("listImgPost", postModel.getListImgPost());
		model.addAttribute("comment", postModel.getComment());
		return "web/post_detail";
	}
}

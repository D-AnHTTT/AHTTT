package com.laptrinhjavaweb.controller.web;

import java.io.File;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.laptrinhjavaweb.entity.Category;
import com.laptrinhjavaweb.entity.Comment;
import com.laptrinhjavaweb.entity.Post_X;
import com.laptrinhjavaweb.modelAnh.PostModel;
import com.laptrinhjavaweb.service.CategoryService;
import com.laptrinhjavaweb.service.CommentService;
import com.laptrinhjavaweb.service.Post_XService;
import com.laptrinhjavaweb.service.UserService;

@Controller(value = "newFeedControllerOfWeb")
public class NewFeedController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	Post_XService postService;
	@Autowired
	UserService userService;
	@Autowired
	CommentService commentSV;
	Pageable pageable = new PageRequest(0, 2);

	@RequestMapping(value = "/trang-chu/newFeed", method = RequestMethod.GET)
	public String showNewFeed(Model model, HttpSession session) {
		List<Category> listCategory = categoryService.findAll();
		model.addAttribute("listCategory", listCategory);
		Page<Post_X> listPost = postService.findAllByOrderByIdDesc(pageable);
		model.addAttribute("listPost", listPost.getContent());
		model.addAttribute("screenName", "newfeed");
		String username = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");
		if (username == null && password == null) {
			session.setAttribute("username", "");
			session.setAttribute("password", "");
		}
		return "web/new_feed";
	}

	public String replaceContentWithBr(String str) {
		StringBuffer text = new StringBuffer(str);
		int loc = (new String(text)).indexOf('\n');
		while (loc > 0) {
			text.replace(loc, loc + 1, "<BR>");
			loc = (new String(text)).indexOf('\n');
		}
		return text.toString();
	}

	@RequestMapping(value = "/trang-chu/addPost", method = RequestMethod.POST)
	public String addNewFeed(@RequestParam("title") String title,
			@RequestParam("shortDecription") String shortDecription, @RequestParam("content") String content,
			@RequestParam("address") String address, @RequestParam("city") String city,
			@RequestParam("state") String state, @RequestParam("fileThumbnail") MultipartFile fileThumbnail,
			@RequestParam("reviewType") String reviewType,
			@RequestParam(value = "fileInput", required = false) MultipartFile[] fileInput) {
		Post_X post = new Post_X();
		try {
			String day = "" + LocalDate.now();
			String fileThumbnailUrl = fileThumbnail.getOriginalFilename();
			File saveFileThumbnail = new File("/Users/Quang Thinh/Desktop/Tmp/" + fileThumbnailUrl);
			fileThumbnail.transferTo(saveFileThumbnail);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < fileInput.length; i++) {
				String fileUrl = fileInput[i].getOriginalFilename();
				if (!fileUrl.equals("")) {
					File saveFile = new File("/Users/Quang Thinh/Desktop/Tmp/" + fileUrl);
					fileInput[i].transferTo(saveFile);
					sb.append(fileUrl);
					if (i != fileInput.length - 1)
						sb.append("&&");
				}
			}
			post.setTime_post(day);
			post.setImgThumbnail(fileThumbnailUrl);
			post.setImgPost(sb.toString());
		} catch (Exception e) {

		}

		post.setTitle(title);
		post.setContent(replaceContentWithBr(content));
		post.setAddress(address + ", " + city + ", " + state);

		post.setShortDecription(shortDecription);
		post.setCategory_id(categoryService.findByName(reviewType).getId());
		postService.save(post);
		return "redirect:/trang-chu/newFeed";
	}

	@RequestMapping(value = "/trang-chu/showPostDetail", method = RequestMethod.GET)
	public String showPostDetail(@Param("id") long id, Model model) {
		Post_X post = postService.findById(id);
		String categoryName = categoryService.findId(post.getCategory_id()).getName();
		PostModel postModel = new PostModel();
		postModel.setPost(post);
		postModel.setCategoryName(categoryName);
		postModel.setListImgPost();
		List<Comment> listcomment = commentSV.findPost(id);
		model.addAttribute("postDetail", postModel.getPost());
		model.addAttribute("categoryPostName", postModel.getCategoryName());
		model.addAttribute("listImgPost", postModel.getListImgPost());
		model.addAttribute("listcomment", listcomment);
		return "web/post_detail";
	}

	@RequestMapping(value = "/trang-chu/newfeed/nextPage", method = RequestMethod.GET)
	public String nextPage(Model model) {
		pageable = pageable.next();
		Page<Post_X> listPost = postService.findAllByOrderByIdDesc(pageable);
		model.addAttribute("screenName", "newfeed");
		model.addAttribute("listPost", listPost.getContent());
		return "web/new_feed";
	}

	@RequestMapping(value = "/trang-chu/newfeed/previousPage", method = RequestMethod.GET)
	public String previousPage(Model model) {
		pageable = pageable.previousOrFirst();
		Page<Post_X> listPost = postService.findAllByOrderByIdDesc(pageable);
		model.addAttribute("screenName", "newfeed");
		model.addAttribute("listPost", listPost.getContent());
		return "web/new_feed";
	}

	
}

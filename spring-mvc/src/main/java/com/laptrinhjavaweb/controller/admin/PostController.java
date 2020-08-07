package com.laptrinhjavaweb.controller.admin;

import java.io.File;
import java.net.URLDecoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.laptrinhjavaweb.entity.Category;
import com.laptrinhjavaweb.entity.Post;
import com.laptrinhjavaweb.entity.Post_X;
import com.laptrinhjavaweb.service.CategoryService;
import com.laptrinhjavaweb.service.PostService;
import com.laptrinhjavaweb.service.Post_XService;

@Controller
public class PostController {

	@Autowired
	CategoryService categoryService;
	@Autowired
	Post_XService postService;

	@RequestMapping(value = "admin/post")
	public String showUser(Model model) {

		List<Post_X> listpost = postService.findAllPostX();
		model.addAttribute("page", "post");
		
		model.addAttribute("listpost", listpost);
		return "admin/ManagerPost";
	}

	@RequestMapping(value = "admin/addpost")
	public String showAddUser(Model model) {
		String day = "" + LocalDate.now();
		Post post = new Post(day);
		List<Category> listCategory = categoryService.findAll();
		model.addAttribute("post", post);
		model.addAttribute("listCategory", listCategory);
		return "admin/admin_addeditPost";
	}

//	@RequestMapping("admin/savepost")
//	public String savePost(@RequestParam("fileimg") MultipartFile fileimg, @RequestParam("content") String content,
//			@RequestParam("title") String title, @RequestParam("category") int category,
//			@RequestParam("username") String username, @RequestParam("timepost") String timepost) {
//		long userid = postSV.getUser(username).getId();
//		try {
//			String fileName = fileimg.getOriginalFilename();
//			File file = new File("D:\\xaolon\\", fileName);
//			fileimg.transferTo(file);
//			Post post = new Post(title, content, timepost, userid, username, category, fileName);
//			postSV.savePost(post);
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return "redirect:post";
//	}
	@RequestMapping(value = "/admin/savepost", method = RequestMethod.POST)
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
		return "redirect:post";
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

	@RequestMapping(value = "admin/deletePost")
	public String deletePost(@Param("id") long id) {
		postService.delete(id);
		return "redirect:post";

	}
}

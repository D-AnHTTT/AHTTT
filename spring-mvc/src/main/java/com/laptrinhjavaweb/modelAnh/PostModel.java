package com.laptrinhjavaweb.modelAnh;

import java.util.ArrayList;
import java.util.List;

import com.laptrinhjavaweb.entity.Post_X;

public class PostModel {
	Post_X post;
	String categoryName;
	List<String> listImgPost;

	public PostModel() {
		this.listImgPost = new ArrayList<String>();
	}

	public PostModel(Post_X post, String categoryName) {
		super();
		this.post = post;
		this.categoryName = categoryName;
	}

	public List<String> getListImgPost() {
		return listImgPost;
	}

	public Post_X getPost() {
		return post;
	}

	public void setPost(Post_X post) {
		this.post = post;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public void setListImgPost() {
		if (post != null) {
			String s = this.post.getImgPost();
			try {
				String[] sarr = s.split("&&");
				for (String stmp : sarr) {
					this.listImgPost.add(stmp);
				}
			} catch (Exception e) {

			}
		}
	}

}

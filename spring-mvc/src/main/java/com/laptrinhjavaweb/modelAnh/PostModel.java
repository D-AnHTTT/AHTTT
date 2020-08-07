package com.laptrinhjavaweb.modelAnh;

import java.util.ArrayList;
import java.util.List;

import com.laptrinhjavaweb.entity.Comment;
import com.laptrinhjavaweb.entity.Post_X;

public class PostModel {
	Post_X post;
	String categoryName;
	List<String> listImgPost;
	Comment comment;

	public PostModel() {
		this.listImgPost = new ArrayList<String>();
	}

	public PostModel(Post_X post, String categoryName, Comment comment) {
		super();
		this.post = post;
		this.categoryName = categoryName;
		this.comment = comment;
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

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
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

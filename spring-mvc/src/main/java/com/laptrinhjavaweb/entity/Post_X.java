package com.laptrinhjavaweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
@Entity
@Table(name = "Post_X")
public class Post_X {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String title;
	private String content;
	private String shortDecription;
	private String time_post;
	private String address;
	private long user_id;
	private String username;
	private long category_id;
	private String imgPost;
	private String imgThumbnail;
	public Post_X(String title, String content, String time_post, long user_id, String username, long category_id,
			String imgPost,String imgThumbnail) {
		super();
		this.title = title;
		this.content = content;
		this.time_post = time_post;
		this.user_id = user_id;
		this.username = username;
		this.category_id = category_id;
		this.imgPost = imgPost;
		this.imgThumbnail = imgThumbnail;
	}

	
	public Post_X(String time_post, long user_id, String username) {
		super();
		this.time_post = time_post;
		this.user_id = user_id;
		this.username = username;
	}

	public String getShortDecription() {
		return shortDecription;
	}


	public void setShortDecription(String shortDecription) {
		this.shortDecription = shortDecription;
	}

	public List<String> getListHashTag(){
		List<String> listHashTag = new ArrayList<String>();
		String[] strarr = this.shortDecription.split(" ");
		for (String s :strarr) {
			listHashTag.add(s);
		}
		return listHashTag;
	}
	public String getImgThumbnail() {
		return imgThumbnail;
	}


	public void setImgThumbnail(String imgThumbnail) {
		this.imgThumbnail = imgThumbnail;
	}


	public Post_X(String time_post) {
		super();
		this.time_post = time_post;
	}

	public Post_X() {
		super();
	}

	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime_post() {
		return time_post;
	}

	public void setTime_post(String time_post) {
		this.time_post = time_post;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public long getCategory_id() {
		return category_id;
	}

	public void setCategory_id(long category_id) {
		this.category_id = category_id;
	}

	public String getImgPost() {
		return imgPost;
	}

	public void setImgPost(String img) {
		this.imgPost = img;
	}
}

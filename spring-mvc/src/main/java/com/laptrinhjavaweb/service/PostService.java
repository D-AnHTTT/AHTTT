package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.Post;
import com.laptrinhjavaweb.entity.User;
import com.laptrinhjavaweb.repository.PostRepository;
import com.laptrinhjavaweb.repository.UserRepository;

@Service
public class PostService {

	@Autowired
	private PostRepository PostRP;
	@Autowired
	private UserRepository userRP;

	public boolean savePost(Post post) {
		return PostRP.save(post) != null;
	}

	public List<Post> findAll() {
		return PostRP.findAll();
	}

	public Post findId(long id) {
		return PostRP.findOne(id);
	}

	public void delete(long id) {
		PostRP.delete(id);
	}

	public User getUser(String name) {
		return userRP.findByUsername(name);

	}

}

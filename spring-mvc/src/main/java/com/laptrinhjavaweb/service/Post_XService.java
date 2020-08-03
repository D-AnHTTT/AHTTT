package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.Post_X;
import com.laptrinhjavaweb.repository.Post_XRepository;

@Service
public class Post_XService {
	@Autowired
	Post_XRepository postRepo;

	public void save(Post_X post) {
		postRepo.save(post);
	}

	public Page<Post_X> findAll(Pageable pageable) {
		return postRepo.findAll(pageable);
	}

	public Post_X findById(long id) {
		return postRepo.findById(id);
	}

	public List<Post_X> findPostByLimit(int lmt) {
		return postRepo.findPostByLimit(lmt);
	}
	public Page<Post_X> findAllByOrderByIdDesc(Pageable pageable){
		return postRepo.findAllByOrderByIdDesc(pageable);
	}
}

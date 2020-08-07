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

	public List<Post_X> findAllPostX() {
		return postRepo.findAll();
	}

	public Post_X findById(long id) {
		return postRepo.findById(id);
	}

	public void delete(long id) {
		postRepo.delete(id);
	}

	public List<Post_X> findPostByLimit(int lmt) {
		return postRepo.findPostByLimit(lmt);
	}

	public List<Post_X> findPostByTitle(String title) {
		return postRepo.findPostByTitle(title);
	}

	public Page<Post_X> findAllByOrderByIdDesc(Pageable pageable) {
		return postRepo.findAllByOrderByIdDesc(pageable);
	}

	public Page<Post_X> findByTitleContaining(String title,String hashTag,Pageable pageable) {
		return postRepo.findByTitleContaining(title,hashTag,pageable);
	}
}

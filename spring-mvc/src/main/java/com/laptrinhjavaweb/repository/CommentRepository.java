package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhjavaweb.entity.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long> {
	@Query(value = "SELECT * FROM Comment u where u.post_id =:post", nativeQuery = true)
	List<Comment> findPost(@Param("post") long post);

}

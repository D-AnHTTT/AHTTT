package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.Post_X;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface Post_XRepository extends JpaRepository<Post_X, Long> {
	Page<Post_X> findAll(Pageable ageable );
	Page<Post_X> findAllByOrderByIdDesc(Pageable ageable );
	Post_X findById(long id);

	@Query(value = "SELECT * FROM Post_X u limit :lmt", nativeQuery = true)
	List<Post_X> findPostByLimit(@Param("lmt") int lmt);
	/**
	 * @Query("SELECT u FROM User u WHERE u.status = :status and u.name = :name")
	 * User findUserByUserStatusAndUserName(@Param("status") Integer
	 * userStatus, @Param("name") String userName);
	 */
//	select * from springmvcbasic.Post_X p where p.title like '%good%'
	@Query(value = "select p from Post_X p where p.title like %:title%")
	List<Post_X> findPostByTitle(@Param("title") String title);
}

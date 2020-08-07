package com.laptrinhjavaweb.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.laptrinhjavaweb.entity.Rate;

public interface RateRepository extends JpaRepository<Rate, Long> {
	
	@Query(value = "SELECT COUNT(*) FROM Rate u WHERE u.post_id =:post", nativeQuery = true)
	Integer quantity(@Param("post") long post);
	
	@Query(value = "SELECT AVG(u.quantity) FROM Rate u WHERE u.post_id =:post", nativeQuery = true)
	Double avg(@Param("post") long post);

}

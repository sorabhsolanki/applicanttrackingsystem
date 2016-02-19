package com.applicant.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import com.applicant.model.JobPost;

@Repository
public interface JobRepository extends MongoRepository<JobPost, String>{

	@Query("{'status':'New'}")
	public List<JobPost> findAllJobs(Sort sort);
}

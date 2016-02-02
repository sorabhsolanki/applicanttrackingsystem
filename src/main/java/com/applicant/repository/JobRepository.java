package com.applicant.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.applicant.model.JobPost;

@Repository
public interface JobRepository extends MongoRepository<JobPost, String>{

}

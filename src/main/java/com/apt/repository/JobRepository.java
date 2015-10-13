package com.apt.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.apt.model.Jobs;

@Repository
public interface JobRepository extends MongoRepository<Jobs, String>{

}

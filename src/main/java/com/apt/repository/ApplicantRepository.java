package com.apt.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.apt.model.Applicant;

@Repository
public interface ApplicantRepository extends MongoRepository<Applicant, String>{

	Applicant findByName(String name);
	
}

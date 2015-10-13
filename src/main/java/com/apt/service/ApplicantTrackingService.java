package com.apt.service;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.apt.dto.ApplicantDto;
import com.apt.model.Applicant;
import com.apt.model.Jobs;
import com.apt.repository.ApplicantRepository;
import com.apt.repository.JobRepository;

@Service
public class ApplicantTrackingService {

	private static final Logger logger = LoggerFactory.getLogger(ApplicantTrackingService.class);
	
	@Autowired
	ApplicantRepository applicantRepository;
	
	@Autowired
	JobRepository jobRepository;

	public String getDesc() {

		logger.debug("getDesc() is executed!");

		return "Gradle + Spring MVC Hello World Example";

	}

	public List<ApplicantDto> getAllApplicantByName(String name) {
/*
		logger.debug("getTitle() is executed! $name : {}", name);

		if(StringUtils.isEmpty(name)){
			return "Hello World";
		}else{
			return "Hello " + name;
		}*/
		
		List<Applicant> applicants = applicantRepository.findAll();
		List<ApplicantDto> applicantDtos = new ArrayList<>();
		
		try {
			for(Applicant applicant : applicants){
				
				ApplicantDto applicantDto = new ApplicantDto();
				BeanUtils.copyProperties(applicantDto, applicant);
				applicantDtos.add(applicantDto);
			}
			  
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
	return applicantDtos;	
	}
	
	public ApplicantDto getApplicantByName(String name) {
		/*
				logger.debug("getTitle() is executed! $name : {}", name);

				if(StringUtils.isEmpty(name)){
					return "Hello World";
				}else{
					return "Hello " + name;
				}*/
		
		Applicant applicant = applicantRepository.findByName(name);
		ApplicantDto dto = new ApplicantDto();
		try {
			BeanUtils.copyProperties(dto, applicant);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		return dto;
				
	}

	
	public void saveJob(ApplicantDto dto){
		Jobs jobs = new Jobs();
		try {
			BeanUtils.copyProperties(jobs, dto);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		jobRepository.save(jobs);
	}
	
	
	public void saveApplicant(String name) {
		
		logger.debug("getTitle() is executed! $name : {}");
		
		Applicant applicant = new Applicant();
		applicant.setName(name);
		
		applicantRepository.save(applicant);
		
	}

}
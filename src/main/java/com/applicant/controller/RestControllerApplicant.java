package com.applicant.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.applicant.model.JobPost;
import com.applicant.service.JobsResumeStatusService;

@RestController
@RequestMapping("/rest")
public class RestControllerApplicant {

	@Autowired
	JobsResumeStatusService statusService;
	
	@RequestMapping(value = "/getalljobsresumes", method = RequestMethod.GET)
	public String getAllParticipantsDetails() {
		List<JobPost> jobPosts = statusService.searchAllJobPostSortedByTimestamp();
		return statusService.getAllJobPostInTable(jobPosts);
	}
}

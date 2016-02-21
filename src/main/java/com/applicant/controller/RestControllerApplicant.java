package com.applicant.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.applicant.model.JobPost;
import com.applicant.service.JobsResumeStatusService;
import com.applicant.service.LinkedInService;

@RestController
@RequestMapping("/rest")
public class RestControllerApplicant {

	private final Logger LOG = LoggerFactory.getLogger(RestControllerApplicant.class);
	
	@Autowired
	JobsResumeStatusService statusService;
	
	@Autowired
	LinkedInService linkedInService;
	
	@RequestMapping(value = "/getalljobsresumes", method = RequestMethod.GET)
	public String getAllParticipantsDetails() {
		List<JobPost> jobPosts = statusService.searchAllJobPostSortedByTimestamp();
		return statusService.getAllJobPostInTable(jobPosts);
	}
	
	@RequestMapping(value = "/searchlinkedin/{skills}", method = RequestMethod.GET)
	public String getAllProfilesFromLinkedIn(@PathVariable String skills) {
		return linkedInService.getAllJobProfilesInTable(skills);
	}
}

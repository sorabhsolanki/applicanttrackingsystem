package com.applicant.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.applicant.model.JobPost;
import com.applicant.repository.JobRepository;

@Service
public class JobsResumeStatusService {
	
	private final String HEADER = " <table><thead><tr><th>Job Name</th><th>Description</th><th>Status</th></tr></thead>";
	private final String START_TAG = "<tbody>";
	private final String END_TAG = "</tbody>";
	private final String FOOTER = "</table>";
	
	
	@Autowired
	JobRepository jobRepository;

	public List<JobPost> searchAllJobPostSortedByTimestamp(){
		return jobRepository.findAllJobs(new Sort(Sort.Direction.DESC, "timestamp"));
	}
	
	public String getAllJobPostInTable(List<JobPost> jobPosts){
		StringBuilder builder = new StringBuilder(HEADER);
		builder.append(START_TAG);
		int count = 0;
		for(JobPost jobPost : jobPosts){
			builder.append("<tr>");
			builder.append("<td id=request" + count + " >" + jobPost.getJobName() + "</td>");
			builder.append("<td id=custname" + count + " >" + jobPost.getMessage() + "</td>");
			builder.append("<td id=messgae" + count + " >" + jobPost.getStatus() + "</td>");
			builder.append("</tr>");
			count++;
		}
		builder.append(END_TAG);
		builder.append(FOOTER);
		
		return builder.toString(); 
	}
}

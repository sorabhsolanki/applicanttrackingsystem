package com.applicant.model;

import java.util.Date;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "jobpost")
public class JobPost {

	private String jobName;
	private String jobLocation;
	private String message;
	private String openPosition;
	private Date plannedEndDate;
	private String contractType;
	
	public String getJobName() {
		return jobName;
	}
	
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	
	public String getJobLocation() {
		return jobLocation;
	}
	
	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getOpenPosition() {
		return openPosition;
	}
	
	public void setOpenPosition(String openPosition) {
		this.openPosition = openPosition;
	}
	
	public Date getPlannedEndDate() {
		return plannedEndDate;
	}
	
	public void setPlannedEndDate(Date plannedEndDate) {
		this.plannedEndDate = plannedEndDate;
	}
	
	public String getContractType() {
		return contractType;
	}
	
	public void setContractType(String contractType) {
		this.contractType = contractType;
	}
}

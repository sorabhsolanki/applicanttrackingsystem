package com.apt.model;

import java.util.Date;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "jobpost")
public class Jobs {

	private String jobName;

	private String keySkills;

	private String openPos;

	private Date endDate;

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getKeySkills() {
		return keySkills;
	}

	public void setKeySkills(String keySkills) {
		this.keySkills = keySkills;
	}

	public String getOpenPos() {
		return openPos;
	}

	public void setOpenPos(String openPos) {
		this.openPos = openPos;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	

}

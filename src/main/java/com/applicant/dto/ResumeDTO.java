package com.applicant.dto;

import com.mongodb.gridfs.GridFSDBFile;

public class ResumeDTO {
	
	private GridFSDBFile attachment;
	private String candidatename;
	private String candidateEmail;
	
	
	public GridFSDBFile getAttachment() {
		return attachment;
	}
	public void setAttachment(GridFSDBFile attachment) {
		this.attachment = attachment;
	}
	public String getCandidatename() {
		return candidatename;
	}
	public void setCandidatename(String candidatename) {
		this.candidatename = candidatename;
	}
	public String getCandidateEmail() {
		return candidateEmail;
	}
	public void setCandidateEmail(String candidateEmail) {
		this.candidateEmail = candidateEmail;
	}
	
	
}

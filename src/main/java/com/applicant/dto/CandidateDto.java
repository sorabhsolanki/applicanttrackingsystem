package com.applicant.dto;

import org.springframework.web.multipart.MultipartFile;

public class CandidateDto {

	private String candidatename;
	private String candidateEmail;
	private MultipartFile candidateResume;
	
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
	public MultipartFile getCandidateResume() {
		return candidateResume;
	}
	public void setCandidateResume(MultipartFile candidateResume) {
		this.candidateResume = candidateResume;
	}
	
	
}

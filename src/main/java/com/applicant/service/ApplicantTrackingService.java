package com.applicant.service;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.applicant.dao.ResumeStorageDao;
import com.applicant.dto.CandidateDto;
import com.applicant.dto.JobPostDto;
import com.applicant.model.JobPost;
import com.applicant.repository.JobRepository;
import com.applicant.util.CommonHelper;
import com.applicant.util.CurrentStatusEnum;
import com.mongodb.gridfs.GridFSDBFile;

@Service
public class ApplicantTrackingService {
	
	@Autowired
	JobRepository jobRepository;
	
	@Autowired
	ResumeStorageDao resumeStorageDao;
	
	
	public boolean saveJob(JobPostDto jobPostDto){
		JobPost jobPost = new JobPost();
		try {
			BeanUtils.copyProperties(jobPost, jobPostDto);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		jobPost.setStatus(CurrentStatusEnum.NEW.getName());
		try {
			jobPost.setTimestamp(CommonHelper.getTimeStampInDDMMYYYYHHSS());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		jobRepository.save(jobPost);
		return true;
	}
	
	public String searchResume(CandidateDto candidateDto){
		
		String candidateName = candidateDto.getCandidatename();
		GridFSDBFile gridFSDBFile = resumeStorageDao.getByFilename(candidateName+"_resume.docx");
		if(gridFSDBFile.getFilename() != null)
			return gridFSDBFile.getFilename();
		return "";
	}

}

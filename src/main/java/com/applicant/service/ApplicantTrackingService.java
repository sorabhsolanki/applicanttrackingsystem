package com.applicant.service;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.applicant.dao.ResumeStorageDao;
import com.applicant.dto.CandidateDto;
import com.applicant.dto.JobPostDto;
import com.applicant.model.JobPost;
import com.applicant.repository.JobRepository;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
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
		jobRepository.save(jobPost);
		return true;
	}
	
	public boolean uploadResume(CandidateDto candidateDto, MultipartFile candidateResume){
		try {
			InputStream inputStream = candidateResume.getInputStream();
			String contentType=candidateResume.getContentType();
			
			DBObject dbObjectMetaData = new BasicDBObject();
			dbObjectMetaData.put("candidateName", candidateDto.getCandidatename());
			dbObjectMetaData.put("candidateEmail", candidateDto.getCandidateEmail());
			
			resumeStorageDao.store(inputStream, candidateDto.getCandidatename()+"_resume.docx", contentType, dbObjectMetaData);
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public String searchResume(CandidateDto candidateDto){
		
		String candidateName = candidateDto.getCandidatename();
		String candidateEmail = candidateDto.getCandidateEmail();
		GridFSDBFile gridFSDBFile = resumeStorageDao.getByFilename(candidateName+"_resume.docx");
		if(gridFSDBFile.getFilename() != null)
			return gridFSDBFile.getFilename();
		return "";
	}

}

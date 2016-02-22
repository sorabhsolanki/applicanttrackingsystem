package com.applicant.service;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import com.applicant.dao.ResumeStorageDao;
import com.applicant.dto.CandidateDto;
import com.applicant.dto.JobPostDto;
import com.applicant.model.JobPost;
import com.applicant.repository.JobRepository;
import com.applicant.util.CommonHelper;
import com.applicant.util.CurrentStatusEnum;
import com.mongodb.MongoException;
import com.mongodb.gridfs.GridFSDBFile;

@Service
public class ApplicantTrackingService {

	private final Logger LOG = LoggerFactory.getLogger(ApplicantTrackingService.class);
	
	@Autowired
	JobRepository jobRepository;

	@Autowired
	ResumeStorageDao resumeStorageDao;

	public boolean saveJob(JobPostDto jobPostDto) {
		JobPost jobPost = new JobPost();
		try {
			BeanUtils.copyProperties(jobPost, jobPostDto);
			jobPost.setStatus(CurrentStatusEnum.NEW.getName());
			jobPost.setTimestamp(CommonHelper.getTimeStampInDDMMYYYYHHSS());
			jobRepository.save(jobPost);
		} catch (IllegalAccessException | InvocationTargetException	| ParseException | MongoException | DuplicateKeyException e) {
			LOG.error(e.getMessage());
			return false;
		}
		return true;
	}

	public String searchResume(CandidateDto candidateDto) {

		String candidateName = candidateDto.getCandidatename();
		GridFSDBFile gridFSDBFile = resumeStorageDao
				.getByFilename(candidateName + "_resume.docx");
		if (gridFSDBFile.getFilename() != null)
			return gridFSDBFile.getFilename();
		return "";
	}

}

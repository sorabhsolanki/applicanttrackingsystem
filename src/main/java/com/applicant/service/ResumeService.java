package com.applicant.service;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.applicant.dao.ResumeStorageDao;
import com.applicant.dto.CandidateDto;
import com.applicant.dto.ResumeDTO;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.gridfs.GridFSDBFile;

@Service
public class ResumeService {

	@Autowired
	ResumeStorageDao resumeStorageDao;
	
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
	
	public ResumeDTO downloadResume(String candidateName){
		ResumeDTO resumeDTO = new ResumeDTO();
		GridFSDBFile gridFSDBFile = resumeStorageDao.getByFilename(candidateName+"_resume.docx");
		if(gridFSDBFile!= null){
			resumeDTO.setAttachment(gridFSDBFile);
		}
		return resumeDTO;
	}

}

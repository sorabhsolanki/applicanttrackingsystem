package com.applicant.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.applicant.dto.CandidateDto;
import com.applicant.dto.ResumeDTO;
import com.applicant.service.ResumeService;

@Controller
public class ResumeController {
	
	@Autowired
	ResumeService resumeService;
	
	@RequestMapping(value = "/uploadResume", method = RequestMethod.POST)
	public String postJob(ModelMap modelMap, CandidateDto candidateDto, @ModelAttribute(value = "candidateResume") MultipartFile candidateResume){
		boolean result = false;
		result = resumeService.uploadResume(candidateDto, candidateResume);
		if(result){
			modelMap.put("successMsg", "Candidate " + candidateDto.getCandidatename() + " details has been uploaded successfully.");
		}
		return "resume";	
    }

	@RequestMapping(value = "/getFileByName/{candidateName}", method = RequestMethod.GET)
	public @ResponseBody void download(@PathVariable String candidateName, HttpServletRequest request, HttpServletResponse response) throws IOException {
		ResumeDTO resumeDto = resumeService.downloadResume(candidateName);
	    if (resumeDto.getAttachment() != null) {
	    	
	        try {
	            response.setContentType(resumeDto.getAttachment().getContentType());
	            response.setContentLength((new Long(resumeDto.getAttachment().getLength()).intValue()));
	            response.setHeader("content-Disposition", "attachment; filename=" + resumeDto.getAttachment().getFilename());// "attachment;filename=test.xls"
	            // copy it to response's OutputStream
	            IOUtils.copyLarge(resumeDto.getAttachment().getInputStream(), response.getOutputStream());
	        } catch (IOException ex) {
	            throw new RuntimeException("IOError writing file to output stream");
	        }
	    }
	}
}

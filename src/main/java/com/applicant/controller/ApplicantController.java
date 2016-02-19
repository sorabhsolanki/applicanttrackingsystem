package com.applicant.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.applicant.dto.CandidateDto;
import com.applicant.dto.JobPostDto;
import com.applicant.service.ApplicantTrackingService;

@Controller
public class ApplicantController {
	
	@Autowired
	ApplicantTrackingService applicantTrackingService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String startTrackingSystem(ModelMap model){
		return "index";
	}
	
	@RequestMapping(value = "/jobpost", method = RequestMethod.GET)
	public String jobPost(ModelMap model){
		model.put("jobPostDto", new JobPostDto());
		return "jobpost";
	}
	
	@RequestMapping(value = "/resume", method = RequestMethod.GET)
	public String uploadDownloadResume(ModelMap model){
		model.put("candidateDto", new CandidateDto());
		return "resume";
	}
	
	@RequestMapping(value = "/interview", method = RequestMethod.GET)
	public String scheduleAnInterview(ModelMap model){
		model.put("candidateDto", new CandidateDto());
		return "scheduleinterview";
	}
	
	@RequestMapping(value = "/visuallymanage", method = RequestMethod.GET)
	public String visuallyManagement(ModelMap model){
		return "visuallymanage";
	}
	
	@RequestMapping(value = "/postJob", method = RequestMethod.POST)
	public String postJob(ModelMap modelMap, JobPostDto jobPostDto){
		boolean result = false;
		if (jobPostDto.getJobName() != null && jobPostDto.getJobName().trim() != "") {
			result = applicantTrackingService.saveJob(jobPostDto);
		}
		if(result){
			modelMap.put("message", "JobName " + jobPostDto.getJobName() + "has been successfully posted");
		}else{
			modelMap.put("message", "There is some problem during posting of job!");
		}
		return "jobpost";	
    }
	
	@RequestMapping(value = "/searchResume", method = RequestMethod.POST)
	public String searchResume(ModelMap modelMap, CandidateDto candidateDto){
		String resume = applicantTrackingService.searchResume(candidateDto);
		modelMap.put("searchResume", resume);
		modelMap.put("candidateName", candidateDto.getCandidatename());
		return "scheduleinterview";
    }
	
	
	@ModelAttribute("contractTypes")
	public Map<String, String> populateContractTypes(){
		Map<String, String> contractTypes = new LinkedHashMap<>();
		contractTypes.put("Internship", "Internship");
		contractTypes.put("Full Time", "FullTime");
		contractTypes.put("Working Remotely", "WorkingRemotely");
		contractTypes.put("Part Time", "PartTime");
		return contractTypes;
	}
}
package com.apt.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.apt.dto.ApplicantDto;
import com.apt.service.ApplicantTrackingService;

@Controller
public class WelcomeController {

	private final Logger logger = LoggerFactory.getLogger(WelcomeController.class);
	private final ApplicantTrackingService helloWorldService;

	@Autowired
	public WelcomeController(ApplicantTrackingService helloWorldService) {
		this.helloWorldService = helloWorldService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(ModelMap model) {

		/*logger.debug("index() is executed!");

		model.put("title", helloWorldService.getTitle(""));
		model.put("msg", helloWorldService.getDesc());*/
		
		
		//helloWorldService.saveApplicant("sorabh");
		
		model.put("applicantDto", new ApplicantDto());
		
		return "index";
	}
	
	@RequestMapping(value = "/getApplicants", method = RequestMethod.POST)
	public String getApplicant(ModelMap model, ApplicantDto applicantDto) {

		
		if(applicantDto.getJobName() != null && applicantDto.getJobName().trim() != ""){
			helloWorldService.saveJob(applicantDto);
			return "index";
		}
		
		
		/*logger.debug("index() is executed!");

		model.put("title", helloWorldService.getTitle(""));
		model.put("msg", helloWorldService.getDesc());*/
		
		List<ApplicantDto> applicantDtos = helloWorldService.getAllApplicantByName(applicantDto.getName());
		model.put("list", applicantDtos);
		
		return "index";
	}

	@RequestMapping(value = "/hello/{name:.+}", method = RequestMethod.GET)
	public String hello(@PathVariable("name") String name, ModelMap model) {
		
		logger.debug("hello() is executed - $name {}", name);
		/*ModelAndView model = new ModelAndView();
		model.setViewName("index");*/
		
		/*model.addObject("title", helloWorldService.getTitle(name));
		model.addObject("msg", helloWorldService.getDesc());*/
		
		ApplicantDto applicantDto = helloWorldService.getApplicantByName(name);
		model.addAttribute("projectName", applicantDto.getName());
		model.put("applicantDto", new ApplicantDto());
		
		return "index";

	}

}
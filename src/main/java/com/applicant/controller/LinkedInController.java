package com.applicant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.applicant.model.LinkedIn;

@Controller
public class LinkedInController {


	@RequestMapping(value = "/linkedin", method = RequestMethod.GET)
	public String linkedInSearch(ModelMap model){
		LinkedIn linkedInDto = new LinkedIn();
		model.put("linkedInDto", linkedInDto);
		return "linkedinsearch";
	}
}

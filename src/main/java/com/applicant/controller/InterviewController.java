package com.applicant.controller;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.applicant.dto.InterviewInviteDto;
import com.applicant.service.InterviewService;

@Controller
public class InterviewController {

	@Autowired
	InterviewService interviewService;
	
	/*@RequestMapping(value = "/scheduleInterview/{candidateName}", method = RequestMethod.GET)
	public String scheduleInterview(@PathVariable String candidateName, HttpServletRequest request, HttpServletResponse response) {
				// Initilize values
				String calFile = "/home/sorabh/TestCalendar.ics";

				// start time
				java.util.Calendar startCal = java.util.Calendar.getInstance();
				startCal.set(2016, 02, 8, 20, 00);

				// end time
				java.util.Calendar endCal = java.util.Calendar.getInstance();
				endCal.set(2016, 02, 8, 20, 30);

				String subject = "Meeting Subject";
				String location = "Location - Gurgaon";
				String description = "This goes in decription section of the metting like agenda etc.";

				String hostEmail = "sorabhs2009.gmail.com";

				// Creating a new calendar
				net.fortuna.ical4j.model.Calendar calendar = new net.fortuna.ical4j.model.Calendar();
				calendar.getProperties().add(new ProdId("-//Ben Fortuna//iCal4j 1.0//EN"));
				calendar.getProperties().add(Version.VERSION_2_0);
				calendar.getProperties().add(CalScale.GREGORIAN);

				SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd'T'hhmmss'Z'");
				String strDate = sdFormat.format(startCal.getTime());

				net.fortuna.ical4j.model.Date startDt = null;
				try {
					startDt = new net.fortuna.ical4j.model.Date(strDate,"yyyyMMdd'T'hhmmss'Z'");
				} catch (ParseException e) {
					e.printStackTrace();
				}

				long diff = endCal.getTimeInMillis() - startCal.getTimeInMillis();
				int min = (int) (diff / (1000 * 60));

				Dur dur = new Dur(0, 0, min, 0);

				// Creating a meeting event
				VEvent meeting = new VEvent(startDt, dur, subject);

				meeting.getProperties().add(new Location(location));
				meeting.getProperties().add(new Description());

				try {
					meeting.getProperties().getProperty(Property.DESCRIPTION).setValue(description);
				} catch (IOException e) {
					e.printStackTrace();
				} catch (URISyntaxException e) {
					e.printStackTrace();
				} catch (ParseException e) {
					e.printStackTrace();
				}

				try {
					meeting.getProperties().add(new Organizer("MAILTO:" + hostEmail));
				} catch (URISyntaxException e) {
					e.printStackTrace();
				}

				calendar.getComponents().add(meeting);

				FileOutputStream fout = null;

				try {
					fout = new FileOutputStream(calFile);
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				}

				CalendarOutputter outputter = new CalendarOutputter();
				outputter.setValidating(false);

				try {
					outputter.output(calendar, fout);
				} catch (IOException e) {
					e.printStackTrace();
				} catch (ValidationException e) {
					e.printStackTrace();
				}
		        interviewService.sendMailToCandidate(interviewDto);
				return "success";
	}*/
	
	@RequestMapping(value = "/scheduleInterview", method = RequestMethod.POST)
	public String scheduleInterview(ModelMap map) {
		InterviewInviteDto interviewInviteDto = new InterviewInviteDto();
		map.put("interviewInviteDto", interviewInviteDto);
		return "calendarinvitation";
	}
	
	@RequestMapping(value = "/calendarinvite", method = RequestMethod.POST)
	public String calendarInvite(ModelMap map, InterviewInviteDto interviewInviteDto) {
		interviewService.sendCalendarInvite(interviewInviteDto);
		map.put("message", "Calendar Invitation has been sent successfully.");
		return "calendarinvitation";
	}
	
	@ModelAttribute("options")
	public Map<String, String> populateOptions(){
		Map<String, String> options = new LinkedHashMap<>();
		options.put("Outlook", "Outlook");
		options.put("Gmail", "Gmail");
		return options;
	}

}

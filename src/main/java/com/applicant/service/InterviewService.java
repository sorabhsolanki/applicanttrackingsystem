package com.applicant.service;

import java.io.IOException;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.applicant.dto.InterviewInviteDto;

@Service
public class InterviewService {
	
	private final Logger LOG = LoggerFactory.getLogger(InterviewService.class);

	public void sendCalendarInvite(InterviewInviteDto interviewDto) {
		
		String to = interviewDto.getTo();
		String from = interviewDto.getFrom();
		final String username = interviewDto.getUserName();
		final String password = interviewDto.getPassword();

		String host = "smtp.gmail.com";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		// Get the Session object.
		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				});

		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);
			message.addHeaderLine("method=REQUEST");
			message.addHeaderLine("charset=UTF-8");
			message.addHeaderLine("component=VEVENT");
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(
					to));
			message.setSubject("Blocking your calendar for interview");

			StringBuffer sb = null;
			if(interviewDto.getOption().equals("Outlook")){
				sb = createGmailInvitation();
			}else{
				sb = createOutlookInvitattion();
			}
			// Create the message part
			BodyPart messageBodyPart = new MimeBodyPart();
			// Fill the message
			messageBodyPart.setHeader("Content-Class",
					"urn:content-  classes:calendarmessage");
			messageBodyPart.setHeader("Content-ID", "calendar_message");
			messageBodyPart.setDataHandler(new DataHandler(new ByteArrayDataSource(sb.toString(), "text/calendar")));// very important
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);
			message.setContent(multipart);
			
			Transport.send(message);
			LOG.info("Invitation sent successfully");

		} catch (MessagingException | IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	private StringBuffer createGmailInvitation(){
		StringBuffer sb = new StringBuffer()	
		.append("BEGIN:VCALENDAR\n"
				+ "METHOD:REQUEST\n"
				+ "PRODID: BCP - Meeting\n"
				+ "VERSION:2.0\n"
				+ "BEGIN:VEVENT\n"
				+ "DTSTART:20160218T053000Z\n"
				+ "DTEND:20160218T190000Z\n"
				+ "SUMMARY:test request\n"
				+ "UID:324\n"
				+ "ATTENDEE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TRUE:MAILTO:sorabhs2009@gmail.com\n"
				+ "ORGANIZER:MAILTO:sorabhs2009@gmail.com\n"
				+ "LOCATION:on the net\n"
				+ "DESCRIPTION:learn some stuff\n" + "SEQUENCE:0\n"
				+ "PRIORITY:5\n" + "CLASS:PUBLIC\n"
				+ "STATUS:CONFIRMED\n" + "TRANSP:OPAQUE\n"
				+ "BEGIN:VALARM\n" + "ACTION:DISPLAY\n"
				+ "DESCRIPTION:REMINDER\n"
				+ "TRIGGER;RELATED=START:-PT00H15M00S\n"
				+ "END:VALARM\n" + "END:VEVENT\n" + "END:VCALENDAR");
		return sb;
	}
	
	private StringBuffer createOutlookInvitattion(){
		StringBuffer buffer = new StringBuffer().append("BEGIN:VCALENDAR\n" +
        "PRODID:-//Microsoft Corporation//Outlook 9.0 MIMEDIR//EN\n" +
        "VERSION:2.0\n" +
        "METHOD:REQUEST\n" +
        "BEGIN:VEVENT\n" +
        "ATTENDEE;ROLE=REQ-PARTICIPANT;RSVP=TRUE:MAILTO:sorabh.solanki@nagarro.com\n" +
        "ORGANIZER:MAILTO:sorabh.solanki@nagarro.com\n" +
        "DTSTART:20051208T053000Z\n" +
        "DTEND:20051208T060000Z\n" +
        "LOCATION:Conference room\n" +
        "TRANSP:OPAQUE\n" +
        "SEQUENCE:0\n" +
        "UID:040000008200E00074C5B7101A82E00800000000002FF466CE3AC5010000000000000000100\n" +
        " 000004377FE5C37984842BF9440448399EB02\n" +
        "DTSTAMP:20051206T120102Z\n" +
        "CATEGORIES:Meeting\n" +
        "DESCRIPTION:This the description of the meeting.\n\n" +
        "SUMMARY:Test meeting request\n" +
        "PRIORITY:5\n" +
        "CLASS:PUBLIC\n" +
        "BEGIN:VALARM\n" +
        "TRIGGER:PT1440M\n" +
        "ACTION:DISPLAY\n" +
        "DESCRIPTION:Reminder\n" +
        "END:VALARM\n" +
        "END:VEVENT\n" +
        "END:VCALENDAR");
		
		return buffer;
	}
}

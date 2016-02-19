package com.applicant.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonHelper {
	
	private static final String PATTERN = "yyyy-MM-dd HH:mm:ss";
	
	public static Date getTimeStampInDDMMYYYYHHSS() throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(PATTERN);
        String newDateFormat = simpleDateFormat.format(new Date());
        return simpleDateFormat.parse(newDateFormat);
	}
}

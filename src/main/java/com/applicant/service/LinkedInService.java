package com.applicant.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.applicant.util.DataObject;
import com.google.gson.Gson;

@Service
public class LinkedInService {

	private final String HEADER = " <table><thead><tr><th>Candidate Name</th><th>Title</th><th>Photo</th></tr></thead>";
	private final String START_TAG = "<tbody>";
	private final String END_TAG = "</tbody>";
	private final String FOOTER = "</table>";
	private final List<DataObject> objects = new ArrayList<>();
	private final int MAX_COUNT = 10;
	
	public String getAllJobProfilesInTable(String skills){
		String keyword = makeKeyword(skills);
		StringBuilder builder = new StringBuilder(HEADER);
		builder.append(START_TAG);
		try {
			makeJson();
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		for(DataObject object : objects){
			builder.append("<tr>");
			builder.append("<td>" + object.getFn() + "</td>");
			builder.append("<td>" + object.getTitle() + "</td>");
			builder.append("<td><img src=\""+ object.getPhoto() +"\" alt=\"Smiley face\" height=\"42\" width=\"42\"/></td>");
			builder.append("</tr>");
		}
		
		builder.append(END_TAG);
		builder.append(FOOTER);
		return builder.toString();
	}
	
	private String makeKeyword(String skills) {
		
		return null;
	}

	private void makeJson() throws IOException{
		String keyword = "java%2C%20php%2C%20golang";
		StringBuffer urlString = new StringBuffer("https://www.googleapis.com/customsearch/v1element?key=AIzaSyCVAXiUzRYsML1Pv6RwSG1gunmMikTzQqY")
							.append("&rsz=filtered_cse&num=10&hl=en&prettyPrint=false&source=gcsc&gss=.com")
							.append("&sig=432dd570d1a386253361f581254f9ca1&cx=011658049436509675749:mpshzk7cxw8&q=")
							.append(keyword).append("&sort=")
							.append("&googlehost=www.google.com&oq=java%2C%20php%2C%20golang&gs_l=partner.12...0.0.2.45713.0.0.0.0.0.0.0.0..0.0.gsnos%2Cn%3D13...0.40315j1279514737j3..1ac..25.partner..16.3.284.F5yJ7hm9yC8&")
							.append("callback=google.search.Search.apiary2326&nocache=1453126768106");
		URL url = new URL(urlString.toString());
		
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(url.openStream()));
		String str;
		StringBuffer buffer = new StringBuffer();
		while(null != (str = bufferedReader.readLine())){
			buffer.append(str);
		}
		int count = 0;
		makeDataObject(buffer.toString() , count);
	}
	
	private void makeDataObject(String initailString, int count){
		int hcardIndex = 0;
		StringBuffer completeJsonString = new StringBuffer();
		if((hcardIndex = initailString.indexOf("hcard\":")) != -1){
			String hcardString  = initailString.substring(hcardIndex + 7);
			int startCurlyIndex = hcardString.indexOf("}");
			String jsonString  = hcardString.substring(0, startCurlyIndex);
			completeJsonString.append(jsonString).append("}");
			makeJsonObject(completeJsonString.toString());
			completeJsonString.setLength(0);
			
			count ++;
			if(count >= MAX_COUNT)
				return;
			makeDataObject(hcardString.substring(startCurlyIndex), count);
			
		}
	}
	
	private void makeJsonObject(String jsonString) {
		Gson gson = new Gson();
		objects.add(gson.fromJson(jsonString, DataObject.class));
	}
}

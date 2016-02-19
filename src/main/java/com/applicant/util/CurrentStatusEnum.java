package com.applicant.util;

public enum CurrentStatusEnum {

	NEW("New"), IN_PROGRESS("InProgress"), DONE("Completed");
	
	private String name;
	
	private CurrentStatusEnum(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}

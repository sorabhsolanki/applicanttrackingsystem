package com.applicant.util;

public class DataObject {

	private String fn;
	private String title;
	private String photo;
	
	public String getFn() {
		return fn;
	}
	public void setFn(String fn) {
		this.fn = fn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "DataObject [fn=" + fn + ", title=" + title + ", photo=" + photo
				+ "]";
	}
	
}

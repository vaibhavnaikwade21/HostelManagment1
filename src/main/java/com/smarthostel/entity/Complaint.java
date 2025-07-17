package com.smarthostel.entity;

public class Complaint {
	private int complaintId;
    private String studentName;
    private String description;
    private String status;
    private String createdAt;
	public int getComplaintId() {
		return complaintId;
	}
	public void setComplaintId(int complaintId) {
		this.complaintId = complaintId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public Complaint(int complaintId, String studentName, String description, String status, String createdAt) {
		super();
		this.complaintId = complaintId;
		this.studentName = studentName;
		this.description = description;
		this.status = status;
		this.createdAt = createdAt;
	}
	public Complaint() {
		super();
		// TODO Auto-generated constructor stub
	}
    
}

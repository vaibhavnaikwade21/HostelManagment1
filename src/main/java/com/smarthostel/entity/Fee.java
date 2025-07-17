package com.smarthostel.entity;

public class Fee {
    private int feeId;
    private int studentId;
    private double totalFee;
    private double paidAmount;
    private String status;
	public int getFeeId() {
		return feeId;
	}
	public void setFeeId(int feeId) {
		this.feeId = feeId;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public double getTotalFee() {
		return totalFee;
	}
	public void setTotalFee(double totalFee) {
		this.totalFee = totalFee;
	}
	public double getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(double paidAmount) {
		this.paidAmount = paidAmount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Fee(int feeId, int studentId, double totalFee, double paidAmount, String status) {
		super();
		this.feeId = feeId;
		this.studentId = studentId;
		this.totalFee = totalFee;
		this.paidAmount = paidAmount;
		this.status = status;
	}
	public Fee() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
    

    // Getters and Setters
}

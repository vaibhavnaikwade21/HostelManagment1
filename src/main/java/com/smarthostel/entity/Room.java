package com.smarthostel.entity;

public class Room {
    private int roomId;
    private String roomNumber;
    private int capacity;
    private String status; // "available" or "occupied"
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Room(int roomId, String roomNumber, int capacity, String status) {
		super();
		this.roomId = roomId;
		this.roomNumber = roomNumber;
		this.capacity = capacity;
		this.status = status;
	}
	public Room() {
		super();
		// TODO Auto-generated constructor stub
	}

    
    
}


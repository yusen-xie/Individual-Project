package com.bean;

import java.io.Serializable;
import java.util.*;

public class Hall implements Serializable {
	private int id;
	private String name;
	private Integer seatno;
	private String delstatus;
	private String status;
	
	private List<Changci> cclist;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSeatno() {
		return seatno;
	}
	public void setSeatno(Integer seatno) {
		this.seatno = seatno;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<Changci> getCclist() {
		return cclist;
	}
	public void setCclist(List<Changci> cclist) {
		this.cclist = cclist;
	}

	
	
	
}

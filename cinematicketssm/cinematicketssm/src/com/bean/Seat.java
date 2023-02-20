package com.bean;

import java.io.Serializable;
import java.util.*;

public class Seat implements Serializable {
	private int id;
	private String seatno;
	private String iszy;
	private String movieid;
	private String changciid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSeatno() {
		return seatno;
	}
	public void setSeatno(String seatno) {
		this.seatno = seatno;
	}
	public String getIszy() {
		return iszy;
	}
	public void setIszy(String iszy) {
		this.iszy = iszy;
	}
	public String getMovieid() {
		return movieid;
	}
	public void setMovieid(String movieid) {
		this.movieid = movieid;
	}
	public String getChangciid() {
		return changciid;
	}
	public void setChangciid(String changciid) {
		this.changciid = changciid;
	}
	

	
	
	
}

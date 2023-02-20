package com.bean;

import java.io.Serializable;
import java.util.*;

public class Changci implements Serializable {
	private int id;
	private String hallid;
	private String movieid;
	private String savetime;
	private String delstatus;
	
	private int salenum;
	
	private Hall hall;
	private Integer yp;
	
	private List<Seat> seatlist;
	
	private Movie movie;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHallid() {
		return hallid;
	}
	public void setHallid(String hallid) {
		this.hallid = hallid;
	}
	public String getMovieid() {
		return movieid;
	}
	public void setMovieid(String movieid) {
		this.movieid = movieid;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public List<Seat> getSeatlist() {
		return seatlist;
	}
	public void setSeatlist(List<Seat> seatlist) {
		this.seatlist = seatlist;
	}
	public Hall getHall() {
		return hall;
	}
	public void setHall(Hall hall) {
		this.hall = hall;
	}
	public Integer getYp() {
		return yp;
	}
	public void setYp(Integer yp) {
		this.yp = yp;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	public int getSalenum() {
		return salenum;
	}
	public void setSalenum(int salenum) {
		this.salenum = salenum;
	}

	
	
	
}

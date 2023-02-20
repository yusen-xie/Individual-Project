package com.bean;

import java.io.Serializable;
import java.util.*;

public class Dingdan implements Serializable {
	private int id;
	private String ddno;
	private String memberid;
	private String movieid;
	private Integer num;
	private String seatstr;
	private double price;
	private String fkstatus;
	private String savetime;
	private String changciid;
	private String productinfo;
	private String ma;
	
	private Member member;
	private Movie movie;
	private Seat seat;
	private Changci changci;
	
	
	
	public String getMa() {
		return ma;
	}
	public void setMa(String ma) {
		this.ma = ma;
	}
	public String getProductinfo() {
		return productinfo;
	}
	public void setProductinfo(String productinfo) {
		this.productinfo = productinfo;
	}
	public String getDdno() {
		return ddno;
	}
	public void setDdno(String ddno) {
		this.ddno = ddno;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getMovieid() {
		return movieid;
	}
	public void setMovieid(String movieid) {
		this.movieid = movieid;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	
	public String getSeatstr() {
		return seatstr;
	}
	public void setSeatstr(String seatstr) {
		this.seatstr = seatstr;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getFkstatus() {
		return fkstatus;
	}
	public void setFkstatus(String fkstatus) {
		this.fkstatus = fkstatus;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public String getChangciid() {
		return changciid;
	}
	public void setChangciid(String changciid) {
		this.changciid = changciid;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public Seat getSeat() {
		return seat;
	}
	public void setSeat(Seat seat) {
		this.seat = seat;
	}
	public Changci getChangci() {
		return changci;
	}
	public void setChangci(Changci changci) {
		this.changci = changci;
	}
	

	
	
}

package com.bean;

import java.io.Serializable;
import java.util.*;

public class Movie implements Serializable {
	private int id;
	private String name;
	private String categoryid;
	private String filename;
	private String zystr;
	private String content;
	private String savetime;
	private double score;
	private double price;
	private String issy;
	private String isbf;
	private String delstatus;
	private String hallid;
	private String longtime;
	
	private Integer cid;
	private double jf;
	
	private Category category;
	private List<Changci> cclist;
	private Hall hall;

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

	public String getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(String categoryid) {
		this.categoryid = categoryid;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getZystr() {
		return zystr;
	}

	public void setZystr(String zystr) {
		this.zystr = zystr;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSavetime() {
		return savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getDelstatus() {
		return delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getIssy() {
		return issy;
	}

	public void setIssy(String issy) {
		this.issy = issy;
	}

	public String getIsbf() {
		return isbf;
	}

	public void setIsbf(String isbf) {
		this.isbf = isbf;
	}

	public String getHallid() {
		return hallid;
	}

	public void setHallid(String hallid) {
		this.hallid = hallid;
	}

	public Hall getHall() {
		return hall;
	}

	public void setHall(Hall hall) {
		this.hall = hall;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public List<Changci> getCclist() {
		return cclist;
	}

	public void setCclist(List<Changci> cclist) {
		this.cclist = cclist;
	}

	public double getJf() {
		return jf;
	}

	public void setJf(double jf) {
		this.jf = jf;
	}

	public String getLongtime() {
		return longtime;
	}

	public void setLongtime(String longtime) {
		this.longtime = longtime;
	}

	
	
	
	
}

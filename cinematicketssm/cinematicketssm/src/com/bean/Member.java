package com.bean;

import java.io.Serializable;
import java.util.*;

public class Member implements Serializable {
	private int id;
	
	private String filename;
	private String uname;
	private String upass;
	private String tname;
	private String sex;
	private String tel;
	private String email;
	private String delstatus;
	private String shstatus;
	private double yue;
	private String utype;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getShstatus() {
		return shstatus;
	}
	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
	}
	public double getYue() {
		return yue;
	}
	public void setYue(double yue) {
		this.yue = yue;
	}
	public String getUtype() {
		return utype;
	}
	public void setUtype(String utype) {
		this.utype = utype;
	}

	
	
	
}

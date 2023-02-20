package com.controller;

import javax.annotation.Resource;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.bean.Dingdan;
import com.bean.Movie;
import com.bean.Member;

import com.bean.Pinlun;
import com.bean.User;


import com.dao.DingdanDAO;
import com.dao.MovieDAO;
import com.dao.MemberDAO;
import com.dao.PinlunDAO;
import com.dao.UserDAO;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.util.Info;

import java.util.*;

@Controller
public class PinlunController extends BaseController {
	@Resource
	MemberDAO memberDAO;
	@Resource
	PinlunDAO pinlunDAO;
	@Resource
	MovieDAO movieDAO;
	@Resource
	DingdanDAO dingdanDAO;
	
	
	
	
	
	@RequestMapping("pinlunAdd")
	public String pinlunAdd(Pinlun pinlun, HttpServletRequest request){
		Member member  = (Member)request.getSession().getAttribute("sessionmember");
		HashMap map = new HashMap();
		map.put("memberid", member.getId());
		map.put("movieid", pinlun.getMovieid());
		List<Dingdan> dingdanlist = dingdanDAO.selectAll(map);
		if(dingdanlist.size()!=0){
		List<Pinlun> list = pinlunDAO.selectAll(map);
		if(list.size()==0){
		pinlun.setMemberid(String.valueOf(member.getId()));
		pinlun.setSavetime(Info.getDateStr());
		pinlunDAO.add(pinlun);
		double jf = 0.0;
		Movie movie = movieDAO.findById(Integer.parseInt(pinlun.getMovieid()));
		if(movie.getScore()>0){
			double total  = movie.getScore()+pinlun.getScore();
			jf = total/2;
		}else{
			jf = pinlun.getScore();
		}
		movie.setScore(jf);
		movieDAO.update(movie);
		
		return "redirect:movieDetails.do?id="+pinlun.getMovieid();
		}else{
		return "redirect:movieDetails.do?id="+pinlun.getMovieid()+"&msg=yp";	
		}
		}else{
		return "redirect:movieDetails.do?id="+pinlun.getMovieid()+"&msg=wgm";
		}
	}
	
	
	
	
	@RequestMapping("admin/pinlunList")
	public String studentList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		String key = request.getParameter("key");
		PageHelper.startPage(pageNum,10);
		HashMap map = new HashMap();
		map.put("key", key);
		List<Pinlun> list = pinlunDAO.selectAll(map);
		for(Pinlun pinlun:list){
			Member member = memberDAO.findById(Integer.parseInt(pinlun.getMemberid()));
			Movie movie = movieDAO.findById(Integer.parseInt(pinlun.getMovieid()));
			pinlun.setMember(member);
			pinlun.setMovie(movie);
		}
	   	PageInfo<Pinlun> pageInfo = new PageInfo<Pinlun>(list);
		request.setAttribute("key", key);
		request.setAttribute("pageInfo", pageInfo);
		return "admin/pinlunlist";
	}
	
	
	@RequestMapping("admin/pinlunDelAll")
	public String teacherDelAll(HttpServletRequest request,HttpServletResponse response){
		String vals = request.getParameter("vals");
		String[] val = vals.split(",");
		for(int i=0;i<val.length;i++){
			pinlunDAO.delete(Integer.parseInt(val[i]));
		}
		return "redirect:pinlunList.do";
	}
	
	
	
	

}

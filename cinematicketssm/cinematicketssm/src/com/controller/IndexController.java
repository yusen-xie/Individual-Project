package com.controller;

import javax.annotation.Resource;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.*;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




import com.bean.Category;
import com.bean.Imgadv;
import com.bean.Movie;
import com.bean.Member;

import com.bean.Pinlun;
import com.bean.User;

import com.dao.CategoryDAO;
import com.dao.ImgadvDAO;
import com.dao.MovieDAO;

import com.dao.UserDAO;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import com.util.Info;
import com.util.Saveobject;

import java.util.*;

@Controller
public class IndexController extends BaseController {
	@Resource
	Saveobject saveobject;
	@Resource
	ImgadvDAO imgadvDAO;
	@Resource
	MovieDAO movieDAO;
	
	
	
	//后台影片列表
	@RequestMapping("index")
	public String banjiList(HttpServletRequest request) {
		saveobject.getCategoryObject(request);
		List<Imgadv> imglist = imgadvDAO.selectAll();
		request.setAttribute("imglist", imglist);
		
		HashMap map = new HashMap();
		map.put("issy", "正在热映");
		List<Movie> hotlist = movieDAO.selectAll(map);
		for(Movie movie:hotlist){
		 double jf = saveobject.getAverageScore(movie.getId(), request);
		 movie.setJf(jf);
		}
		map.put("issy", "即将上映");
		List<Movie> laterlist = movieDAO.selectAll(map);
		for(Movie mmm:laterlist){
			 double jf = saveobject.getAverageScore(mmm.getId(), request);
			 mmm.setJf(jf);
		}
		request.setAttribute("hotlist", hotlist);
		request.setAttribute("laterlist", laterlist);
		return "index";
	}
	
	//登录
	@RequestMapping("skipLogin")
	public String skipLogin(HttpServletRequest request) {
		saveobject.getCategoryObject(request);
		String suc = request.getParameter("suc")==null?"":request.getParameter("suc");
		if(!suc.equals("")){
		request.setAttribute("suc", "用户名或密码错误");
		}
		return "login";
	}
	
	//注册
	@RequestMapping("skipRegister")
	public String skipRegister(HttpServletRequest request) {
		saveobject.getCategoryObject(request);
		return "register";
	}
	
	
	
}

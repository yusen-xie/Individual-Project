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
import org.springframework.web.bind.annotation.RequestParam;


import com.bean.Category;
import com.bean.Changci;
import com.bean.Hall;
import com.bean.Movie;
import com.bean.Member;
import com.bean.Pinlun;
import com.bean.Seat;
import com.bean.User;


import com.dao.CategoryDAO;
import com.dao.ChangciDAO;
import com.dao.HallDAO;
import com.dao.MovieDAO;
import com.dao.MemberDAO;
import com.dao.PinlunDAO;
import com.dao.SeatDAO;
import com.dao.UserDAO;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.util.Info;
import com.util.Saveobject;

import java.util.*;

@Controller
public class MovieController extends BaseController {
	@Resource
	MovieDAO movieDAO;
	@Resource
	CategoryDAO categoryDAO;
	@Resource
	PinlunDAO pinlunDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	HallDAO hallDAO;
	@Resource
	Saveobject saveobject;
	@Resource
	ChangciDAO changciDAO;
	@Resource
	SeatDAO seatDAO;
	
	
	
	
	//影片详情
	@RequestMapping("movieDetails")
	public String movieDetails(int id,HttpServletRequest request){
		String msg = request.getParameter("msg")==null?"":request.getParameter("msg");
		Movie movie = movieDAO.findById(id);
		Category category = categoryDAO.findById(Integer.parseInt(movie.getCategoryid()));
		movie.setCategory(category);
		request.setAttribute("movie", movie);
		saveobject.getCategoryObject(request);
		
		//场次
		HashMap map = new HashMap();
		map.put("movieid", movie.getId());
		List<Changci> cclist = changciDAO.selectAll(map);
		for(Changci changci:cclist){
			HashMap mmm = new HashMap();
			mmm.put("changciid", changci.getId());
			mmm.put("iszy","no");
			List<Seat> seatlist = seatDAO.selectAll(mmm);
			int yp = seatlist.size();
			changci.setYp(yp);
		}
		movie.setCclist(cclist);
		
		//评论
		List<Pinlun> pllist = pinlunDAO.selectAll(map);
		for(Pinlun pinlun:pllist){
			Member member = memberDAO.findById(Integer.parseInt(pinlun.getMemberid()));
			pinlun.setMember(member);
		}
		request.setAttribute("pllist", pllist);
		
		if(msg.equals("ysc")){
			request.setAttribute("suc", "已收藏过了");
		}
		if(msg.equals("sc")){
			request.setAttribute("suc", "收藏成功");
		}
		if(msg.equals("yp")){
			request.setAttribute("suc", "不能重复评价");
		}
		if(msg.equals("wgm")){
			request.setAttribute("suc", "没有购买记录不能评价");
		}
		return "moviex";
	}
	
	
	//查找类别
	@RequestMapping("admin/skipMovieAdd")
	public String movieList(HttpServletRequest request) {
		String type = request.getParameter("type");
		HashMap map = new HashMap();
		List<Category> list = categoryDAO.selectAll(map);
		request.setAttribute("list", list);
		if(type.equals("add")){
		return "admin/movieadd";
		}else{
		String id = request.getParameter("id");
		Movie movie = movieDAO.findById(Integer.parseInt(id));
		request.setAttribute("movie", movie);
		return "admin/movieedit";	
		}
	}
	
	//后台影片列表
	@RequestMapping("admin/movieList")
	public String movieList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		PageHelper.startPage(pageNum,10);
		String key = request.getParameter("key");
		HashMap map = new HashMap();
		map.put("key", key);
		List<Movie> list = movieDAO.selectAll(map);
		for(Movie movie:list){
			Category category = categoryDAO.findById(Integer.parseInt(movie.getCategoryid()));
			movie.setCategory(category);
			movie.setCid(Integer.parseInt(movie.getCategoryid()));
			if(movie.getHallid()!=null && movie.getHallid().equals("")){
				Hall hall = hallDAO.findById(Integer.parseInt(movie.getHallid()));
				movie.setHall(hall);
			}
		}
		PageInfo<Movie> pageInfo = new PageInfo<Movie>(list);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("key", key);
		return "admin/movielist";
	}
	
	//前台影片列表
	@RequestMapping("movieMsg")
	public String movieMsg(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		PageHelper.startPage(pageNum,10);
		String categoryid = request.getParameter("categoryid");
		String key = request.getParameter("key");
		HashMap map = new HashMap();
		map.put("categoryid", categoryid);
		map.put("key", key);
		List<Movie> list = movieDAO.selectAll(map);
		for(Movie movie:list){
			Category category = categoryDAO.findById(Integer.parseInt(movie.getCategoryid()));
			movie.setCategory(category);
			movie.setCid(Integer.parseInt(movie.getCategoryid()));
			double jf = saveobject.getAverageScore(movie.getId(), request);
			movie.setJf(jf);
		}
		PageInfo<Movie> pageInfo = new PageInfo<Movie>(list);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("categoryid", categoryid);
		request.setAttribute("key", key);
		saveobject.getCategoryObject(request);
		return "moviemsg";
	}
	
	@RequestMapping("admin/movieAdd")
	public String movieAdd(Movie movie,HttpServletRequest request){
		movie.setIsbf("未播放");
		movie.setDelstatus("0");
		movieDAO.add(movie);
		return "redirect:movieList.do";
	}
	
	
	@RequestMapping("ckmovie")
	public String ckmovie(int id,HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		Movie movie = movieDAO.findById(id);
		request.setAttribute("movie", movie);
	    return "movieedit";		
	}
	
	@RequestMapping("admin/movieEdit")
	public String movieEdit(Movie movie,HttpServletRequest request) {
		movieDAO.update(movie);
	    return "redirect:movieList.do";		
	}
	
	
	@RequestMapping("admin/movieDel")
	public String movieDel(int id,HttpServletRequest request) {
		Movie movie = movieDAO.findById(id);
		movie.setDelstatus("1");
		movieDAO.update(movie);
	    return "redirect:movieList.do";		
	}
	
	
	
	
	@RequestMapping("admin/movieShow")
	public String moviedetailsShow(int id,HttpServletRequest request) {
		Movie movie = movieDAO.findById(id);
		request.setAttribute("movie", movie);
	    return "admin/moviedetails";		
	}
	
	
}

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
import com.bean.Fav;
import com.bean.Hall;
import com.bean.Movie;
import com.bean.Member;
import com.bean.Pinlun;
import com.bean.User;

import com.dao.CategoryDAO;
import com.dao.FavDAO;
import com.dao.MovieDAO;
import com.dao.MemberDAO;
import com.dao.PinlunDAO;
import com.dao.UserDAO;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.util.Info;
import com.util.Saveobject;

import java.util.*;

@Controller
public class FavController extends BaseController {
	@Resource
	MovieDAO mediaDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	CategoryDAO categoryDAO;
	@Resource
	FavDAO favDAO;
	@Resource
	Saveobject saveobject;
	
	
	
	
	
	
	
	@RequestMapping("favMsg")
	public String favMsg(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		Member member  = (Member)request.getSession().getAttribute("sessionmember");
		if(member!=null){
		HashMap map = new HashMap();
		map.put("memberid", member.getId());
		List<Fav> list = favDAO.selectAll(map);
		for(Fav fav:list){
			Movie movie = mediaDAO.findById(fav.getVid());
			fav.setMovie(movie);
		}
		PageInfo<Fav> pageInfo = new PageInfo<Fav>(list);
		request.setAttribute("pageInfo", pageInfo);
		saveobject.getCategoryObject(request);
		return "favmsg";
		}else{
	    return "login";	
		}
	}
	
	
	
	@RequestMapping("favAdd")
	public String favAdd(Fav fav,HttpServletRequest request){
		Member member  = (Member)request.getSession().getAttribute("sessionmember");
		if(member!=null){
		HashMap map = new HashMap();
		map.put("memberid", member.getId());
		map.put("vid", fav.getVid());
		List<Fav> list = favDAO.selectAll(map);
		if(list.size()==0){
		fav.setMemberid(member.getId());
		favDAO.add(fav);
		return "redirect:movieDetails.do?id="+fav.getVid()+"&msg=sc";
		}else{
		return "redirect:movieDetails.do?id="+fav.getVid()+"&msg=ysc";	
		}
		}else{
		return "login";	
		}
	}
	
	
	@RequestMapping("favDel")
	public String favDel(int id,HttpServletRequest request) {
		favDAO.delete(id);
	    return "redirect:favMsg.do";		
	}
	
	
	
	
	
	
	
}

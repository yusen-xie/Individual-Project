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



import com.bean.Changci;
import com.bean.Hall;
import com.bean.Movie;

import com.bean.User;

import com.dao.ChangciDAO;
import com.dao.HallDAO;
import com.dao.MovieDAO;

import com.dao.UserDAO;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Info;

import java.util.*;

@Controller
public class HallController extends BaseController {
	@Resource
	HallDAO hallDAO;
	@Resource
	ChangciDAO changciDAO;
	@Resource
	MovieDAO movieDAO;
	
	
	
	//后台放映厅列表
	@RequestMapping("admin/hallList")
	public String hallList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		PageHelper.startPage(pageNum,10);
		String key = request.getParameter("key");
		HashMap map = new HashMap();
		map.put("key", key);
		List<Hall> list = hallDAO.selectAll(map);
		for(Hall hall:list){
			HashMap mmm = new HashMap();
			mmm.put("hallid", hall.getId());
			List<Changci> cclist = changciDAO.selectAll(mmm);
			for(Changci changci:cclist){
				Movie movie = movieDAO.findById(Integer.parseInt(changci.getMovieid()));
				changci.setMovie(movie);
			}
			hall.setCclist(cclist);
		}
		PageInfo<Hall> pageInfo = new PageInfo<Hall>(list);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("key", key);
		return "admin/halllist";
	}
	
	//新增放映厅
	@RequestMapping("admin/hallAdd")
	public String hallAdd(Hall hall,HttpServletRequest request) {
		hall.setDelstatus("0");
		hall.setStatus("未使用");
		hallDAO.add(hall);
		return "redirect:hallList.do";
	}
	
	
	//后台查找信息到修改页面
	@RequestMapping("admin/hallShow")
	public String hallShow(int id,HttpServletRequest request) {
		Hall hall = hallDAO.findById(id);
		request.setAttribute("hall", hall);
		return "admin/halledit";
	}
	
	//后台修改放映厅
	@RequestMapping("admin/hallEdit")
	public String hallEdit(Hall hall,HttpServletRequest request) {
		hallDAO.update(hall);
		return "redirect:hallList.do";
	}
	
	
	//后台删除放映厅
	@RequestMapping("admin/hallDel")
	public String hallDel(int id,HttpServletRequest request) {
		Hall hall = hallDAO.findById(id);
		hall.setDelstatus("1");
		hallDAO.update(hall);
		return "redirect:hallList.do";
	}
	
	
}

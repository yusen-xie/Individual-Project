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
import com.bean.Imgadv;
import com.bean.Movie;

import com.bean.User;

import com.dao.ChangciDAO;
import com.dao.HallDAO;
import com.dao.ImgadvDAO;
import com.dao.MovieDAO;

import com.dao.UserDAO;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Info;

import java.util.*;

@Controller
public class ImgadvController extends BaseController {
	@Resource
	ImgadvDAO imgadvDAO;
	
	
	
	//后台滚动图片列表
	@RequestMapping("admin/imgadvList")
	public String imgadvList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		PageHelper.startPage(pageNum,10);
		List<Imgadv> list = imgadvDAO.selectAll();
		PageInfo<Imgadv> pageInfo = new PageInfo<Imgadv>(list);
		request.setAttribute("pageInfo", pageInfo);
		return "admin/imgadvlist";
	}
	
	//新增滚动图片
	@RequestMapping("admin/imgadvAdd")
	public String imgadvAdd(Imgadv imgadv,HttpServletRequest request) {
		imgadvDAO.add(imgadv);
		return "redirect:imgadvList.do";
	}
	
	
	
	//后台删除滚动图片
	@RequestMapping("admin/imgadvDel")
	public String imgadvDel(int id,HttpServletRequest request) {
		imgadvDAO.delete(id);
		return "redirect:imgadvList.do";
	}
	
	
}

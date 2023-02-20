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
import com.bean.Hall;
import com.bean.Movie;
import com.bean.Member;

import com.bean.User;


import com.dao.MovieDAO;

import com.dao.UserDAO;

import com.dao.CategoryDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Info;

import java.util.*;

@Controller
public class CategoryController extends BaseController {
	@Resource
	CategoryDAO categoryDAO;
	
	@RequestMapping("admin/categoryList")
	public String categoryList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		String key = request.getParameter("key");
		HashMap map = new HashMap();
		map.put("key", key);
		List<Category> list = categoryDAO.selectAll(map);
		PageInfo<Category> pageInfo = new PageInfo<Category>(list);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("key", key);
		return "admin/categorylist";
	}
	
	@RequestMapping("admin/categoryAdd")
	public String categoryAdd(Category category, HttpServletRequest request) {
		category.setDelstatus("0");
		categoryDAO.add(category);
		return "redirect:categoryList.do";
	}
	
	
	@RequestMapping("admin/categoryDelAll")
	public String categoryDelAll(HttpServletRequest request,HttpServletResponse response){
		String vals = request.getParameter("vals");
		String[] val = vals.split(",");
		for(int i=0;i<val.length;i++){
			categoryDAO.delete(Integer.parseInt(val[i]));
		}
		return "redirect:categoryList.do";
	}
	
	
	
	@RequestMapping("admin/categoryShow")
	public String categoryShow(int id, HttpServletRequest request) {
		Category category = categoryDAO.findById(id);
		request.setAttribute("category", category);
		return "admin/categoryedit";
	}
	
	@RequestMapping("admin/categoryEdit")
	public String categoryEdit(Category category,HttpServletRequest request) {
		categoryDAO.update(category);
		return "redirect:categoryList.do";
	}
	
}

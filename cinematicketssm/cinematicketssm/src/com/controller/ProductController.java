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
import com.bean.Dingdan;
import com.bean.Hall;
import com.bean.Movie;
import com.bean.Product;
import com.bean.Seat;
import com.bean.User;


import com.dao.DingdanDAO;
import com.dao.HallDAO;
import com.dao.MovieDAO;
import com.dao.ProductDAO;
import com.dao.SeatDAO;
import com.dao.UserDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Info;

import java.util.*;

@Controller
public class ProductController extends BaseController {
	@Resource
	ProductDAO productDAO;
	
	//删除
	@RequestMapping("admin/productDel")
	public String productDel(int id,HttpServletRequest request) {
		productDAO.delete(id);
		return "redirect:productList.do";
	}
	
	
	
	//添加商品
	@RequestMapping("admin/productAdd")
	public String productAdd(Product product,HttpServletRequest request) {
		productDAO.add(product);
		return "redirect:productList.do";
	}
	
	//编辑商品页面
	@RequestMapping("admin/productShow")
	public String productShow(int id,HttpServletRequest request) {
		Product product = productDAO.findById(id);
		request.setAttribute("product", product);
		return "admin/productedit";
	}
	
	//编辑商品
	@RequestMapping("admin/productEdit")
	public String productEdit(Product product,HttpServletRequest request) {
		productDAO.update(product);
		return "redirect:productList.do";
	}
	//后台商品列表
	@RequestMapping("admin/productList")
	public String productList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		String key = request.getParameter("key");
		HashMap map = new HashMap();
		map.put("key", key);
		PageHelper.startPage(pageNum,10);
		List<Product> list = productDAO.selectAll(map);
		PageInfo<Product> pageInfo = new PageInfo<Product>(list);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("key", key);
		return "admin/productlist";
	}
	
	
	
	
}

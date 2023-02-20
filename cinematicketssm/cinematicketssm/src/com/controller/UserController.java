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

import com.bean.Category;
import com.bean.User;

import com.dao.CategoryDAO;
import com.dao.UserDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


import java.util.*;

@Controller
public class UserController extends BaseController {
	@Resource
	UserDAO userDao;
	
	
	@RequestMapping("admin/login")
	public String login(User user ,HttpServletRequest request) {
			//user.setUserpassword(user.getUserpassword());
		    List<User> list = userDao.selectOne(user);
		    if(list.size()==0){
		    	request.setAttribute("error", "用户名或密码错误");
		    	return "admin/login";
		    }else{
		    	request.getSession().setAttribute("admin", list.get(0));
		    	return "admin/index";
		    }

	}


	@RequestMapping("admin/update")
	public String update(User user, HttpServletRequest request) {
		userDao.update(user);
		return "redirect:show.do?msg=msg";
	}
	
	
	@RequestMapping("admin/updatepwd")
	public String updatepwd(int id,String userpassword, HttpServletRequest request) {
		String oldpassword = request.getParameter("oldpassword");
		User user = userDao.findById(id);
		if(oldpassword.equals(user.getUserpassword())){
			userDao.updatepwd(id,userpassword);
			request.setAttribute("suc", "操作成功");
		}else{
			request.setAttribute("error", "原密码错误");
		}
		return "admin/updatepwd";
	}

	
	@RequestMapping("admin/show")
	public String showid(HttpServletRequest request) {
		String msg = request.getParameter("msg");
		User user =  (User)request.getSession().getAttribute("admin");
		User admin = userDao.findById(user.getId());
		request.setAttribute("user", admin);
		if(msg!=null){
		request.setAttribute("suc", "编辑成功");
		}
		return "admin/admininfo";
	}
	
	
	//检查用户名的唯一性
	@RequestMapping("admin/checkUsername")
	public void checkUsername(String username, HttpServletRequest request, HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			List<User> list = userDao.checkUsername(username);
			if(list.size()==0){
				out.print(0);
			}else{
				out.print(1);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("admin/userList")
	public String userList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		String key = request.getParameter("key");
		PageHelper.startPage(pageNum,10);
		HashMap map = new HashMap();
		map.put("key", key);
		List<User> list = userDao.selectAll(map);
	   	PageInfo<User> pageInfo = new PageInfo<User>(list);
	   	request.setAttribute("key", key);
		request.setAttribute("pageInfo", pageInfo);
		return "admin/userlist";
	}
	
	@RequestMapping("admin/userDelAll")
	public String userDelAll(HttpServletRequest request,HttpServletResponse response){
		String vals = request.getParameter("vals");
		String[] val = vals.split(",");
		for(int i=0;i<val.length;i++){
			userDao.delete(Integer.parseInt(val[i]));
		}
		return "redirect:yqlinkList.do";
	}
	
	
	@RequestMapping("/admin/usernameCheck")
	public String usernameCheck(String username, HttpServletRequest request,HttpServletResponse response){
   	 try {
			PrintWriter out =  response.getWriter();
			List<User> list = userDao.usernamecheck(username);
	    	 if(list.size()==0){
	    		 out.write("0");
	    	 }else{
	    		 out.write("1");
	    	 }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   	 return null;
    }
	
	
	@RequestMapping("admin/userAdd")
	public String userAdd(User user,HttpServletRequest request) {
		user.setDelstatus("0");
		userDao.add(user);
		return "redirect:userList.do";
	}
	
	@RequestMapping("admin/userShow")
	public String userShow(int id,HttpServletRequest request) {
		User user = userDao.findById(id);
		request.setAttribute("user", user);
		return "admin/useredit";
	}
	
	
	@RequestMapping("admin/userEdit")
	public String userEdit(User user,HttpServletRequest request) {
		userDao.update(user);
		return "redirect:userList.do";
	}
	
	

}

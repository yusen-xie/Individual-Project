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

import com.bean.Hall;
import com.bean.Member;

import com.bean.User;

import com.dao.MemberDAO;
import com.dao.UserDAO;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Saveobject;


import java.util.*;

@Controller
public class MemberController extends BaseController {
	@Resource
	MemberDAO memberDAO;
	@Resource
	Saveobject saveobject;
	
	
	//充值
	@RequestMapping("Chongzhi")
	public String Chongzhi(Member member,HttpServletRequest request){
		Member mmm = memberDAO.findById(member.getId());
		double yue = mmm.getYue()+member.getYue();
		mmm.setYue(yue);
		memberDAO.updateYue(mmm);
		return "redirect:yueMsg.do";
	}
	
	
	//余额
	@RequestMapping("yueMsg")
	public String yueMsg(HttpServletRequest request){
		Member mmm = (Member)request.getSession().getAttribute("sessionmember");
		Member member = memberDAO.findById(mmm.getId());
		request.setAttribute("member", member);
		saveobject.getCategoryObject(request);
		return "yuemsg";
	}
	
	
	//登录
	@RequestMapping("Login")
	public String Login(String uname,String upass, HttpServletRequest request){
		List<Member> list = memberDAO.selectOne(uname,upass);
		if(list.size()==0){
			return "skipLogin.do?suc=error";
		}else{
			Member member = list.get(0);
			request.getSession().setAttribute("sessionmember", list.get(0));
			return "redirect:index.do";	
		}
	}
	
	//注册
	@RequestMapping("Register")
	public String Register(Member member, HttpServletRequest request){
		member.setDelstatus("0");
		member.setShstatus("正在使用");
		member.setUtype("普通用户");
		memberDAO.add(member);
		request.setAttribute("suc", "注册成功");
		saveobject.getCategoryObject(request);
		return "register";
	}
	
	//更改会员类型
	@RequestMapping("admin/updateUtype")
	public String updateUtype(int id, HttpServletRequest request){
		Member member = memberDAO.findById(id);
		if(member.getUtype().equals("普通用户")){
			member.setUtype("会员");
		}else{
			member.setUtype("普通用户");
		}
		memberDAO.update(member);
		Member mmm = memberDAO.findById(id);
		request.getSession().setAttribute("sessionmember", mmm);
		return "redirect:memberList.do";
	}
	
	//检查用户名的唯一性
	@RequestMapping("checkUname")
	public void checkUname(String uname, HttpServletRequest request, HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			List<Member> list = memberDAO.checkUname(uname);
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
	
	//修改页面
	@RequestMapping("memberShow")
	public String studentmsgEdit(int id, HttpServletRequest request){
		saveobject.getCategoryObject(request);
		Member member = (Member)memberDAO.findById(id);
		request.setAttribute("member", member);
		String msg = request.getParameter("msg");
		if(msg!=null){
			request.setAttribute("suc", "编辑成功");
		}
		return "memberxg";
	}
	
	//个人信息修改
	
	@RequestMapping("memberxg")
	public String memberxg(Member member, HttpServletRequest request){
		memberDAO.update(member);
		request.setAttribute("suc", "编辑成功");
		request.setAttribute("member", member);
		saveobject.getCategoryObject(request);
		return "memberxg";
	}
	
	
	//会员列表
	@RequestMapping("admin/memberList")
	public String studentList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		PageHelper.startPage(pageNum,10);
		String key = request.getParameter("key");
		HashMap map = new HashMap();
		map.put("key", key);
		List<Member> list = memberDAO.selectAll(map);
		PageInfo<Member> pageInfo = new PageInfo<Member>(list);
		request.setAttribute("key", key);
		request.setAttribute("pageInfo", pageInfo);
		return "admin/memberlist";
	}
	
	//删除
	@RequestMapping("admin/memberDelAll")
	public String teacherDelAll(HttpServletRequest request,HttpServletResponse response){
		String vals = request.getParameter("vals");
		String[] val = vals.split(",");
		for(int i=0;i<val.length;i++){
			memberDAO.delete(Integer.parseInt(val[i]));
		}
		return "redirect:memberList.do";
	}
	
	//锁定帐号
	@RequestMapping("admin/gxStatus")
	public String gxStatus(int id, HttpServletRequest request){
		Member member = (Member)memberDAO.findById(id);
		if(member.getShstatus().equals("正在使用")){
			member.setShstatus("已锁定");
		}else{
			member.setShstatus("正在使用");
		}
		memberDAO.update(member);
		return "redirect:memberList.do";
	}

}

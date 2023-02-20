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
import com.bean.Dingdan;
import com.bean.Hall;
import com.bean.Member;
import com.bean.Movie;
import com.bean.Product;
import com.bean.Seat;
import com.bean.User;
import com.dao.ChangciDAO;
import com.dao.DingdanDAO;
import com.dao.HallDAO;
import com.dao.MemberDAO;
import com.dao.MovieDAO;
import com.dao.ProductDAO;
import com.dao.SeatDAO;
import com.dao.UserDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.CheckCode;
import com.util.Info;
import com.util.Saveobject;

import java.util.*;

@Controller
public class DingdanController extends BaseController {
	@Resource
	DingdanDAO dingdanDAO;
	@Resource
	ChangciDAO changciDAO;
	@Resource
	MovieDAO movieDAO;
	@Resource
	SeatDAO seatDAO;
	@Resource
	Saveobject saveobject;
	@Resource
	HallDAO hallDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	ProductDAO productDAO;
	
	//删除
	@RequestMapping("admin/dingdanDelAll")
	public String dingdanDelAll(HttpServletRequest request,HttpServletResponse response){
		String vals = request.getParameter("vals");
		String[] val = vals.split(",");
		for(int i=0;i<val.length;i++){
			dingdanDAO.delete(Integer.parseInt(val[i]));
		}
		return "redirect:dingdanList.do";
	}
	
	
	//后台订单列表
	@RequestMapping("admin/dingdanList")
	public String dingdanList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		String key = request.getParameter("key");
		String key1 = request.getParameter("key1");
		HashMap map = new HashMap();
		map.put("key", key);
		map.put("key1", key1);
		PageHelper.startPage(pageNum,10);
		List<Dingdan> list = dingdanDAO.selectAll(map);
		for(Dingdan dingdan:list){
			Member member = memberDAO.findById(Integer.parseInt(dingdan.getMemberid()));
			Movie movie = movieDAO.findById(Integer.parseInt(dingdan.getMovieid()));
			Changci changci = changciDAO.findById(Integer.parseInt(dingdan.getChangciid()));
			Hall hall = hallDAO.findById(Integer.parseInt(changci.getHallid()));
			changci.setHall(hall);
			dingdan.setChangci(changci);
			dingdan.setMember(member);
			dingdan.setMovie(movie);
			
			String seatstr = "";
			String seatid[] = dingdan.getSeatstr().split(",");
			for(int i=0;i<seatid.length;i++){
				Seat seat = seatDAO.findById(Integer.parseInt(seatid[i]));
				seatstr+=seat.getSeatno()+"&nbsp;&nbsp;&nbsp;&nbsp;";
			}
			dingdan.setSeatstr(seatstr);
		}
		PageInfo<Dingdan> pageInfo = new PageInfo<Dingdan>(list);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("key", key);
		request.setAttribute("key1", key1);
		return "admin/dingdanlist";
	}
	
	//订单列表
	@RequestMapping("dingdanLb")
	public String dingdanLb(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		Member mmm = (Member)request.getSession().getAttribute("sessionmember");
		HashMap map = new HashMap();
		map.put("memberid", mmm.getId());
		PageHelper.startPage(pageNum,10);
		List<Dingdan> list = dingdanDAO.selectAll(map);
		for(Dingdan dingdan:list){
			Member member = memberDAO.findById(Integer.parseInt(dingdan.getMemberid()));
			Movie movie = movieDAO.findById(Integer.parseInt(dingdan.getMovieid()));
			Changci changci = changciDAO.findById(Integer.parseInt(dingdan.getChangciid()));
			Hall hall = hallDAO.findById(Integer.parseInt(changci.getHallid()));
			changci.setHall(hall);
			dingdan.setChangci(changci);
			dingdan.setMember(member);
			dingdan.setMovie(movie);
			
			String seatstr = "";
			String seatid[] = dingdan.getSeatstr().split(",");
			for(int i=0;i<seatid.length;i++){
				Seat seat = seatDAO.findById(Integer.parseInt(seatid[i]));
				seatstr+=seat.getSeatno()+"&nbsp;&nbsp;&nbsp;&nbsp;";
			}
			dingdan.setSeatstr(seatstr);
		}
		PageInfo<Dingdan> pageInfo = new PageInfo<Dingdan>(list);
		request.setAttribute("pageInfo", pageInfo);
		saveobject.getCategoryObject(request);
		return "dingdanlb";
	}
	
	//新增订单
	@RequestMapping("dingdanAdd")
	public String dingdanAdd(Dingdan dingdan,HttpServletRequest request) {
		Member mmm = (Member)request.getSession().getAttribute("sessionmember");
		String productmsg = request.getParameter("productmsg");
		Member member = memberDAO.findById(mmm.getId());
		boolean flag = true;
		if(dingdan.getPrice()>member.getYue()){
			flag=false;
		}
		if(flag==true){
		   CheckCode cc = new CheckCode();
		   String ddno = cc.getCheckCode();
		   dingdan.setDdno(ddno);
		   dingdan.setFkstatus("已付款");
		   dingdan.setSavetime(Info.getDateStr());
		   dingdan.setMemberid(String.valueOf(member.getId()));
		   String ma = cc.getMa();
		   dingdan.setMa(ma);
		   
		   String seatid[] = dingdan.getSeatstr().split(",");
			for(int i=0;i<seatid.length;i++){
				Seat seat = seatDAO.findById(Integer.parseInt(seatid[i]));
				seat.setIszy("yes");
				seatDAO.update(seat);
			}
			 double yue = member.getYue()-dingdan.getPrice();
			 dingdanDAO.add(dingdan);
			member.setYue(yue);
			memberDAO.updateYue(member);
			return "redirect:createDD.do?movieid="+dingdan.getMovieid()+"&changciid="+dingdan.getChangciid()+"&seatstr="+dingdan.getSeatstr()+"&suc=suc"+"&productmsg="+productmsg;
		}else{
			return "redirect:createDD.do?movieid="+dingdan.getMovieid()+"&changciid="+dingdan.getChangciid()+"&seatstr="+dingdan.getSeatstr()+"&error=error"+"&productmsg="+productmsg;
		}
	}
	
	//创建订单
	@RequestMapping("createDD")
	public String createDD(HttpServletRequest request) {
		
		Member mmm = (Member)request.getSession().getAttribute("sessionmember");
		Member member = memberDAO.findById(mmm.getId());
		
		String seatstrid = request.getParameter("seatstr");
		String productmsg = request.getParameter("productmsg");
		double producttotal = 0D;
		String productinfo = "无";
		if(productmsg!=null && !productmsg.equals("")){
			String productstr[] = productmsg.split(",");
			for(int a=0;a<productstr.length;a++){
				String aaa[] = productstr[a].split("-");
				Product product = productDAO.findById(Integer.parseInt(aaa[0]));
				producttotal+=product.getPrice()*Double.parseDouble(aaa[1]);
				productinfo+=product.getName()+"&nbsp;x"+aaa[1]+"<br/>";
				
			}
		}
		
		
		String movieid = request.getParameter("movieid");
		String changciid = request.getParameter("changciid");
		String error = request.getParameter("error")==null?"":request.getParameter("error");
		String suc = request.getParameter("suc")==null?"":request.getParameter("suc");
		
		Changci changci = changciDAO.findById(Integer.parseInt(changciid));
		Hall hall = hallDAO.findById(Integer.parseInt(changci.getHallid()));
		changci.setHall(hall);
		Movie movie = movieDAO.findById(Integer.parseInt(movieid));
		
		String seatstr = "";
		String seatid[] = seatstrid.split(",");
		int num = seatid.length;
		double total = 0.0;
		if(member.getUtype().equals("会员")){
			total = movie.getPrice()*num*0.7;
		}else{
			total = movie.getPrice()*num;
		}
		total+=producttotal;
		for(int i=0;i<seatid.length;i++){
			Seat seat = seatDAO.findById(Integer.parseInt(seatid[i]));
			seatstr+=seat.getSeatno()+"&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		request.setAttribute("num", num);
		request.setAttribute("total", total);
		request.setAttribute("changci", changci);
		request.setAttribute("movie", movie);
		request.setAttribute("seatstr", seatstr);
		request.setAttribute("seatstrid", seatstrid);
		request.setAttribute("producttotal", producttotal);
		request.setAttribute("productinfo", productinfo);
		request.setAttribute("productmsg", productmsg);
		saveobject.getCategoryObject(request);
		if(!error.equals("")){
			request.setAttribute("error", "余额不足");
		}
		if(!suc.equals("")){
			request.setAttribute("suc", "购买成功");
		}
		return "createdd";
	}
	
	
	//后台查找信息到修改页面
	@RequestMapping("admin/dingdanShow")
	public String dingdanShow(int id,HttpServletRequest request) {
		Dingdan dingdan = dingdanDAO.findById(id);
		request.setAttribute("dingdan", dingdan);
		return "admin/dingdanedit";
	}
	
	//后台修改订单
	@RequestMapping("admin/dingdanEdit")
	public String dingdanEdit(Dingdan dingdan,HttpServletRequest request) {
		dingdanDAO.update(dingdan);
		return "redirect:dingdanList.do";
	}
	
	
	//后台删除订单
	@RequestMapping("admin/dingdanDel")
	public String dingdanDel(int id,HttpServletRequest request) {
		dingdanDAO.delete(id);
		return "redirect:dingdanList.do";
	}
	
	//后台删除订单
	@RequestMapping("dingdanSc")
	public String dingdanSc(int id,HttpServletRequest request) {
		dingdanDAO.delete(id);
		return "redirect:dingdanLb.do";
	}
	
	
}

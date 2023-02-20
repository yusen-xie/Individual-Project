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
import com.bean.Dingdan;
import com.bean.Hall;
import com.bean.Movie;

import com.bean.Seat;
import com.bean.User;


import com.dao.ChangciDAO;
import com.dao.DingdanDAO;
import com.dao.HallDAO;
import com.dao.MovieDAO;

import com.dao.SeatDAO;
import com.dao.UserDAO;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.Info;

import java.util.*;

@Controller
public class ChangciController extends BaseController {
	@Resource
	ChangciDAO changciDAO;
	@Resource
	MovieDAO movieDAO;
	@Resource
	HallDAO hallDAO;
	@Resource
	SeatDAO seatDAO;
	@Resource
	DingdanDAO dingdanDAO;
	
	//删除
	@RequestMapping("admin/changciDel")
	public String changciDel(int id,HttpServletRequest request) {
		changciDAO.delete(id);
		return "redirect:hallList.do";
	}
	
	@RequestMapping("admin/skipchangci")
	public String skipchangci(HttpServletRequest request) {
		String hallid = request.getParameter("hallid");
		String error = request.getParameter("error")==null?"":request.getParameter("error");
		HashMap map = new HashMap();
		map.put("issy", "正在热映");
		List<Movie> list = movieDAO.selectAll(map);
		request.setAttribute("list", list);
		request.setAttribute("hallid", hallid);
		if(!error.equals("")){
		request.setAttribute("error", "不能同一场次");
		}
		return "admin/changciadd";
	}
	
	//添加场次
	@RequestMapping("admin/changciAdd")
	public String changciAdd(Changci changci,HttpServletRequest request) {
		String datetime = request.getParameter("datetime");
		String mintime = request.getParameter("mintime");
		String savetime = datetime+" "+mintime;
		HashMap map = new HashMap();
		map.put("savetime", savetime);
		map.put("hallid", changci.getHallid());
		List<Changci> list = changciDAO.selectAll(map);
		if(list.size()==0){
		changci.setSavetime(savetime);
		changci.setDelstatus("0");
		changciDAO.add(changci);
		List<Changci> nlist = changciDAO.selectAll(map);
		Changci cc= nlist.get(0);
		Hall hall = hallDAO.findById(Integer.parseInt(changci.getHallid()));
		for(int i=0;i<hall.getSeatno();i++){
			int a = Math.round(i/6)+1;
			String seatno = String.valueOf(a)+"排"+(i+1)+"座";
			Seat seat = new Seat();
			seat.setSeatno(seatno);
			seat.setMovieid(changci.getMovieid());
			seat.setIszy("no");
			seat.setChangciid(String.valueOf(cc.getId()));
			seatDAO.add(seat);
		}
		return "redirect:hallList.do";
		}else{
		
		return "redirect:skipchangci.do?hallid="+changci.getHallid()+"&error=error";
		}
	}
	
	//售票管理
	//后台影片列表
	@RequestMapping("admin/ticketList")
	public String ticketList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		PageHelper.startPage(pageNum,10);
		String key = request.getParameter("key");
		String key1 = request.getParameter("key1");
		HashMap map = new HashMap();
		map.put("key", key);
		map.put("key1", key1);
		List<Changci> list = changciDAO.selectAll(map);
		for(Changci changci:list){
			Movie movie = movieDAO.findById(Integer.parseInt(changci.getMovieid()));
			Hall hall = hallDAO.findById(Integer.parseInt(changci.getHallid()));
			changci.setMovie(movie);
			changci.setHall(hall);
			HashMap mmm = new HashMap();
			mmm.put("changciid", changci.getId());
			int salenum = 0;
			List<Dingdan> ddlist = dingdanDAO.selectAll(mmm);
			for(Dingdan dingdan:ddlist){
				String pnum[] = dingdan.getSeatstr().split(",");
				salenum+=pnum.length;
			}
			changci.setSalenum(salenum);
		}
		PageInfo<Changci> pageInfo = new PageInfo<Changci>(list);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("key", key);
		request.setAttribute("key1", key1);
		return "admin/ticketlist";
	}
	
	
	//删除
	@RequestMapping("admin/ticketDelAll")
	public String ticketDelAll(HttpServletRequest request,HttpServletResponse response){
		String vals = request.getParameter("vals");
		String[] val = vals.split(",");
		for(int i=0;i<val.length;i++){
			changciDAO.delete(Integer.parseInt(val[i]));
		}
		return "redirect:dingdanList.do";
	}
	
	
}

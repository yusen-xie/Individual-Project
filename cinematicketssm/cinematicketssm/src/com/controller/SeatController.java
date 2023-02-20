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
import com.dao.MovieDAO;
import com.dao.ProductDAO;
import com.dao.SeatDAO;
import com.dao.UserDAO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;
import com.util.Saveobject;

import java.util.*;

@Controller
public class SeatController extends BaseController {
	@Resource
	ChangciDAO changciDAO;
	@Resource
	SeatDAO seatDAO;
	@Resource
	MovieDAO movieDAO;
	@Resource
	Saveobject saveobject;
	@Resource
	DingdanDAO dingdanDAO;
	@Resource
	ProductDAO productDAO;
	
	
	
	@RequestMapping("seatLb")
	public String seatLb(HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		String changciid = request.getParameter("changciid");
		String movieid = request.getParameter("movieid");
		HashMap map = new HashMap();
		map.put("changciid", changciid);
		List<Seat> seatlist = seatDAO.selectAll(map);
		Movie movie = movieDAO.findById(Integer.parseInt(movieid));
		request.setAttribute("seatlist", seatlist);
		request.setAttribute("movieid", movieid);
		request.setAttribute("movie", movie);
		request.setAttribute("changciid", changciid);
		saveobject.getCategoryObject(request);
		HashMap mmm = new HashMap();
		mmm.put("memberid", member.getId());
		mmm.put("movieid", movieid);
		List stlist = new ArrayList();
		List<Dingdan> ddlist = dingdanDAO.selectAll(mmm);
		for(Dingdan dingdan:ddlist){
			String[] seatzh = dingdan.getSeatstr().split(",");
			for(int i=0;i<seatzh.length;i++){
				stlist.add(seatzh[i]);
			}
		}
		request.setAttribute("stlist", stlist);
		
		HashMap ppp = new HashMap();
		ppp.put("flag", member.getId());
		ppp.put("movieid", movieid);
		List ttlist = new ArrayList();
		List<Dingdan> dinglist = dingdanDAO.selectAll(ppp);
		for(Dingdan dd:dinglist){
			String[] seatzh = dd.getSeatstr().split(",");
			for(int i=0;i<seatzh.length;i++){
				ttlist.add(seatzh[i]);
			}
		}
		request.setAttribute("ttlist", ttlist);
		
		//商品列表
		List<Product> ptlist = productDAO.selectAll(null);
		request.setAttribute("ptlist", ptlist);
		return "seatlb";
	}
	
}

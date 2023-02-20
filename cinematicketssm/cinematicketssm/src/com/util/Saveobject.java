package com.util;

import org.springframework.stereotype.Component;

import com.bean.Category;
import com.bean.Pinlun;

import com.dao.CategoryDAO;
import com.dao.PinlunDAO;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Component
public class Saveobject {
	@Resource
	CategoryDAO categoryDao;
	@Resource
	PinlunDAO pinlunDAO;
	
	
	
	public void getCategoryObject(HttpServletRequest request) {
		HashMap map = new HashMap();
		List<Category> ctlist = categoryDao.selectAll(map);
		request.setAttribute("ctlist", ctlist);
	}
	
	public double getAverageScore(int id,HttpServletRequest request) {
		HashMap map = new HashMap();
		map.put("movieid", id);
		List<Pinlun> list = pinlunDAO.selectAll(map);
		double jf = 0.0;
		double total = 0.0;
		for(Pinlun pinlun:list){
			total+=pinlun.getScore();
		}
		if(list.size()>0){
		jf = total/list.size();
		}
		return jf;
	}
	
	

}

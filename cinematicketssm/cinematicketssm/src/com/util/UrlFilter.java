package com.util;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import com.bean.Member;
import com.bean.User;


import java.io.IOException;

public class UrlFilter implements Filter {
	public FilterConfig config;

	public void init(FilterConfig filterConfig) throws ServletException {
		config = filterConfig;
		// System.out.println("----------------------->过滤器被创建");
	}

	public static boolean isContains(String container, String[] regx) {
		boolean result = false;

		for (int i = 0; i < regx.length; i++) {
			if (container.indexOf(regx[i]) != -1) {
				return true;
			}
		}
		return result;
	}

	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) servletRequest;
		HttpServletResponse res = (HttpServletResponse) servletResponse;
		HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper(
				(HttpServletResponse) res);
		String requestURI = req.getRequestURI();
		//System.out.println("--------------------->过滤器：请求地址" + requestURI);

		String logonStrings = config.getInitParameter("logonStrings");// -登录登陆页面

		String[] logonList = logonStrings.split(";");
		//String[] includeList = includeStrings.split(";");

		User admin = (User) req.getSession().getAttribute("admin");
		Member member = (Member) req.getSession().getAttribute("sessionmember");
		//req.getSession().removeAttribute("member");
		//System.out.println("member======================================"+member);
		//System.out.println("admin======================================"+admin);
		
		//仅仅对指定过滤參数后缀进行过滤
		
		if (!this.isContains(req.getRequestURI(), logonList)) {
			
			
			if(requestURI.contains("admin")&&admin==null){
					res.sendRedirect("/cinematicketssm/admin/login.jsp");
					return;
			}
			if(!requestURI.contains("admin")&&member==null){
				//res.sendRedirect("qtindex.do");
				if(requestURI.contains("seatLb.do")||requestURI.contains("favAdd.do")||requestURI.contains("pinlunAdd.do")){
					req.getRequestDispatcher("skipLogin.do").forward(req, res);
				}else{
					req.getRequestDispatcher("index.do").forward(req, res);
				}
				return;
			}
		}
			filterChain.doFilter(req, res);

	}

	public void destroy() {
		this.config = null;
		//System.out.println("----------------------->过滤器被销毁");
	}

}

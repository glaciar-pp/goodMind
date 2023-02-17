package com.example.demo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

/**
 * Servlet Filter implementation class MenuFilter
 */
@Component
public class goodMFilter extends HttpFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		
		String uri = httpRequest.getRequestURI();
//		System.out.println("BbsFilter.uri:" + uri);
		if (uri.contains("infoBoard"))
			session.setAttribute("menu", "infoBoard");
		else if (uri.contains("genBoard"))
			session.setAttribute("menu", "genBoard");
		else if (uri.contains("diaBoard"))
			session.setAttribute("menu", "diaryBoard");	
		else if (uri.contains("user"))
			session.setAttribute("menu", "user");
		else
			session.setAttribute("menu", "");
		
		String[] urlPatterns = {"/infoBoard", "/genBoard", "/diaryBoard", "/user/update", "/user/delete"};
		for (String routing: urlPatterns) {
			if (uri.contains(routing)) {
				String uid = (String) session.getAttribute("uid");
				if (uid == null || uid.equals("")) {
					httpResponse.sendRedirect("/goodM/user/login");
					return;
				}
				break;
			}
		}
		
		chain.doFilter(request, response);
	}

}

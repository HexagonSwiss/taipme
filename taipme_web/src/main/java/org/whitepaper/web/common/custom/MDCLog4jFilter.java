package org.whitepaper.web.common.custom;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.slf4j.MDC;



public class MDCLog4jFilter implements Filter {
	
	

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain) throws IOException, ServletException {
		try {
				if ( SecurityHelper.getUserDetails() != null) {
					MDC.put("email", SecurityHelper.getUserName());
				} else {
					MDC.put("userName","NOTLOGGED");
				}
				MDC.put("reqID",UUID.randomUUID().toString());
				chain.doFilter(request, response);
		} finally {
			 	MDC.remove("userName");
			 	MDC.remove("reqID");
			 	
		}
	}

	@Override
	public void destroy() {
		
		
	}
	

}


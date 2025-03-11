package org.whitepaper.business.service.impl.login;

import org.whitepaper.mobile.login.MobileAuthController;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


//@WebFilter(urlPatterns = "/login-mobile")
public class MobileRequestFilter implements Filter {

	   @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

	   @Override
	   public void doFilter(javax.servlet.ServletRequest request, javax.servlet.ServletResponse response, FilterChain chain)
	           throws IOException, ServletException {
	       HttpServletRequest httpRequest = (HttpServletRequest) request;
	       HttpServletResponse httpResponse = (HttpServletResponse) response;

	       String requestSource = httpRequest.getHeader("X-Request-Source");

	       if ("mobile".equals(requestSource)) {
	    	   String contextPath = httpRequest.getContextPath();
	    	   switch (contextPath) {
	    	    case "login_mobile":
	    	       // Simuliamo la chiamata al controller
	 	           String username = httpRequest.getParameter("username");
	 	           String password = httpRequest.getParameter("password");

	 	           // Creiamo un'istanza del controller e chiamiamo la funzione
	 	           MobileAuthController controller = new MobileAuthController();
	 	           controller.loginMobile(username, password);

	    	       break;	    	        
	    	    default:
	    	        // Azioni se nessuno dei casi precedenti corrisponde
	    	}	         
	       } else {
	           // Continua con il normale flusso di Spring Security
	           chain.doFilter(request, response);
	       }
	   }


    @Override
    public void destroy() {
    } 
}

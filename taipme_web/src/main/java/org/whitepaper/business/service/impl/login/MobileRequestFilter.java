package org.whitepaper.business.service.impl.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.whitepaper.mobile.login.MobileAuthController;
import org.whitepaper.web.controller.InfoController;

import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;

//@WebFilter(urlPatterns = "/login-mobile")
public class MobileRequestFilter implements Filter {

	@Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
	
	@Autowired
	private MobileAuthController controller;
	
	
	
   @Override
   public void doFilter(javax.servlet.ServletRequest request, javax.servlet.ServletResponse response, FilterChain chain)
	        throws IOException, ServletException {
	    HttpServletRequest httpRequest = (HttpServletRequest) request;
	    HttpServletResponse httpResponse = (HttpServletResponse) response;

	    String requestSource = httpRequest.getHeader("X-Request-Source");

	    if ("mobile".equals(requestSource)) {
	        String requestURI = httpRequest.getRequestURI();
	        String endpoint = requestURI.substring(httpRequest.getContextPath().length());
	        boolean isLogged = controller.checkSession(httpRequest.getCookies());
	        String username = httpRequest.getHeader("username");
	        String password = httpRequest.getHeader("password");

	        if (!isLogged) {
	            // Effettua il login e invia il cookie nella risposta
	            controller.loginMobile(username, password, httpResponse);
	            System.out.println("MobileRequestFilter httpResponse: " + httpResponse);
	            return;  // Termina il flusso del filtro per non proseguire
	        }

	        switch (endpoint) {
	            //case "/login_mobile":
	            //    controller.loginMobile(username, password, httpResponse);
	            //    break;
	            case "/registrati_mobile":
	                // Gestisci la registrazione se necessario
	                break;
	            case "/recupera_mobile":
	                // Gestisci la richiesta di recupero
	                break;
	            case "/messages_mobile":
	            	
	            	break;
	            case "/faqs_mobile":
	            	controller.listFaqsMobile();
	            default:
	                // Gestisci il caso di default se necessario
	        }
	    } else {
	        // Continua con il normale flusso di Spring Security
	        chain.doFilter(request, response);
	    }
	}


   public void createSessionToken(String username, HttpServletResponse response) {
	    // Genera un token univoco (può essere un UUID)
	    String sessionToken = UUID.randomUUID().toString();
	    
	    // Crea un cookie per il token di sessione
	    Cookie sessionCookie = new Cookie("SESSION_TOKEN", sessionToken);
	    sessionCookie.setMaxAge(60 * 60 * 24);  // Il cookie scade in 1 giorno (opzionale)
	    sessionCookie.setPath("/"); // Il cookie è valido per tutto il dominio

	    // Aggiungi il cookie alla risposta
	    response.addCookie(sessionCookie);
	}
  
	
    @Override
    public void destroy() {
    } 
}

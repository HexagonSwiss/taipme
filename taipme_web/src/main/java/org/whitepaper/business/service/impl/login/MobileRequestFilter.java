package org.whitepaper.business.service.impl.login;

import org.whitepaper.mobile.controller.MobileFaqApiController;
import org.whitepaper.mobile.service.MobileAuthService;

import javax.annotation.Resource;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.UUID;
import java.util.Map;
import java.util.HashMap;


public class MobileRequestFilter implements Filter {

	@Override
    public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("MobileRequestFilter bean creato correttamente: " + this);
    }
	
	@Resource
	private MobileAuthService mobileAuthService;

	@Resource
	private MobileFaqApiController mobileFaqApiController;

	
   @Override
   public void doFilter(javax.servlet.ServletRequest request, javax.servlet.ServletResponse response, FilterChain chain) throws IOException, ServletException {
	    HttpServletRequest httpRequest = (HttpServletRequest) request;
	    HttpServletResponse httpResponse = (HttpServletResponse) response;

	    String requestSource = httpRequest.getHeader("X-Request-Source");

	    if ("mobile".equals(requestSource)) {
	        String requestURI = httpRequest.getRequestURI();
	        String endpoint = requestURI.substring(httpRequest.getContextPath().length());
	        
	        if (!"/mobile/login".equals(endpoint)) {
		        boolean isLogged = mobileAuthService.checkSession(httpRequest.getCookies());
		        if (!isLogged) {
		        	// Crea una mappa per la risposta JSON
		            Map<String, Object> responseMap = new HashMap<>();
		            responseMap.put("status", "error");
		            responseMap.put("user", null);
		            responseMap.put("cookie", null);
	
		            // Imposta il codice di stato della risposta HTTP
		            httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);  // HTTP 401 Unauthorized
	
		            // Serializza la mappa in JSON e scrivila nella risposta
		            ObjectMapper objectMapper = new ObjectMapper();
		            httpResponse.setContentType("application/json");
		            httpResponse.getWriter().write(objectMapper.writeValueAsString(responseMap));
		            return;  // Ferma ulteriori elaborazioni
		        }
	        }

	        String username = httpRequest.getHeader("username");
	        String password = httpRequest.getHeader("password");

	        switch (endpoint) {
	            case "/mobile/login":
	            	mobileAuthService.loginMobile(username, password, httpResponse);
	                break;
				case "/mobile/faq":
					mobileFaqApiController.getAllFaqs();
					break;
	            case "/registrati_mobile":
	                // Gestisci la registrazione se necessario
	                break;
	            case "/recupera_mobile":
	                // Gestisci la richiesta di recupero
	                break;
	            case "/messaggi_mobile":
	            	break;
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

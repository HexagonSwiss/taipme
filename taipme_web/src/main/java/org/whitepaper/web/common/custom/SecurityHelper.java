package org.whitepaper.web.common.custom;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.whitepaper.bean.login.CustomUser;


public class SecurityHelper {
	
	public static UserDetails getUserDetails(){
	    SecurityContext securityContext = SecurityContextHolder.getContext();
	    Authentication authentication = securityContext.getAuthentication();
	    if (authentication != null) {
	        Object principal = authentication.getPrincipal();
	        return principal instanceof UserDetails ? (UserDetails) principal : null;
	    }
	    
	    
	    return null;
	}
	
	public static CustomUser getUser(){
		CustomUser u = (CustomUser) getUserDetails();
		if  (u!=null) return u;
		else return  null;
	}
	
	public static String getUserName(){
		CustomUser u = (CustomUser) getUserDetails();
		if  (u!=null) return u.getUsername();
		else return  "";
	}
	
	public static Integer getIdUser(){
		CustomUser u = (CustomUser) getUserDetails();
		if  (u!=null) return u.getIdUser();
		else return  null;
	}

}

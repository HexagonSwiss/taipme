package org.whitepaper.mobile.controller;

import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.whitepaper.mobile.service.MobileAuthService;

@RestController
@RequestMapping("/mobile")
public class MobileAuthController {
	
    @PostConstruct
	public void init() {
		System.out.println("MobileAuthController bean creato correttamente: " + this);
	}

    @Autowired
    private MobileAuthService mobileAuthService;
    
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<?> login(@RequestHeader("username") String username, @RequestHeader("password") String password) {
    	Map<String, Object> result = mobileAuthService.loginMobile(username, password);
    
		if ("ok".equals(result.get("status"))) {
        	return ResponseEntity.ok(result);
    	} else {
        	return ResponseEntity.status(HttpServletResponse.SC_UNAUTHORIZED).body(result);
    	}
	}
}

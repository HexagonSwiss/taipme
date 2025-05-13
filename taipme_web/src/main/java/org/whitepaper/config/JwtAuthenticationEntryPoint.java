package org.whitepaper.config;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import com.fasterxml.jackson.databind.ObjectMapper; 
import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
public class JwtAuthenticationEntryPoint implements AuthenticationEntryPoint, Serializable {

    private static final long serialVersionUID = -7858869558953243875L;
    private static final Logger entryPointLogger = LoggerFactory.getLogger(JwtAuthenticationEntryPoint.class);
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException authException) throws IOException {
        entryPointLogger.warn("Unauthorized access attempt. Path: {}. Error: {}", request.getRequestURI(),
                authException.getMessage());

        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        response.setContentType("application/json");

        Map<String, Object> data = new HashMap<>();
        data.put("timestamp", System.currentTimeMillis());
        data.put("status", HttpServletResponse.SC_UNAUTHORIZED);
        data.put("error", "Unauthorized");

        Object expiredAttribute = request.getAttribute("expired");
        if (expiredAttribute != null) {
            data.put("message", "Access Denied: Token has expired. " + expiredAttribute.toString());
        } else {
            data.put("message", "Access Denied: " + authException.getMessage());
        }
        data.put("path", request.getRequestURI());

        response.getOutputStream().println(objectMapper.writeValueAsString(data));
    }
}

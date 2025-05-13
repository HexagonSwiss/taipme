package org.whitepaper.web.controller.login; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import org.whitepaper.business.service.impl.custom.JwtTokenService; 

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import io.jsonwebtoken.ExpiredJwtException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
public class JwtRequestFilter extends OncePerRequestFilter {

    private static final Logger jwtFilterLogger = LoggerFactory.getLogger(JwtRequestFilter.class);

    @Autowired
    @Qualifier("userDetailServiceImpl")
    private UserDetailsService userDetailsService;

    @Autowired
    private JwtTokenService jwtTokenService;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException {

        final String requestTokenHeader = request.getHeader("Authorization");
        String username = null;
        String jwtToken = null;

        if (requestTokenHeader != null && requestTokenHeader.startsWith("Bearer ")) {
            jwtToken = requestTokenHeader.substring(7);
            try {
                username = jwtTokenService.getUsernameFromToken(jwtToken);
            } catch (IllegalArgumentException e) {
                jwtFilterLogger.warn("Unable to get JWT Token: {}", e.getMessage());
            } catch (ExpiredJwtException e) {
                jwtFilterLogger.warn("JWT Token has expired: {}", e.getMessage());
                request.setAttribute("expired", e.getMessage());
            } catch (Exception e) { // Catching broader exceptions during token parsing
                jwtFilterLogger.error("Error parsing JWT token: {}", e.getMessage());
            }
        } else if (requestTokenHeader != null) {
            jwtFilterLogger.warn("JWT Token does not begin with Bearer String: '{}'", requestTokenHeader);
        }

        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
            UserDetails userDetails = this.userDetailsService.loadUserByUsername(username);
            if (jwtTokenService.validateToken(jwtToken, userDetails)) {
                UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(
                        userDetails, null, userDetails.getAuthorities());
                usernamePasswordAuthenticationToken
                        .setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
                jwtFilterLogger.debug("User '{}' authenticated successfully with JWT.", username);
            } else {
                jwtFilterLogger.warn("Invalid JWT Token for user '{}'. Validation failed.", username);
            }
        }
        chain.doFilter(request, response);
    }
}

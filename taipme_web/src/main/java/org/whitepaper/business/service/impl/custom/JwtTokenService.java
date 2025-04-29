package org.whitepaper.business.service.impl.custom; 

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service; 

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors; 

@Service 
public class JwtTokenService {

    @Value("${jwt.secret}")
    private String secret;

    public static final long JWT_TOKEN_VALIDITY = 5 * 60 * 60 * 1000; 

    // Method to generate token for user
    public String generateToken(UserDetails userDetails) {
        Map<String, Object> claims = new HashMap<>();
         claims.put("roles", userDetails.getAuthorities().stream()
                 .map(GrantedAuthority::getAuthority)
                 .collect(Collectors.toList()));

        return doGenerateToken(claims, userDetails.getUsername());
    }

    // Creation of the JWT
    private String doGenerateToken(Map<String, Object> claims, String subject) {
        return Jwts.builder()
                .setClaims(claims) // Set any custom claims (like roles)
                .setSubject(subject) // Set the principal (username)
                .setIssuedAt(new Date(System.currentTimeMillis())) // Set issue time
                .setExpiration(new Date(System.currentTimeMillis() + JWT_TOKEN_VALIDITY)) // Set expiration time
                .signWith(SignatureAlgorithm.HS512, secret) // Sign the token with your secret key
                .compact(); // Build and compact the token into a string
    }

    // public Boolean validateToken(String token, UserDetails userDetails) { ... }
    // public String getUsernameFromToken(String token) { ... }
    // public Date getExpirationDateFromToken(String token) { ... }
    // public Boolean isTokenExpired(String token) { ... }
}

package org.whitepaper.mobile.dto;

public class JwtResponse {
    private String token;

    // Constructor
    public JwtResponse(String token) {
        this.token = token;
    }

    // Getter (needed by Jackson for serialization)
    public String getToken() {
        return token;
    }
}

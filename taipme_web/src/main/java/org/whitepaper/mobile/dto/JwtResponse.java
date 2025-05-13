package org.whitepaper.mobile.dto;

public class JwtResponse {
    private final String jwttoken;
    private final String username;

    public JwtResponse(String jwttoken, String username) {
        this.jwttoken = jwttoken;
        this.username = username;
    }

    public String getToken() {
        return this.jwttoken;
    }

    public String getUsername() {
        return this.username;
    }
}

package org.whitepaper.utility;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EncoderGenerator {

	public static String encode(String value) {

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedValue = passwordEncoder.encode(value);

		return hashedValue;

	}

	public static boolean isEncodeMatchingDecode(String encode, String decoded) {
		
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();  
		boolean isPasswordMatches = bcrypt.matches(encode, decoded);
		return isPasswordMatches;
	}
}

package org.whitepaper.business.service.impl.login;

import java.util.concurrent.atomic.AtomicLong;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionSignUp;
import org.springframework.social.facebook.api.Facebook;

public class CustomConnectionSignUp implements ConnectionSignUp {
	
	private static Logger logger = LoggerFactory.getLogger(CustomConnectionSignUp.class);

	
	public String executeToRename(Connection<?> connection) {
		//UserProfile profile = connection.fetchUserProfile();
		String user;
		try {    
			
			if(connection.getApi() instanceof Facebook){
				Facebook facebook = (Facebook)connection.getApi();
				//String[] fields = {"id", "name"};
				String[] fields = { "name"};
				 user = facebook.fetchObject(connection.getKey().getProviderUserId(), String.class, fields);
				
				String [] fields2 = { "id", "email",  "first_name", "last_name", "about" , "gender" } ;
				//User userProfile = facebook.fetchObject connection.key.providerUserId, User.class, fields
				String userProfile = facebook.fetchObject( connection.getKey().getProviderUserId(), String.class, fields2) ;
				userProfile.length() ;
				//email = userProfile.email
			}/*else if(connection.api instanceof Google){
				Google google = (Google)connection.api
				Person userProfile = google.plusOperations().googleProfile
				email = userProfile.emailAddresses.iterator().next()
			}*/else{
				throw new UnsupportedOperationException("connection no soportado: " + connection);
			}			
		    //Usuario novo = new Usuario(profile.getUsername(),UUID.randomUUID().toString().replaceAll("-", ""),null,null,false,true);
		//account.insert(novo);
		//return novo.getLogin();
		    return user;
		} catch (Exception e) {
		    return null;
		}
	}
	
	
	private final AtomicLong userIdSequence = new AtomicLong();
	
	public String execute(Connection<?> connection) {
		return null;
	}
	

}


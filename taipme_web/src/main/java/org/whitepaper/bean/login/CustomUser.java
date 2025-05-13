package org.whitepaper.bean.login;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomUser extends User {

   private static final long serialVersionUID = -3531439484732724601L;

   private Integer idUser;;
   
   //username=mail
   public CustomUser(String username, String password, boolean enabled,
	       boolean accountNonExpired, boolean credentialsNonExpired,
	       boolean accountNonLocked,
	       Collection<? extends GrantedAuthority> authorities) {
	        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);	        	        
	}

   public Integer getIdUser() {
	   return idUser;
   }
   public void setIdUser(Integer idUser) {
		this.idUser = idUser;
   }
   
   public static long getSerialversionuid() {
	   return serialVersionUID;
   }
}
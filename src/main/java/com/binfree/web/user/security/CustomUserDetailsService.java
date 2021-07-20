package com.binfree.web.user.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.binfree.web.user.domain.UsersVO;
import com.binfree.web.user.mapper.UsersMapper;
import com.binfree.web.user.service.UsersServiceImpl;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	@Setter(onMethod_= {@Autowired})
	private UsersServiceImpl service;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws
	UsernameNotFoundException{
		
		
		CustomUserDetails user = service.getLoginUserInfo(email);
		
		
		if(user == null) {
			throw new UsernameNotFoundException(email);
		}
		
		log.info(user.getAuthorities());
		
		return user;
		
	}
	
	
}

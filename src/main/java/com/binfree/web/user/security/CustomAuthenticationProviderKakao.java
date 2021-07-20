package com.binfree.web.user.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

public class CustomAuthenticationProviderKakao implements AuthenticationProvider {
	
	@Autowired
	private CustomUserDetailsService service;

	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		

		String email = (String) authentication.getPrincipal();
		System.out.println("!!!!!!!!!!!!!email"+ email);

		String password = (String) authentication.getCredentials();

		System.out.println("1111email======================="+email);
		System.out.println("2222password======================"+password);
		
		CustomUserDetails user = (CustomUserDetails) service.loadUserByUsername(email);

		if(!matchPassword(password, user.getPassword())) {
			throw new BadCredentialsException(email);
		}
		
		if(!user.isEnabled()) {
			throw new BadCredentialsException(email);
		}

		return new UsernamePasswordAuthenticationToken(user, password, user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
	
	private boolean matchPassword(String loginPwd, String password) {
		return loginPwd.equals(password);
	}

}
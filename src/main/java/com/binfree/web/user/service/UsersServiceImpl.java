package com.binfree.web.user.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.binfree.web.user.domain.UsersVO;
import com.binfree.web.user.mapper.UsersMapper;
import com.binfree.web.user.security.CustomUserDetails;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class UsersServiceImpl implements UsersService {

	@Autowired
	private BCryptPasswordEncoder pwencoder;

	@Autowired
	private UsersMapper usersMapper;

	@Autowired
	JavaMailSenderImpl mailSender;

	@Override
	public void userJoin(UsersVO user) throws Exception {
		usersMapper.userJoin(user);
	}

	@Override
	public void insertUserAuth(UsersVO user) throws Exception {
		usersMapper.insertUserAuth(user);
	}

	@Override
	public UsersVO getEmail(UsersVO user) {
		return usersMapper.getEmail(user);
	}

	@Override
	public CustomUserDetails getLoginUserInfo(String email) {

		System.out.println("usersServiceImple 진입 : " + email);

		CustomUserDetails user = new CustomUserDetails();
		user = usersMapper.getLoginUserInfo(email);
		System.out.println("usersServiceImple에서 userMapper 호출  : " + user.getName());

		return user;
	}

	@Override
	public void setModifyUserInfo(UsersVO modifyUserInfo) {

		usersMapper.setModifyUserInfo(modifyUserInfo);
	}

	@Override
	public void setModifyPwd(UsersVO modifyPwd) {
		usersMapper.setModifyPwd(modifyPwd);
	}

	@Override
	public void setModifySubInfo(UsersVO modifySubInfo) {

		usersMapper.setModifySubInfo(modifySubInfo);
	}

	@Override
	public void byeUser(String email) {

		usersMapper.byeUser(email);
	}

	@Override
	public int emailCheck(String email) {
		return usersMapper.emailCheck(email);
	}

	@Override
	public void setSubInfo(UsersVO modifySubInfo) {

		usersMapper.setSubInfo(modifySubInfo);
	}

	@Override
	public int userCount() {
		return usersMapper.userCount();
	}

	@Override
	public UsersVO getUserInfo(String email) {
		return usersMapper.getUserInfo(email);
	}

	@Override
	public void setBuddy(UsersVO vo) {
		usersMapper.setBuddy(vo);
	}

	@Override
	public String findPw(String name, String email) {
		int emailCnt = usersMapper.getUserEmailCnt(email);
		int nameCnt = usersMapper.getUserNameCnt(name);

		if (emailCnt == 0) {
			return "emailNull";
		} else if (nameCnt == 0) {
			return "nameNull";
		}

		return "success";

	}

	@Override
	public int getUserEmailCnt(String email) {
		return usersMapper.getUserEmailCnt(email);
	}

	@Override
	public int getUserNameCnt(String email) {
		return usersMapper.getUserNameCnt(email);
	}

	// 카카오 회원가입
	@Override
	public void userJoinKakao(CustomUserDetails kakaoUser) throws Exception {
		usersMapper.userJoinKakao(kakaoUser);
	}

	// 카카오 프로필 조회
	@Override
	public CustomUserDetails getKakaoUserInfo(String email) {

		return usersMapper.getKakaoUserInfo(email);

	}
}

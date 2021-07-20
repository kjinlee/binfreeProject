package com.binfree.web.user.service;

import com.binfree.web.user.domain.UsersVO;
import com.binfree.web.user.security.CustomUserDetails;

public interface UsersService {

	// 회원가입
	public void userJoin(UsersVO user) throws Exception;

	public void insertUserAuth(UsersVO user) throws Exception;

	public UsersVO getEmail(UsersVO user);

	// 카카오 회원가입
	public void userJoinKakao(CustomUserDetails kakaoUser) throws Exception;

	// 카카오 프로필 조회
	public CustomUserDetails getKakaoUserInfo(String email);

	public CustomUserDetails getLoginUserInfo(String email);

	public UsersVO getUserInfo(String email);

	public void setModifyUserInfo(UsersVO modifyUserInfo);

	public void setModifyPwd(UsersVO modifyPwd);

	public void setModifySubInfo(UsersVO modifySubInfo);

	public void setSubInfo(UsersVO modifySubInfo);

	public void setBuddy(UsersVO vo);

	public void byeUser(String email);

	int emailCheck(String email);

	public int userCount();

	// 이메일발송
	public void sendEmail(UsersVO vo, String pw, String div);

	// 비밀번호찾기
	public void findPw(String name, String email);

	public int getUserEmailCnt(String email);

	public int getUserNameCnt(String email);

}

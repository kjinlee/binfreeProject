package com.binfree.web.user.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.binfree.web.user.domain.UsersVO;
import com.binfree.web.user.security.CustomUserDetails;

@Repository
public interface UsersMapper {

	public UsersVO read(String email);

	// 회원가입
	public void userJoin(UsersVO user);

	public void insertUserAuth(UsersVO user);

	public UsersVO getEmail(UsersVO user);

	// 카카오 회원가입
	public void userJoinKakao(CustomUserDetails kakaoUser);

	// 카카오 프로필 조회
	public CustomUserDetails getKakaoUserInfo(String email);

	//customDetail 정보
	public CustomUserDetails getLoginUserInfo(String email);

	//uservo 정보
	public UsersVO getUserInfo(String email);

	public void setModifyUserInfo(UsersVO modifyUserInfo);

	public void setModifySubInfo(UsersVO modifySubInfo);

	public void setSubInfo(UsersVO modifySubInfo);

	public void setModifyPwd(UsersVO modifyPwd);

	public void setBuddy(UsersVO vo);

	public void byeUser(String email);

	public int emailCheck(String email);

	public int userCount();

	public int getUserEmailCnt(String email);

	public int getUserNameCnt(String email);
}

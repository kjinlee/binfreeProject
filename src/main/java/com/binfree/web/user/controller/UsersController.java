package com.binfree.web.user.controller;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.binfree.web.buddy.service.BuddyService;
import com.binfree.web.main.controller.URLConn;
import com.binfree.web.user.domain.KakaoProfile;
import com.binfree.web.user.domain.OAuthToken;
import com.binfree.web.user.domain.UsersVO;
import com.binfree.web.user.security.CustomUserDetails;
import com.binfree.web.user.service.UsersService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/*")
public class UsersController {

	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder pwencoder;

	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

	@Autowired
	private UsersService usersService;

	@Autowired
	private BuddyService buddyService;

	@Autowired
	private AuthenticationManager authenticationManager;

	@GetMapping("/loginpage")
	public String loginInput(String success, String error, String logout, Model model) {

		log.info("error: " + error);
		log.info("logout: " + logout);

		if (error != null) {
			model.addAttribute("error", "등록되지 않은 아이디나 비밀번호 입니다. 다시 입력해주세요.");
		}

		if (logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다!");
		}

		if (success != null) {

		}

		return "user/login_page";

	}

	@GetMapping("/signup")
	public String signup() {
		return "user/signup";
	}

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(UsersVO user, Model model) throws Exception {

		logger.info("join 진입");

		if (usersService.getEmail(user) == null) {

			String password = user.getPassword();
			password = pwencoder.encode(password);
			user.setPassword(password);
			user.setEnabled(true);
			user.setAuth("ROLE_MEMBER");

			usersService.userJoin(user);

			logger.info("join service 성공");

			model.addAttribute("msg", "회원가입이 완료되었습니다! 로그인 해주시기 바랍니다");
			return "user/login_page";
		} else {
			model.addAttribute("msg", "이미 존재하는 아이디입니다.");
			return "user/signup";
		}
	}

	// 중복 체크
	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	// 메시지 전달을 위해 리턴 타입 String으로 변환
	public String emailCheck(
			@RequestBody String email/* email이 잘 받아와지는 지 확인하시고 안 받아와지면 @RequestParam Map<String, String> paramMap */)
			throws Exception {
		/* email 확인 */
		System.out.println(email);

		/*
		 * email 확인 후 email일 null 일 때는 paramMap으로 매개변수 수정하시고 String email =
		 * paramMap.get("email");
		 */

		int count = 0;
		count = usersService.emailCheck(email);
		System.out.println(count);
		// 고기천 추가
		if (count == 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 카카오 로그인
	@GetMapping(value = "/kakao/callback", produces = "application/json; charset=utf8")
	public String kakaoCallback(String code, HttpServletRequest request, Model model) throws Exception { // Data를 리턴해주는
																											// 컨트롤러 함수

		// POST 방식으로 key=value 데이터를 요청(카카오쪽으로)
		RestTemplate rt = new RestTemplate();
		// HttpHeaders 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "858c3d8b6a1fe9814e96f3b2dbb03e09");
		params.add("redirect_uri ", "http://52.14.170.10:8080/BinFreeProject/user/kakao/callback");
		params.add("code", code);

		// HttpHeader 와 HttpBody 를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		// Http 요청하기 -Post 방식으로 -그리고 response 변수의 응답 받음
		ResponseEntity<String> response = rt.exchange("Https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);

		// Gson, Json Simple, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		System.out.println("카카오 엑세스 토큰:" + oauthToken.getAccess_token());

		RestTemplate rt2 = new RestTemplate();
		// HttpHeaders 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpHeader 와 HttpBody 를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);

		System.out.println(kakaoProfileRequest2);

		// Http 요청하기 -Post 방식으로 -그리고 response 변수의 응답 받음
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoProfileRequest2, String.class);
		System.out.println(response2.getBody());

		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		// User 오브젝트 : username,password,email
		System.out.println("카카오 아이디(번호) : " + kakaoProfile.getId());
		System.out.println("카카오 이메일 : " + kakaoProfile.getKakao_account().getEmail());

//				System.out.println("빈프리서버 유저네임: " + kakaoProfile.getKakao_account().getEmail()+"_"+kakaoProfile.getId());
		System.out.println("빈프리서버 이메일:" + kakaoProfile.getKakao_account().getEmail());

		String garbagePassword = UUID.randomUUID().toString();
		garbagePassword = pwencoder.encode(garbagePassword);
		System.out.println("블로그서버 패스워드:" + garbagePassword);

		CustomUserDetails kakaoUser = CustomUserDetails.builder().email(kakaoProfile.getKakao_account().getEmail())
				.password(garbagePassword.toString()).build();

		// 가입자 혹은 비가입자 체크 해서 처리
//				System.out.println(kakaoUser.getEmail());

		kakaoUser.setName(kakaoProfile.getProperties().nickname);

		CustomUserDetails originUser = usersService.getKakaoUserInfo(kakaoUser.getEmail());

		if (originUser == null) {
			System.out.println("기존 회원입니다.");
			usersService.userJoinKakao(kakaoUser);
			originUser = usersService.getKakaoUserInfo(kakaoUser.getEmail());
		}

		// 로그인 처리
		Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
				originUser.getEmail(), originUser.getPassword(), originUser.getAuthorities()));
		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:/";

	}

	@GetMapping("/mypage")
	public String goMypage(Model model) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		CustomUserDetails loginUserVO = (CustomUserDetails) authentication.getPrincipal();

		CustomUserDetails loginUserInfo = new CustomUserDetails();
		loginUserInfo = usersService.getLoginUserInfo(loginUserVO.getUsername());

		model.addAttribute("userInfo", loginUserInfo);
		model.addAttribute("myBuddyInfo", buddyService.get(loginUserInfo.getMyBuddy()));

		return "user/mypage";
	}

	@ResponseBody
	@PostMapping("/modify_userInfo")
	public void modifyUserInfo(@RequestBody Map<String, String> paramMap) {

		UsersVO modifyUserInfo = new UsersVO();

		modifyUserInfo.setEmail(paramMap.get("email"));
		modifyUserInfo.setPhone(paramMap.get("phone"));

		usersService.setModifyUserInfo(modifyUserInfo);

	}

	@ResponseBody
	@PostMapping("/modify_subInfo")
	public void modifySubInfo(@RequestBody Map<String, String> paramMap, HttpServletRequest request) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUserDetails loginUserVO = (CustomUserDetails) authentication.getPrincipal();
		CustomUserDetails loginUserInfo = new CustomUserDetails();

		loginUserInfo = usersService.getLoginUserInfo(loginUserVO.getUsername());

		UsersVO modifySubInfo = new UsersVO();

		modifySubInfo.setEmail(loginUserInfo.getEmail());
		modifySubInfo.setSubName(paramMap.get("subName"));
		modifySubInfo.setSubPhone(paramMap.get("subPhone"));
		modifySubInfo.setZipCode(paramMap.get("zipCode"));
		modifySubInfo.setLoc(paramMap.get("loc"));
		modifySubInfo.setInputLoc(paramMap.get("inputLoc"));

		System.out.println(modifySubInfo);

		usersService.setModifySubInfo(modifySubInfo);

	}

	@ResponseBody
	@PostMapping("/modify_pwd")
	public void modifyPwd(@RequestBody String getPwd, HttpServletRequest request) {

		log.info("getPwd : " + getPwd);

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUserDetails loginUserVO = (CustomUserDetails) authentication.getPrincipal();
		CustomUserDetails loginUserInfo = new CustomUserDetails();

		loginUserInfo = usersService.getLoginUserInfo(loginUserVO.getUsername());

		UsersVO modifyPwd = new UsersVO();

		String password = pwencoder.encode(getPwd);
		modifyPwd.setEmail(loginUserInfo.getEmail());
		modifyPwd.setPassword(password);

		usersService.setModifyPwd(modifyPwd);

	}

	@ResponseBody
	@PostMapping("/bye_user")
	public void byeUser(@RequestBody String getEmail) {
		System.out.println(getEmail);
		usersService.byeUser(getEmail);
		SecurityContextHolder.clearContext();
	}

	@RequestMapping(value = "/start", method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public String startApp(@RequestBody String body) {
		System.out.println(body);
		log.info(body);

		return "/";
	}

	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public String findpwGet() {
		
		return "/user/findpw";
	}

	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
	@ResponseBody
	public String findpwPost(Locale locale, String name, String email) {
		UsersVO user = usersService.getUserInfo(email);
		String result = usersService.findPw(name, email);
		
		try {
			
			if(result.equals("success")) {
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);

				}

				String password = pwencoder.encode(pw);
				user.setPassword(password);

				usersService.setModifyPwd(user);
				JSONObject info = new JSONObject();
				info.put("password", pw);
				info.put("name", name);
				info.put("email", email);

				URLConn conn = new URLConn("http://127.0.0.1", 1516);
				conn.urlPost(info);
			} else if(result.equals("emailNull")){
				return "emailNull";
			} else if(result.equals("nameNull")) {
				return "nameNull";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";

	}
	
}

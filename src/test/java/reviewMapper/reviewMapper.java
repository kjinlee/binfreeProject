package reviewMapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import com.binfree.web.review.mapper.ReviewMapper;
import com.binfree.web.review.service.ReviewServiceImpl;
import com.binfree.web.user.security.CustomUserDetailsService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class reviewMapper {
	
	@Setter(onMethod_ = {@Autowired})
	ReviewMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	ReviewServiceImpl service;
	
	@Setter(onMethod_ = {@Autowired})
	CustomUserDetailsService sevice;
	
	@Test
	public void getInfoTest() {
		
		
		log.info("5점 개수"+mapper.getStarNum(5));
		
	}
	
	
}

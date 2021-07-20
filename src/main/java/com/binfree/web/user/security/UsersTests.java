package com.binfree.web.user.security;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/Webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class UsersTests {
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	
	@Test
	public void testInsertMember() {
		
		
		
		String sql="insert into USERS values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		

		for(int i =1; i <=10; i++) {
			Connection con = null;
			PreparedStatement pstmt =null;
			
			try {
				con=ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(3, pwencoder.encode("pw" + i));
				
				if(i<8) {
					pstmt.setInt(1,i);
					pstmt.setString(2,"user"+i);
					pstmt.setString(4,"일반사용자" +i);
					pstmt.setString(5, "010-7777-7777");
					pstmt.setString(6, "18759");
					pstmt.setString(7,"광진구");
					pstmt.setString(8,"중곡동 ");
					pstmt.setDate(9,null);
					pstmt.setDate(10,null);
					pstmt.setString(11,null);
					pstmt.setString(12,"1");
					pstmt.setString(13,"1");
					pstmt.setString(14, "ROLE_MEMBER");

				}else {
					pstmt.setInt(1,i);
					pstmt.setString(2,"admin"+i);
					pstmt.setString(4,"관리자" +i);
					pstmt.setString(5, "010-2222-2222");
					pstmt.setString(6, "39403");
					pstmt.setString(7,"광진구");
					pstmt.setString(8,"구의동 ");
					pstmt.setDate(9,null);
					pstmt.setDate(10,null);
					pstmt.setDate(11,null);
					pstmt.setString(12,"N");
					pstmt.setString(13,"1");
					pstmt.setString(14, "ROLE_MEMBER");
					
				}
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt !=null ) {try {pstmt.close(); }catch(Exception e) {} }
				if(con != null) {try {con.close(); } catch(Exception e) {} }
				
			}// end for
		}
	}
	
	@Test
	public void testInsertAuth() {
		
		
		
		String sql="insert into USERS_auth(id,email,auth) values(?,?,?)";
		

		for(int i =1; i <=10; i++) {
			Connection con = null;
			PreparedStatement pstmt =null;
			
			try {
				con=ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				
				if(i<8) {
					pstmt.setInt(1,i);
					pstmt.setString(2,"user"+i);
					pstmt.setString(3,"ROLE_MEMBER");
					


				}else {
					pstmt.setInt(1,i);
					pstmt.setString(2,"admin"+i);
					pstmt.setString(3,"ROLE_ADMIN");
					
				}
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt !=null ) {try {pstmt.close(); }catch(Exception e) {} }
				if(con != null) {try {con.close(); } catch(Exception e) {} }
				
			}// end for
		}
	}
}

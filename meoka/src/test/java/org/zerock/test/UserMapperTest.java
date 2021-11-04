package org.zerock.test;

/*
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.UserVO;
import org.zerock.mapper.UserMapper;

@RunWith(SpringJUnit4ClassRunner.class)*/
// @ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
/*
public class UserMapperTest {

   @Autowired
   private UserMapper usermapper;
   
   @Test
   public void testFactory(){
      
      System.out.println(usermapper);
      
   }
   
   @Test
   public void testSession()throws Exception{
      
      UserVO user = new UserVO();
      
      user.setmemberId("test");
      user.setmemberPw("test");
      
      usermapper.userJoin(user);
   }
}
*/

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import org.zerock.domain.UserVO;
import org.zerock.mapper.UserMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTest {

   @Autowired
   private UserMapper Usermapper;         //MemberMapper.java 인터페이스 의존성 주입
   
   //회원가입 쿼리 테스트 메서드
   @Test
   public void memberJoin() throws Exception{
      UserVO member = new UserVO();
      
      member.setMemberId("test");         //회원 id
      member.setPassword("test");         //회원 비밀번호
      member.setMemberType("test");
    
     Usermapper.userJoin(member);         //쿼리 메서드 실행
      
   }
   
   
   
} 







package org.zerock.service;

import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import java.util.Date;


public interface UserService {

  public UserVO login(LoginDTO dto) throws Exception;

  public void keepLogin(String uid, String sessionId, Date next)throws Exception;
  
  public UserVO checkLoginBefore(String value);
  // 회원가입
  public void userJoin(UserVO user);  
  
  // 아이디 중복 체크
  public int idChk(UserVO user) throws Exception;
  
  // 회원정보 수정
  public void userUpdate(UserVO vo) throws Exception;

  // 회원탈퇴
  public void userDelete(UserVO vo) throws Exception;
  
  // 아이디 찾기
  public UserVO findId(UserVO vo);
  
  // 임시비밀번호 설정
  public UserVO updateRandomPw(UserVO vo);

}

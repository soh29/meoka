package org.zerock.persistence;

import java.util.Date;
import java.util.List;

import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

public interface UserDAO {

	public UserVO login(LoginDTO dto) throws Exception;

	public void keepLogin(String uid, String sessionId, Date next);

	public UserVO checkUserWithSessionKey(String value);

	// 회원가입
	public void userJoin(UserVO user);
	
	// 아이디 중복 체크
	public int idChk(UserVO user) throws Exception;

	// 회원정보 수정
	public void userUpdate(UserVO vo) throws Exception;
	
	// 회원 탈퇴
	public void userDelete(UserVO vo)throws Exception;
	
	// 아이디 찾기
	public UserVO findId(UserVO vo);
	
	// 임시비밀번호 설정
	public UserVO updateRandomPw(UserVO vo);
	
	// 회원리스트 확인
	public List<UserVO> getUserList() throws Exception;
	public UserVO getUserDetail(String memberId) throws Exception;

	// 관리자용 수정 및 탈퇴
	public void adminUserUpdate(UserVO vo) throws Exception;
	public void adminUserDelete(UserVO vo) throws Exception;
}

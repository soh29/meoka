package org.zerock.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace ="org.zerock.mapper.UserMapper";

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		
		return session.selectOne(namespace +".login", dto);
	}
	
  @Override
  public void keepLogin(String uid, String sessionId, Date next) {

    Map<String, Object> paramMap = new HashMap<String, Object>();
    paramMap.put("uid", uid);
    paramMap.put("sessionId", sessionId);
    paramMap.put("next", next);
    
    session.update(namespace+".keepLogin", paramMap);
    
  }

  @Override
  public UserVO checkUserWithSessionKey(String value) {

    return session.selectOne(namespace +".checkUserWithSessionKey", value);
  }

	@Override
	public void userJoin(UserVO user) {
		// TODO Auto-generated method stub
		session.insert(namespace + ".userJoin", user);
	}
	
	@Override
	public int idChk(UserVO user) throws Exception {
		int result = session.selectOne(namespace + ".idChk", user);
		return result;
	}

	@Override
	public void userUpdate(UserVO vo) throws Exception {
		session.update(namespace + ".userUpdate", vo);		
	}		

	@Override
	public void userDelete(UserVO vo) throws Exception {
		session.delete(namespace + ".userDelete", vo);		
	}
	
	@Override
	public UserVO findId(UserVO vo) {
		return session.selectOne(namespace + ".findId", vo);
	}
	
	@Override
	public UserVO updateRandomPw(UserVO vo) {
		return session.selectOne(namespace + ".updateRandomPw", vo);
	}

}

package org.zerock.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.zerock.mapper.UserMapper;
import org.zerock.persistence.UserDAO;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;


@Service
public class UserServiceImpl implements UserService {

  @Autowired
  UserDAO dao;

  @Override
  public void userJoin(UserVO user) {
	  dao.userJoin(user);
	  //dao.
  }
  @Override
  public UserVO login(LoginDTO dto) throws Exception {

    return dao.login(dto);
  }
    
  
  @Override
  public void keepLogin(String uid, String sessionId, Date next)
      throws Exception {
    
    dao.keepLogin(uid, sessionId, next);
    
  }

  @Override
  public UserVO checkLoginBefore(String value) {
    
    return dao.checkUserWithSessionKey(value);
  }

}

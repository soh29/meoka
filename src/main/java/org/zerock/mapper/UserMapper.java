package org.zerock.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;


public interface UserMapper {

	public UserVO login(LoginDTO dto) throws Exception;

	public void userJoin(UserVO user);
   
}



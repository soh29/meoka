package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.CommentVO;
import org.zerock.domain.PagingVO;
import org.zerock.domain.UserVO;

@Repository
public class CommentDAOImpl implements CommentDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "org.zerock.mapper.CommentMapper";

  @Override
  public List<CommentVO> list(Integer bno) throws Exception {

    return session.selectList(namespace + ".list", bno);
  }

  @Override
  public List<CommentVO> list2(String memberid) throws Exception {

    return session.selectList(namespace + ".list2", memberid);
  }
  
  @Override
  public void create(CommentVO vo) throws Exception {

    session.insert(namespace + ".create", vo);
  }

  @Override
  public void update(CommentVO vo) throws Exception {

    session.update(namespace + ".update", vo);
  }

  @Override
  public void delete(Integer cno) throws Exception {

    session.update(namespace + ".delete", cno);
  }

  @Override
  public List<CommentVO> listPage(Integer bno, PagingVO pagingVO) throws Exception {

    Map<String, Object> map = new HashMap<>();

    map.put("bno", bno);
    map.put("pagingVO", pagingVO);

    return session.selectList(namespace + ".listPage", map);
  }

  @Override
  public int count(Integer bno) throws Exception {

    return session.selectOne(namespace + ".count", bno);

  }

  @Override
  public int getBno(Integer cno) throws Exception {

    return session.selectOne(namespace + ".getBno", cno);
  }

@Override
public int getGroupOrderPosition(CommentVO vo) {
	// TODO Auto-generated method stub
	return session.selectOne(namespace + ".getGroupOrderPosition", vo);
}

@Override
public int getMaxGroupOrder(CommentVO vo) {
	// TODO Auto-generated method stub
	return session.selectOne(namespace + ".getMaxGroupOrder", vo);
}

@Override
public void updateGroupOrder(CommentVO vo) {
	// TODO Auto-generated method stub
	session.update(namespace + ".updateGroupOrder", vo);
	
}

@Override
public void reply(CommentVO vo) {
	// TODO Auto-generated method stub
	session.insert(namespace + ".reply", vo);
}

@Override
public void deleteComment(int bno) {
	// TODO Auto-generated method stub
	session.delete(namespace + ".deleteCommentByBno", bno);
}

  
}

package org.zerock.persistence;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PagingVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "org.zerock.mapper.BoardMapper";

  @Override
  public List<BoardVO> selectBoardList() throws Exception {

    return session.selectList(namespace + ".selectBoardList");
  }

@Override
public void register(BoardVO vo) throws Exception {
	// TODO Auto-generated method stub
	session.insert(namespace + ".register", vo);
}

@Override
public BoardVO read(int bno) throws Exception {
	// TODO Auto-generated method stub
	return session.selectOne(namespace + ".read", bno);
}

@Override
public void updateViewCnt(int bno) throws Exception {
	// TODO Auto-generated method stub
	session.update(namespace + ".updateViewCnt", bno);
}
@Override
public void modify(BoardVO vo) throws Exception {
	// TODO Auto-generated method stub
	session.update(namespace + ".modify", vo);
}

@Override
public void delete(int bno) throws Exception {
	// TODO Auto-generated method stub
	session.delete(namespace + ".delete", bno);
}


@Override
public List<BoardVO> listAll(String searchOption, String keyword) throws Exception {
	// TODO Auto-generated method stub
	Map<String, String> map = new HashMap<String, String>();
	map.put("searchOption", searchOption);
	map.put("keyword", keyword);
	return session.selectList(namespace + ".listAll", map);
}

@Override
public int countArticle(String searchOption, String keyword) throws Exception {
	// TODO Auto-generated method stub
	Map<String, String> map = new HashMap<String, String>();
	map.put("searchOption", searchOption);
	map.put("keyword", keyword);
	return session.selectOne(namespace + ".countArticle", map);
}

@Override
public int countBoard() throws Exception {
	// TODO Auto-generated method stub
	return session.selectOne(namespace + ".countBoard");
}

@Override
public List<BoardVO> selectBoard(PagingVO vo) throws Exception {
	// TODO Auto-generated method stub
	return session.selectList(namespace + ".listAll");
}

@Override
public List<BoardVO> listAll(String searchOption, String keyword, int start, int end) {
	Map<String, String> map = new HashMap<String, String>();
	map.put("searchOption", searchOption);
	map.put("keyword", keyword);
	map.put("start", start + "");
	map.put("end", end + "");
	return session.selectList(namespace + ".listAll", map);
}

@Override
public void reply(BoardVO vo) {
	// TODO Auto-generated method stub

	session.insert(namespace + ".reply", vo);
}

@Override
public int getGroupOrderPosition(BoardVO vo) {
	// TODO Auto-generated method stub
	return session.selectOne(namespace + ".getGroupOrderPosition", vo);
}

@Override
public int getMaxGroupOrder(BoardVO vo) {
	// TODO Auto-generated method stub
	return session.selectOne(namespace + ".getMaxGroupOrder", vo);
}

@Override
public void updateGroupOrder(BoardVO vo) {
	// TODO Auto-generated method stub
	session.update(namespace + ".updateGroupOrder", vo);
	
}

@Override
public void updateCommentCnt(Integer bno, int amount) {
	// TODO Auto-generated method stub
	Map<String, Object> map = new HashMap<String, Object>();

    map.put("bno", bno);
    map.put("amount", amount);
	session.update(namespace + ".updateCommentCnt", map);
}




@Override
public void addAttach(String fullName) throws Exception {
  
  session.insert(namespace+".addAttach", fullName);
  
}


@Override
public List<String> getAttach(Integer bno) throws Exception {
  
  return session.selectList(namespace +".getAttach", bno);
}



@Override
public void deleteAttach(Integer bno) throws Exception {

  session.delete(namespace+".deleteAttach", bno);
  
}

@Override
public void replaceAttach(String fullName, Integer bno) throws Exception {
  
  Map<String, Object> paramMap = new HashMap<String, Object>();
  
  paramMap.put("bno", bno);
  paramMap.put("fullName", fullName);
  
  session.insert(namespace+".replaceAttach", paramMap);
  
}

}

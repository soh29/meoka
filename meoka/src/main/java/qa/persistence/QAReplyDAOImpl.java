package qa.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import qa.domain.Criteria;
import qa.domain.QAReplyVO;

@Repository
public class QAReplyDAOImpl implements QAReplyDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "qa.mapper.QAReplyMapper";

  @Override
  public List<QAReplyVO> list(Integer bno) throws Exception {

    return session.selectList(namespace + ".list", bno);
  }

  @Override
  public void create(QAReplyVO vo) throws Exception {

    session.insert(namespace + ".create", vo);
  }

  @Override
  public void update(QAReplyVO vo) throws Exception {

    session.update(namespace + ".update", vo);
  }

  @Override
  public void delete(Integer rno) throws Exception {

    session.update(namespace + ".delete", rno);
  }

  @Override
  public List<QAReplyVO> listPage(Integer bno, Criteria cri) throws Exception {

    Map<String, Object> paramMap = new HashMap<>();

    paramMap.put("bno", bno);
    paramMap.put("cri", cri);

    return session.selectList(namespace + ".listPage", paramMap);
  }

  @Override
  public int count(Integer bno) throws Exception {

    return session.selectOne(namespace + ".count", bno);

  }

  @Override
  public int getBno(Integer rno) throws Exception {

    return session.selectOne(namespace + ".getBno", rno);
  }
  
  
}

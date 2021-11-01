package qa.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import qa.domain.QAVO;
import qa.domain.Criteria;
import qa.domain.SearchCriteria;

@Repository
public class QADAOImpl implements QADAO {

  @Inject
  private SqlSession session;

  private static String namespace = "qa.mapper.QAMapper";

  @Override
  public void create(QAVO vo) throws Exception {
    session.insert(namespace + ".qa_create", vo);
  }

  @Override
  public QAVO read(Integer bno) throws Exception {
    return session.selectOne(namespace + ".qa_read", bno);
  }

  @Override
  public void update(QAVO vo) throws Exception {
    session.update(namespace + ".qa_update", vo);
  }

  @Override
  public void delete(Integer bno) throws Exception {
    session.delete(namespace + ".qa_delete", bno);
  }

  @Override
  public List<QAVO> listAll() throws Exception {
    return session.selectList(namespace + ".qa_listAll");
  }

  @Override
  public List<QAVO> listPage(int page) throws Exception {

    if (page <= 0) {
      page = 1;
    }

    page = (page - 1) * 10;

    return session.selectList(namespace + ".qa_listPage", page);
  }

  @Override
  public List<QAVO> listCriteria(Criteria cri) throws Exception {

    return session.selectList(namespace + ".qa_listCriteria", cri);
  }

  @Override
  public int countPaging(Criteria cri) throws Exception {

    return session.selectOne(namespace + ".qa_countPaging", cri);
  }

  @Override
  public List<QAVO> listSearch(SearchCriteria cri) throws Exception {

    return session.selectList(namespace + ".qa_listSearch", cri);
  }

  @Override
  public int listSearchCount(SearchCriteria cri) throws Exception {

    return session.selectOne(namespace + ".qa_listSearchCount", cri);
  }

  @Override
  public void updateReplyCnt(Integer bno, int amount) throws Exception {

    Map<String, Object> paramMap = new HashMap<String, Object>();

    paramMap.put("bno", bno);
    paramMap.put("amount", amount);

    session.update(namespace + ".qa_updateReplyCnt", paramMap);
  }

  @Override
  public void updateViewCnt(Integer bno) throws Exception {
    
    session.update(namespace+".qa_updateViewCnt", bno);
    
  }


  @Override
  public void addAttach(String fullName) throws Exception {
    
    session.insert(namespace+".qa_addAttach", fullName);
    
  }
  
  @Override
  public List<String> getAttach(Integer bno) throws Exception {
    
    return session.selectList(namespace +".qa_getAttach", bno);
  }
 

  @Override
  public void deleteAttach(Integer bno) throws Exception {

    session.delete(namespace+".qa_deleteAttach", bno);
    
  }

  @Override
  public void replaceAttach(String fullName, Integer bno) throws Exception {
    
    Map<String, Object> paramMap = new HashMap<String, Object>();
    
    paramMap.put("bno", bno);
    paramMap.put("fullName", fullName);
    
    session.insert(namespace+".qa_replaceAttach", paramMap);
    
  }

}

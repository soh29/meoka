package qa.persistence;

import java.util.List;

import qa.domain.QAVO;
import qa.domain.Criteria;
import qa.domain.SearchCriteria;

public interface QADAO {

  public void create(QAVO vo) throws Exception;

  public QAVO read(Integer bno) throws Exception;

  public void update(QAVO vo) throws Exception;

  public void delete(Integer bno) throws Exception;

  public List<QAVO> listAll() throws Exception;

  public List<QAVO> listPage(int page) throws Exception;

  public List<QAVO> listCriteria(Criteria cri) throws Exception;

  public int countPaging(Criteria cri) throws Exception;
  
  //use for dynamic sql
  
  public List<QAVO> listSearch(SearchCriteria cri)throws Exception;
  
  public int listSearchCount(SearchCriteria cri)throws Exception;
  
  
  public void updateReplyCnt(Integer bno, int amount)throws Exception;
  
  
  public void updateViewCnt(Integer bno)throws Exception;
  
  public void addAttach(String fullName)throws Exception;
  
  public List<String> getAttach(Integer bno)throws Exception;  
   
  public void deleteAttach(Integer bno)throws Exception;
  
  public void replaceAttach(String fullName, Integer bno)throws Exception;
  
}

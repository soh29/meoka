package qa.service;

import java.util.List;

import qa.domain.QAVO;
import qa.domain.Criteria;
import qa.domain.SearchCriteria;

public interface QAService {

  public void regist(QAVO board) throws Exception;

  public QAVO read(Integer bno) throws Exception;

  public void modify(QAVO board) throws Exception;

  public void remove(Integer bno) throws Exception;

  public List<QAVO> listAll() throws Exception;

  public List<QAVO> listCriteria(Criteria cri) throws Exception;

  public int listCountCriteria(Criteria cri) throws Exception;

  public List<QAVO> listSearchCriteria(SearchCriteria cri) 
      throws Exception;

  public int listSearchCount(SearchCriteria cri) throws Exception;
  
  
  public List<String> getAttach(Integer bno)throws Exception;
  

}

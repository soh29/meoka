package qa.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import qa.domain.QAVO;
import qa.domain.Criteria;
import qa.domain.SearchCriteria;
import qa.persistence.QADAO;

@Service
public class QAServiceImpl implements QAService {

  @Inject
  private QADAO dao;

  
  @Transactional
  @Override
  public void regist(QAVO qa) throws Exception {
  
    dao.create(qa);
    
    String[] files = qa.getFiles();
    
    if(files == null) { return; } 
    
    for (String fileName : files) {
      dao.addAttach(fileName);
    }   
  }
  
  //
//  @Override
//  public void regist(QAVO qa) throws Exception {
//    dao.create(qa);
//  }

//  @Override
//  public QAVO read(Integer bno) throws Exception {
//    return dao.read(bno);
//  }


  @Transactional(isolation=Isolation.READ_COMMITTED)
  @Override
  public QAVO read(Integer bno) throws Exception {
    dao.updateViewCnt(bno);
    return dao.read(bno);
  }

  
//  @Override
//  public void modify(QAVO qa) throws Exception {
//    dao.update(qa);
//  }
  
  @Transactional
  @Override
  public void modify(QAVO qa) throws Exception {
    dao.update(qa);
    
    Integer bno = qa.getBno();
    
    dao.deleteAttach(bno);
    
    String[] files = qa.getFiles();
    
    if(files == null) { return; } 
    
    for (String fileName : files) {
      dao.replaceAttach(fileName, bno);
    }
  }
  

//  @Override
//  public void remove(Integer bno) throws Exception {
//    dao.delete(bno);
//  }
  
  
  @Transactional
  @Override
  public void remove(Integer bno) throws Exception {
    dao.deleteAttach(bno);
    dao.delete(bno);
  } 

  @Override
  public List<QAVO> listAll() throws Exception {
    return dao.listAll();
  }

  @Override
  public List<QAVO> listCriteria(Criteria cri) throws Exception {

    return dao.listCriteria(cri);
  }

  @Override
  public int listCountCriteria(Criteria cri) throws Exception {

    return dao.countPaging(cri);
  }

  @Override
  public List<QAVO> listSearchCriteria(SearchCriteria cri) throws Exception {
	System.out.println("***listSearchCriteria***");
    return dao.listSearch(cri);
  }

  @Override
  public int listSearchCount(SearchCriteria cri) throws Exception {

    return dao.listSearchCount(cri);
  }
  

  @Override
  public List<String> getAttach(Integer bno) throws Exception {
    
    return dao.getAttach(bno);
  }   

}

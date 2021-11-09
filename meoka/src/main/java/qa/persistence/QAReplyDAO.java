package qa.persistence;

import java.util.List;

import qa.domain.Criteria;
import qa.domain.QAReplyVO;

public interface QAReplyDAO {

  public List<QAReplyVO> list(Integer bno) throws Exception;

  public void create(QAReplyVO vo) throws Exception;

  public void update(QAReplyVO vo) throws Exception;

  public void delete(Integer rno) throws Exception;

  public List<QAReplyVO> listPage(Integer bno, Criteria cri) throws Exception;

  public int count(Integer bno) throws Exception;

  public int getBno(Integer rno) throws Exception;

}

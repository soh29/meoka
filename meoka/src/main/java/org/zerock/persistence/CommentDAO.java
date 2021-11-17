package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.CommentVO;
import org.zerock.domain.PagingVO;

public interface CommentDAO {

  public List<CommentVO> list(Integer bno) throws Exception;

  public void create(CommentVO vo) throws Exception;

  public void update(CommentVO vo) throws Exception;

  public void delete(Integer cno) throws Exception;

  public List<CommentVO> listPage(Integer bno, PagingVO pagingVO) throws Exception;

  public int count(Integer bno) throws Exception;

  public int getBno(Integer cno) throws Exception;

public int getGroupOrderPosition(CommentVO vo);

public int getMaxGroupOrder(CommentVO vo);

public void updateGroupOrder(CommentVO vo);

public void reply(CommentVO vo);

public void deleteComment(int bno);

}

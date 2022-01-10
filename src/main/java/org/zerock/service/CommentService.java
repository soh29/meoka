package org.zerock.service;

import java.util.List;

import org.zerock.domain.CommentVO;
import org.zerock.domain.PagingVO;

public interface CommentService {

  public void addComment(CommentVO vo) throws Exception;

  public List<CommentVO> listComment(Integer bno) throws Exception;

  public void modifyComment(CommentVO vo) throws Exception;

  public void removeComment(Integer cno) throws Exception;

  public List<CommentVO> listCommentPage(Integer bno, PagingVO pagingVO) 
      throws Exception;

  public int count(Integer bno) throws Exception;
  public void replyComment(CommentVO vo);
  
  public List<CommentVO> listComment2(String memberid) throws Exception;
}

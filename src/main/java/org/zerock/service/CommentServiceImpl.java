package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.CommentVO;
import org.zerock.domain.PagingVO;
import org.zerock.domain.UserVO;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	private CommentDAO commentDAO;

	@Inject
	private BoardDAO boardDAO;

	@Transactional
	@Override
	public void addComment(CommentVO vo) throws Exception {
		// System.out.println("service*****************vo.getBno(): " + vo.getBno());
		commentDAO.create(vo);
		boardDAO.updateCommentCnt(vo.getBno(), 1);
	}

	@Transactional
	@Override
	public void removeComment(Integer cno) throws Exception {

		int bno = commentDAO.getBno(cno);
		commentDAO.delete(cno);
		boardDAO.updateCommentCnt(bno, -1);
	}

	@Override
	public List<CommentVO> listComment(Integer bno) throws Exception {

		return commentDAO.list(bno);
	}
	
	@Override
	public List<CommentVO> listComment2(String memberid) throws Exception {

		return commentDAO.list2(memberid);
	}

	@Override
	public void modifyComment(CommentVO vo) throws Exception {

		commentDAO.update(vo);
	}
	


	@Override
	public List<CommentVO> listCommentPage(Integer bno, PagingVO pagingVO) throws Exception {

		return commentDAO.listPage(bno, pagingVO);
	}

	@Override
	public int count(Integer bno) throws Exception {

		return commentDAO.count(bno);
	}

	@Override
	public void replyComment(CommentVO vo) {
		// TODO Auto-generated method stub
		int groupOrderPosition = commentDAO.getGroupOrderPosition(vo);
		if(groupOrderPosition == 0) {
			int maxGroupOrder = commentDAO.getMaxGroupOrder(vo);
			vo.setGrouporder(maxGroupOrder);
		} else {
			vo.setGrouporder(groupOrderPosition);
			commentDAO.updateGroupOrder(vo);
		}
		commentDAO.reply(vo);

		boardDAO.updateCommentCnt(vo.getBno(), 1);
		
	}

}

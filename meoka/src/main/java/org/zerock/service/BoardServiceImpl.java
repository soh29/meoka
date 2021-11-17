package org.zerock.service;

import java.util.List;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PagingVO;
import org.zerock.persistence.BoardDAO;

@Service
//@Configuration
//@MapperScan("org.zerock.mapper")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;

	@Override
	@Transactional
	public List<BoardVO> selectBoardList() throws Exception {
		return boardDAO.selectBoardList();
	}

	@Override
	public void register(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.register(vo);
	    String[] files = vo.getFiles();
	    
	    if(files == null) { return; } 
	    
	    for (String fileName : files) {
	      boardDAO.addAttach(fileName);
	    }  
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.updateViewCnt(bno);
		return boardDAO.read(bno);
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.modify(vo);
		
	    Integer bno = vo.getBno();
	    
	    boardDAO.deleteAttach(bno);
	    
	    String[] files = vo.getFiles();
	    
	    if(files == null) { return; } 
	    
	    for (String fileName : files) {
	      boardDAO.replaceAttach(fileName, bno);
	    }
	}

	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.deleteAttach(bno);
		boardDAO.delete(bno);
	}

	@Override
	public List<BoardVO> listAll(String searchOption, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.listAll(searchOption, keyword);
	}

	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.countArticle(searchOption, keyword);
	}

	@Override
	public int countBoard() throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.countBoard();
	}

	@Override
	public List<BoardVO> selectBoard(PagingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectBoard(vo);
	}

	@Override
	public List<BoardVO> listAll(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		return boardDAO.listAll(searchOption, keyword, start, end);
	}

	@Override
	public void reply(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		int groupOrderPosition = boardDAO.getGroupOrderPosition(vo);
		if(groupOrderPosition == 0) {
			int maxGroupOrder = boardDAO.getMaxGroupOrder(vo);
			vo.setGrouporder(maxGroupOrder);
		} else {
			vo.setGrouporder(groupOrderPosition);
			boardDAO.updateGroupOrder(vo);
		}
		boardDAO.reply(vo);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.getAttach(bno);
	}

}

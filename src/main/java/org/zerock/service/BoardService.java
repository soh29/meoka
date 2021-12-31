package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.PagingVO;

public interface BoardService {
	List<BoardVO> selectBoardList() throws Exception;
	void register(BoardVO vo) throws Exception;
	BoardVO read(int bno) throws Exception;
	void modify(BoardVO vo) throws Exception;
	void delete(int bno) throws Exception;
	
	public List<BoardVO> listAll(String searchOption, String keyword) throws Exception;
	public int countArticle(String searchOption, String keyword) throws Exception;

	public int countBoard() throws Exception;
	public List<BoardVO> selectBoard(PagingVO vo) throws Exception;
	List<BoardVO> listAll(String searchOption, String keyword, int start, int end);

	public void reply(BoardVO vo) throws Exception;
	
	List<String> getAttach(Integer bno) throws Exception;

}

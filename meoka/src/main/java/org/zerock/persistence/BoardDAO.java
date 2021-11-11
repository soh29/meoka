package org.zerock.persistence;

import java.util.List;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PagingVO;

public interface BoardDAO {

	public List<BoardVO> selectBoardList() throws Exception;
	void register(BoardVO vo) throws Exception;
	BoardVO read(int bno) throws Exception;
	void updateViewCnt(int bno) throws Exception;
	void modify(BoardVO vo) throws Exception;
	void delete(int bno) throws Exception;

	public List<BoardVO> listAll(String searchOption, String keyword) throws Exception;
	public int countArticle(String searchOption, String keyword) throws Exception;
	
	public int countBoard() throws Exception;
	public List<BoardVO> selectBoard(PagingVO vo) throws Exception;
	public List<BoardVO> listAll(String searchOption, String keyword, int start, int end);
	
	public void reply(BoardVO vo);
	public int getGroupOrderPosition(BoardVO vo);
	public int getMaxGroupOrder(BoardVO vo);
	public void updateGroupOrder(BoardVO vo);
	
	public void updateCommentCnt(Integer bno, int amount);
	
	

	void addAttach(String fullName) throws Exception;
	List<String> getAttach(Integer bno) throws Exception;
	void deleteAttach(Integer bno) throws Exception;
	void replaceAttach(String fullName, Integer bno) throws Exception;

}

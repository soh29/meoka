package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.ThemeVO;

public interface ThemeDAO {
	public List<ThemeVO> list() throws Exception;
	public int write(ThemeVO themeVo) throws Exception;
	public ThemeVO view(int themeNo) throws Exception;
	public void delete(int themeNo) throws Exception;
	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<ThemeVO> listPage(Criteria cri) throws Exception;

	public int listCount() throws Exception;
	// 목록+페이징+검색
	public List<ThemeVO> listSearch(SearchCriteria scri) throws Exception;

	// 게시물 검색
	public int countSearch(SearchCriteria scri) throws Exception;
}

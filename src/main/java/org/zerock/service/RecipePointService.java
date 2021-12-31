package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.SearchCriteria;

public interface RecipePointService {

	public List<RecipeVO> list() throws Exception;

	
	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<RecipeVO> listPage(Criteria cri) throws Exception;

	public int listCount() throws Exception;

	// 목록+페이징+검색
	public List<RecipeVO> listSearch(SearchCriteria scri) throws Exception;

	// 게시물 검색
	public int countSearch(SearchCriteria scri) throws Exception;
}
